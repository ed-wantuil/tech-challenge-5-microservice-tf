resource "aws_eks_cluster" "eks_cluster" {
  name     = var.cluster_name
  version  = var.eks_version
  role_arn = "arn:aws:iam::358266770835:role/LabRole"

  vpc_config {
    subnet_ids         = ["subnet-027b65802f027ef4b", "subnet-0fee927bc2bc9d133"]
    security_group_ids = ["sg-08ef7577a82a8f725"]
  }
}

resource "aws_eks_node_group" "eks_node_group" {
  cluster_name    = aws_eks_cluster.eks_cluster.name
  node_group_name = "node_eks"
  node_role_arn   = "arn:aws:iam::358266770835:role/LabRole"
  subnet_ids      = ["subnet-027b65802f027ef4b", "subnet-0fee927bc2bc9d133"]

  scaling_config {
    desired_size = 2
    max_size     = 3
    min_size     = 1
  }

  instance_types = ["t3.medium"]

  depends_on = [aws_eks_cluster.eks_cluster]
}
