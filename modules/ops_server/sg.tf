resource "aws_security_group" "ops_sg" {
    name = "${var.default_tags["project"]}-{var.default_tags["Environment"]}-ops-instance-sg
    vpc_id = data.aws_subnet.subnetlookup.vpc_id

    tags = merge(
       var.default_tags,
       merge(
          "Name", "${var.default_tags[Project]}-${var.default_tags[Environement]}-INSTANCE-SG
          )
       )
    }

resource "aws_security_group_rule" "instance_healty_check" {
   security_group_id = aws_security_group.ops_sg.id
   type              = "ingress"
   from_port         = 8091
   to_port           = 8091
   cidr_blocks       = [var.vpc.cidr]
   }