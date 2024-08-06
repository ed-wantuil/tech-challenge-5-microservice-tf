resource "aws_sqs_queue" "tech_challenge_producao" {
  name                      = "tech_challenge_producao"
  delay_seconds             = 90
  max_message_size          = 2048
  message_retention_seconds = 86400
  visibility_timeout_seconds = 30
}

resource "aws_sqs_queue" "tech_challenge_pagamento" {
  name                      = "tech_challenge_pagamento"
  delay_seconds             = 90
  max_message_size          = 2048
  message_retention_seconds = 86400
  visibility_timeout_seconds = 30
}

resource "aws_sqs_queue" "tech_challenge_pagamento_status" {
  name                      = "tech_challenge_pagamento_status"
  delay_seconds             = 90
  max_message_size          = 2048
  message_retention_seconds = 86400
  visibility_timeout_seconds = 30
}
