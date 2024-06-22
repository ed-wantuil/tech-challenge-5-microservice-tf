resource "aws_dynamodb_table" "payment_table" {
  name           = "payment"
  read_capacity  = 5
  write_capacity = 5
  hash_key       = "orderId"

  attribute {
    name = "orderId"
    type = "S"
  }
}

resource "aws_dynamodb_table" "delivery_table" {
  name           = "delivery"
  read_capacity  = 5
  write_capacity = 5
  hash_key       = "orderId"

  attribute {
    name = "orderId"
    type = "S"
  }
}