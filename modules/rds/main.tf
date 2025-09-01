resource "aws_db_subnet_group" "main" {
  name       = "${var.project_name}-db-subnet-group"
  subnet_ids = var.db_subnet_ids

  tags = {
    Name = "${var.project_name}-db-subnet-group"
  }
}

resource "aws_db_instance" "wordpress" {
  identifier              = "${var.project_name}-rds"
  allocated_storage       = 20
  engine                  = "mysql"
  engine_version          = "8.0"
  instance_class          = "db.t3.micro"
  username                = var.db_username
  password                = var.db_password
  db_name                 = var.db_name
  multi_az                = true
  skip_final_snapshot     = true
  publicly_accessible     = false
  storage_encrypted       = false
  vpc_security_group_ids  = var.vpc_security_group_ids
  db_subnet_group_name    = aws_db_subnet_group.main.name

  tags = {
    Name = "${var.project_name}-rds"
  }
}
