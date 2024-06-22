resource "aws_db_instance" "postgres_db" {
  identifier             = "postgres-db-instance"
  engine                 = "postgres"
  engine_version         = "15.4"
  instance_class         = "db.t3.micro"
  allocated_storage      = 20
  username               = var.master_username
  password               = var.master_password
  skip_final_snapshot    = true
  vpc_security_group_ids = ["sg-08ef7577a82a8f725"]
  publicly_accessible    = true
}
