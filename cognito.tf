resource "aws_cognito_user_pool" "techchallenge-pool" {
  name = "techchallenge-pool"

  lambda_config {
    define_auth_challenge          = aws_lambda_function.auth.arn
    create_auth_challenge          = aws_lambda_function.auth.arn
    verify_auth_challenge_response = aws_lambda_function.auth.arn
  }

}

resource "aws_cognito_user_pool_client" "techchallenge-client" {
  name                         = "techchallenge-client"
  user_pool_id                 = aws_cognito_user_pool.techchallenge-pool.id
  explicit_auth_flows          = ["CUSTOM_AUTH_FLOW_ONLY"]

}
