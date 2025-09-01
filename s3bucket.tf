resource "aws_s3_bucket" "s3bucket" {
  bucket = "week7-bucket-des"

  tags = {
    Name = "week7-bucket-des"
    env  = "Dev"
  }
}