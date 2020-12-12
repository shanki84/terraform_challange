resource "aws_instance" "instance"
  count                         = var.instance_count
  ami                           = var.instance_ami
  instance_type                 = var.ec2_instance_type
  associate_public_ip_address   = false
  vpc_security_group_id         = var.instance_sg
  subnet_id                     = var.ec2_subnet_id
  iam_instance_profile          = aws_iam_instance_profile.ops_instance_profile.name
  userdata                      = base64encode(templatefile("${path.module}/templates/userdata.sh, {
    hostname                    = "${var.default_tags["Project"]}-$var.default_tags["Environment"]-instance
  }))

  tags = merge(
    var.default_tags,
    map(
        "Name", "${var.default_tags["Project")}-$var.default_tags["Environment"]-TEMPLATE
        )
      )