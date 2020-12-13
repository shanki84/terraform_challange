resource "aws_lb" "test" {
  name               = "${var.default_tags["Project")}-$var.default_tags["Environment"]-NLB
  internal           = true
  load_balancer_type = "network"
  subnets            = module.ops_server.aws_subnet_private_id.id

  enable_deletion_protection = true

  tags = {
    Environment = $var.default_tags["Environment"]
  }
}