output "instance_ami" {
  value = data.aws_ami.ops_ami.id
}

output "ec2_subnet_id" {
  value = aws_subnet.main.id
  }

output "instance_sg" {
  value = aws_security_group.ops_sg.id
  }