##### Load Balancer #####
resource "aws_lb" "tfe_lb" {
  name                             = var.lb_name
  internal                         = false
  load_balancer_type               = "network"
  subnets                          = [var.lb_first_subnet, var.lb_second_subnet]
  enable_cross_zone_load_balancing = true
  enable_deletion_protection       = false

  tags = {
    Environment = var.aws_lb_tfe_lb_tag_name
  }
}

### LB Target groups ####
resource "aws_lb_target_group" "tg-443" {
  name     = var.port_443_tg_name
  port     = 443
  protocol = "TCP"
  vpc_id   = var.vpc_id

  health_check {
    protocol            = "HTTPS"
    port                = 443
    path                = "/_health_check"
    interval            = 30
    healthy_threshold   = 3
    unhealthy_threshold = 3
  }
}


resource "aws_lb_target_group" "tg-80" {
  name     = var.port_80_tg_name
  port     = 80
  protocol = "TCP"
  vpc_id   = var.vpc_id

  health_check {
    protocol            = "HTTP"
    port                = 80
    path                = "/"
    interval            = 30
    healthy_threshold   = 3
    unhealthy_threshold = 3
  }
}

resource "aws_lb_target_group" "tg-22" {
  name     = var.port_22_tg_name
  port     = 22
  protocol = "TCP"
  vpc_id   = var.vpc_id
}

resource "aws_lb_target_group" "tg-8800" {
  name     = var.port_8800_tg_name
  port     = 8800
  protocol = "TCP"
  vpc_id   = var.vpc_id
}

#### Load Balancer listeners ####
resource "aws_lb_listener" "to_443" {
  load_balancer_arn = aws_lb.tfe_lb.arn
  port              = "443"
  protocol          = "TCP"


  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg-443.arn
  }
}
#aws_lb_target_group.tg-443.arn
resource "aws_lb_listener" "to_80" {
  load_balancer_arn = aws_lb.tfe_lb.arn
  port              = "80"
  protocol          = "TCP"


  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg-80.arn
  }
}

resource "aws_lb_listener" "to_22" {
  load_balancer_arn = aws_lb.tfe_lb.arn
  port              = "22"
  protocol          = "TCP"


  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg-22.arn
  }
}

resource "aws_lb_listener" "to_8800" {
  load_balancer_arn = aws_lb.tfe_lb.arn
  port              = "8800"
  protocol          = "TCP"


  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg-8800.arn
  }
}