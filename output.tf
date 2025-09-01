output "public_ip" {
  value = aws_instance.server1.public_ip
}

output "vpc_id" {
  value = aws_vpc.vpc1.id

}