resource "aws_s3_bucket" "b" {
  bucket = "billybucket"

  tags = {
    Name        = "billybucket"
    Environment = "Dev"
  }
}
