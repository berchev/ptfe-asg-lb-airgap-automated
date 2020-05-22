
output "tfe_asg_name" {
  value       = aws_autoscaling_group.tfe_asg.name
  description = "Name of created TFE ASG"
}