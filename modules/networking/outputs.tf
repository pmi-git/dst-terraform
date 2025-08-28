output "vpc_id" {
  value = aws_vpc.main.id
}

output "public_subnet_id" {
  value = aws_subnet.public.id
}

output "private_subnet_ids" {
  value = [aws_subnet.private1.id, aws_subnet.private2.id]
}

output "web_sg_id" {
  value = aws_security_group.web_sg.id
}

output "rds_sg_id" {
  value = aws_security_group.rds_sg.id
}
