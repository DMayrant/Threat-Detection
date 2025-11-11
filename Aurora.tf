resource "aws_rds_cluster" "aurora_postgresql" {
  engine                              = var.engine
  database_name                       = "AuroraDB"
  iam_database_authentication_enabled = true
  availability_zones                  = ["us-east-1a", "us-east-1b", "us-east-1c"]
  db_subnet_group_name   = aws_db_subnet_group.aurora_subnet_group.name
  vpc_security_group_ids = [aws_security_group.alb_sg.id]

  cluster_identifier      = "aurora-postgresql-cluster"
  master_username         = var.db_username
  master_password         = var.db_password
  skip_final_snapshot     = true
  preferred_backup_window = "07:00-09:00"

  tags = merge(local.common_tags, {
    Name = "Aurora-PostgreSQL-Cluster"
  })
}
