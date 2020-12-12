resource "aws_rds_cluster_instance" "cluster_instances" {
  count              = var.rds_instance_count
  identifier         = "aurora-cluster-kpmg-${count.index}"
  cluster_identifier = aws_rds_cluster.mydb.id
  instance_class     = var.instance_type
  engine             = aws_rds_cluster.mydb.engine
  engine_version     = aws_rds_cluster.mydb.engine_version
}

resource "aws_rds_cluster" "mydb" {
  cluster_identifier = "aurora-cluster-kpmg"
  availability_zones = ["us-west-2a", "us-west-2b", "us-west-2c"]
  database_name      = "mydb"
  master_username    = "foo"
  backup_retention_period = 5
  preferred_backup_window = "07:00-09:00"
  master_password    = "barbut8chars"
}