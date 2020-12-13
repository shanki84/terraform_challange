resource "aws_launch_configuration" "instance" {
  name_prefix                   = "${var.default_tags["Project")}-$var.default_tags["Environment"]-instance
  count                         = var.instance_count
  ami                           = var.instance_ami
  instance_type                 = var.ec2_instance_type
  associate_public_ip_address   = false
  security_group_id             = module_ops_server_instance_sg.id
  subnet_id                     = var.ec2_subnet_id
  iam_instance_profile          = aws_iam_instance_profile.ops_instance_profile.name

  user_data = <<-EOF
              #!/bin/bash
              yum install -y java-1.8.0-openjdk-devel wget git
              export JAVA_HOME=/etc/alternatives/java_sdk_1.8.0
              wget http://repos.fedorapeople.org/repos/dchen/apache-maven/epel-apache-maven.repo -O /etc/yum.repos.d/epel-apache-maven.repo
              sed -i s/\$releasever/6/g /etc/yum.repos.d/epel-apache-maven.repo
              yum install -y apache-maven
              git clone https://github.com/shanki84/terraform_challange.git
              cd terraform_challange/web_app/server
              nohup mvn spring-boot:run -Dspring.datasource.url=jdbc:postgresql://"${module.rds.aws_rds_cluster_instance.}:${var.db_port}/${var.db_name}" -Dspring.datasource.username="${var.db_username}" -Dspring.datasource.password="${var.db_password}" -Dserver.port="${var.app_port}" &> mvn.out &
              EOF
  lifecycle {
    create_before_destroy = true
  }

}

  tags = merge(
    var.default_tags,
    map(
        "Name", "${var.default_tags["Project")}-$var.default_tags["Environment"]-TEMPLATE
        )
      )
}
