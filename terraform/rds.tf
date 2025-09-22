resource "aws_db_instance" "task_db" {
  identifier                          = "task-tracker-db"
  engine                              = "postgres"
  engine_version                      = "15.5"
  instance_class                      = "db.t4g.micro"
  allocated_storage                   = 20
  storage_encrypted                   = true
  publicly_accessible                 = false
  vpc_security_group_ids              = [aws_security_group.rds_sg.id]
  db_subnet_group_name                = aws_db_subnet_group.main.name
  iam_database_authentication_enabled = true
  skip_final_snapshot                 = true
}

resource "aws_security_group" "rds_sg" {
  vpc_id = aws_vpc.main.id
  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/16"] # Update later to restrict to EC2/ECS
  }
}
