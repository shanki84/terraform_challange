resource "aws_security_group" "ops_sg" {
    name = "${var.default_tags["project"]}-{var.default_tags["Environment"]}-ops-instance-sg
    vpc_id = data.aws_subnet.subnetlookup.vpc_id

    tags = merge(
       var.default_tags,
       merge(
          "Name", "${var.default_tags[Project]}-${var.default_tags[Environment]}-INSTANCE-SG
          )
       )
    }

resource "aws_security_group_rule" "instance_healty_check" {
   security_group_id = aws_security_group.ops_sg.id
   type              = "ingress"
   from_port         = 8091
   to_port           = 8091
   cidr_blocks       = [var.vpc.cidr]

  ingress {
    from_port   = "22"
    to_port     = "22"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = "0"
    to_port     = "65535"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  lifecycle {
    create_before_destroy = true
  }
 }