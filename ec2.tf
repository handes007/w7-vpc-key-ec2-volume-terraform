resource "aws_instance" "server1" {
  ami                    = "ami-02f624c08a83ca16f"
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.pusub1.id
  vpc_security_group_ids = [aws_security_group.web_server_sg.id]
  key_name               = aws_key_pair.key1.key_name
  user_data              = filebase64("setup.sh")

  tags = {
    Name = "Terraform_instance"
    env  = "Dev"
  }
}

// ebs volume


resource "aws_ebs_volume" "ebs1" {
  availability_zone = "us-east-1a"
  size              = 20

  tags = {
    Name = "Terraform_ebs_volume"
    env  = "Dev"
  }

}
resource "aws_volume_attachment" "att" {
  instance_id = aws_instance.server1.id
  volume_id   = aws_ebs_volume.ebs1.id
  device_name = "/dev/sdb"
}
 