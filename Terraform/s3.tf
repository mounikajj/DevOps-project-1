resource "aws_s3_bucket" "s3_buckets" {

  for_each = toset([
    "for-each-demo-bucket-terraform",
    "for-each-demo-bucket-terraform",
    "for-each-demo-bucket-terraform"
  ])

  bucket = each.value
}

