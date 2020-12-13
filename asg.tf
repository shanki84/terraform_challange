resource "aws_autoscaling_group" "instance_asg" {
  name                 = "terraform-asg-example"
  launch_configuration = module.ops_server.aws_launch.id
  min_size             = 2
  max_size             = 3

  lifecycle {
    create_before_destroy = true
  }
}