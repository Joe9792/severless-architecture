variable "db_instance_identifier" {}
variable "db_name" {}
variable "username" {}
variable "password" {}

resource "aws_db_instance" "genomic_data_instance" {
  allocated_storage    = 20
  storage_type         = "gp2"
  engine               = "postgres"
  engine_version       = "12.3"
  instance_class       = "db.t3.micro"
  identifier           = var.db_instance_identifier
  db_name                 = var.db_name
  username             = var.username
  password             = var.password
  parameter_group_name = "default.postgres12"
  skip_final_snapshot  = true
  storage_encrypted    = true
}
