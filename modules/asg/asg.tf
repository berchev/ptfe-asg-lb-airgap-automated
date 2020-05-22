# settings.json file represeted as template 
data "template_file" "settinngs_json" {
  template = file("${path.module}/../../scripts/settings.json.tpl")

  vars = {
    pg_dbname      = var.db_name
    pg_netloc      = var.pg_netloc
    hostname       = var.dns_name_tfe
    pg_password    = var.db_password
    enc_password   = var.tfe_instance_password
    pg_user        = var.db_username
    s3_data_bucket = var.data_bucket_name
    s3_region      = var.aws_region
  }
}

# replicated.conf file represented as template
data "template_file" "replicated_conf" {
  template = file("${path.module}/../../scripts/replicated.conf.tpl")

  vars = {
    DaemonAuthenticationPassword = var.db_password
    TlsBootstrapHostname         = var.dns_name_tfe
    tfe_package                  = var.airgap_package
    s3_region                    = var.aws_region
    snapshot_bucket_name         = var.snapshot_bucket_name
    access_key                   = var.access_key
    secret_key                   = var.secret_key
  }
}

# bootstraping script represented as a template 
data "template_file" "bootstrap_sh" {
  template = file("${path.module}/../../scripts/bootstrap.sh")

  vars = {
    location_path       = var.tfe_airgap_bucket_location
    tfe_package         = var.airgap_package
    bootstrap_installer = var.replicated_tar
  }
}

data "template_cloudinit_config" "tfe_setup" {
  gzip          = true
  base64_encode = true

  part {
    filename     = "init.cfg"
    content_type = "text/cloud-config"
    content      = <<EOF
#cloud-config
write_files:
  - content: |
      ${base64encode("${data.template_file.settinngs_json.rendered}")}
    encoding: b64
    owner: root:root
    path: /opt/tfe-installer/settings.json
    permissions: '0644'

  - content: |
      ${base64encode("${data.template_file.replicated_conf.rendered}")}
    encoding: b64
    owner: root:root
    path: /etc/replicated.conf
    permissions: '0644'

  - content: |
      ${base64encode("${data.template_file.bootstrap_sh.rendered}")}
    encoding: b64
    owner: root:root
    path: /opt/tfe-installer/bootstrap.sh
    permissions: '0755'

runcmd:
  - /opt/tfe-installer/bootstrap.sh
EOF
  }

  part {
    content = data.template_file.settinngs_json.rendered
  }

  part {
    content = data.template_file.replicated_conf.rendered
  }

  part {
    content = data.template_file.bootstrap_sh.rendered
  }

}

resource "aws_launch_configuration" "tfe_instance" {
  image_id                    = var.ami
  instance_type               = var.instance_type
  key_name                    = var.key_name
  security_groups             = [aws_security_group.tfe_sg.id]
  iam_instance_profile        = aws_iam_instance_profile.tfe_instance.name
  user_data_base64            = data.template_cloudinit_config.tfe_setup.rendered
  associate_public_ip_address = false

  root_block_device {
    volume_size = var.tfe_instance_volume_size
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "tfe_asg" {
  name                 = var.aws_autoscaling_group_name
  launch_configuration = aws_launch_configuration.tfe_instance.id
  vpc_zone_identifier  = [var.tfe_first_private_subnet, var.tfe_second_private_subnet]
  health_check_type    = "ELB"
  target_group_arns    = [var.lb_target_group_443_arn, var.lb_target_group_80_arn, var.lb_target_group_22_arn, var.lb_target_group_8800_arn]
  # Generous time untill TFE health check start
  health_check_grace_period = 3600
  wait_for_capacity_timeout = 0

  min_size = 1
  max_size = 1

  tag {
    key                 = "Name"
    value               = var.aws_autoscaling_group_tfe_asg_tag_name
    propagate_at_launch = true
  }
}

resource "aws_autoscaling_attachment" "asg_443" {
  autoscaling_group_name = aws_autoscaling_group.tfe_asg.id
  alb_target_group_arn   = var.lb_target_group_443_arn
}

resource "aws_autoscaling_attachment" "asg_80" {
  autoscaling_group_name = aws_autoscaling_group.tfe_asg.id
  alb_target_group_arn   = var.lb_target_group_80_arn
}

resource "aws_autoscaling_attachment" "asg_22" {
  autoscaling_group_name = aws_autoscaling_group.tfe_asg.id
  alb_target_group_arn   = var.lb_target_group_22_arn
}

resource "aws_autoscaling_attachment" "asg_8800" {
  autoscaling_group_name = aws_autoscaling_group.tfe_asg.id
  alb_target_group_arn   = var.lb_target_group_8800_arn
}