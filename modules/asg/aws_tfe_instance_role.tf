resource "aws_iam_role" "tfe_instance" {
  name = var.tfe_instance_role_name

  assume_role_policy = <<-EOF
  {
    "Version": "2012-10-17",
    "Statement": [
      {
        "Action": "sts:AssumeRole",
        "Principal": {
          "Service": "ec2.amazonaws.com"
        },
        "Effect": "Allow",
        "Sid": ""
      }
    ]
  }
  EOF
}

resource "aws_iam_role_policy" "policy" {
  name = var.tfe_instance_policy_name
  role = aws_iam_role.tfe_instance.id

  policy = <<-EOF
  {
    "Version": "2012-10-17",
    "Statement": [
      {
        "Action": [
          "s3:*"
        ],
        "Effect": "Allow",
        "Resource": "*"
      }
    ]
  }
  EOF
}

resource "aws_iam_instance_profile" "tfe_instance" {
  name = var.tfe_instance_profile_name
  role = aws_iam_role.tfe_instance.name
}