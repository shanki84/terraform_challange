module "ops-server" {
    source = "./modules/ops_server"
    instance_count      =   var.number_of_instance
    instance_ami        =   modules.ops_server.instance_ami
    ec2_subnet_id       =   modules.ops_server.ec2_subnet_id
    ec2_instance_type   =   var.instance_size[terraform.workspace]
    instance_sg         =   modules.ops_server.aws_security_group.ops_sg.id
}

module "mydb" {
    source = "./modules/rds"
    rds_instance_count = var.rds_instance_count
    instance_type = var.rds_instance_type[terraform.workspace]
}
