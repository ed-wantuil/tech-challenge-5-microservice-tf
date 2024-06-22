resource "aws_ecr_repository" "techchallenge_repo_pedido" {
  name                 = "techchallenge-pedido"
  image_tag_mutability = "MUTABLE"
}

resource "aws_ecr_repository" "techchallenge_repo_pagamento" {
  name                 = "techchallenge-pagamento"
  image_tag_mutability = "MUTABLE"
}

resource "aws_ecr_repository" "techchallenge_repo_producao" {
  name                 = "techchallenge-producao"
  image_tag_mutability = "MUTABLE"
}
