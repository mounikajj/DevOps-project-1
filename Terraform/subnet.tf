resource "aws_subnet" "this" {

  for_each = {
    s3-bucket-tf-az-1  = "10.0.1.0/24"
    s3-bucket-tf-az-2 = "10.0.2.0/24"
    s3-bucket-tf-az-3 = "10.0.3.0/24"
  }

  vpc_id     = aws_vpc.main.id
  cidr_block = each.value

  tags = {
    Name = each.key
  }
}

