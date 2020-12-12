  resource "aws_security_group" "rds" {
  name = "${format("%s-rds-sg", var.project)}"

  vpc_id = module.network.aws_vpc.vpc_main.id

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["${module.ops_server_private_subnets_cidr_blocks}"]
  }

  tags {
    Group = "${var.project}"
  }

}
