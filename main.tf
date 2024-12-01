module "launch_template" {
  source            = "./modules/launch_template"
  name_prefix       = "example-lt"
  ami_id            = var.ami_id # Replace with your AMI IDs
  instance_type     = var.instance_type
  key_pair          = "tf-test"
  security_groups   = var.security_groups # Replace with your Security Group ID
  tags = {
    Environment = "Production"
  }
}

module "autoscaling" {
  source              = "./modules/autoscaling"
  desired_capacity    = 2
  max_size            = 5
  min_size            = 1
  launch_template_id  = module.launch_template.launch_template_id
  subnets             = var.subnet # Replace with your Subnet IDs
  name                = "test-asg"
  tag_name            = "ec2-instance"
}

module "cloudwatch" {
  source                  = "./modules/cloudwatch"
  high_cpu_alarm_name     = "HighCPU"
  low_cpu_alarm_name      = "LowCPU"
  evaluation_periods      = 2
  period                  = 60
  high_threshold          = 30
  low_threshold           = 10
  auto_scaling_group_name = module.autoscaling.autoscaling_group_name
  scale_up_policy_arn     = module.autoscaling.scale_up_policy_arn
  scale_down_policy_arn   = module.autoscaling.scale_down_policy_arn
}