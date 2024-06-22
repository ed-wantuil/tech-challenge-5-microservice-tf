resource "aws_secretsmanager_secret" "techchallenge" {
  name        = "techchallenge-final-3"
  description = "Vault do techchallenge"
}

resource "aws_secretsmanager_secret_version" "techchallenge" {
  secret_id     = aws_secretsmanager_secret.techchallenge.id
  secret_string = jsonencode({
    username = var.master_username
    password = var.master_password
  })
}
