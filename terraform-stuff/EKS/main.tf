resource "aws_eks_cluster" "eks" {
  name     = "eks-cluster"
  role_arn = "arn:aws:iam::484643051390:role/Cluster_Role"

  vpc_config {
    subnet_ids = [var.sub1-id, var.sub2-id]
    security_group_ids = [var.sec-id]
  }

}

resource "aws_eks_node_group" "cluster-node" {
  cluster_name    = "eks-cluster"
  node_group_name = "default"
  node_role_arn   = "arn:aws:iam::484643051390:role/NodeInstanceRole"
  subnet_ids      = [var.sub1-id, var.sub2-id]
  instance_types = ["t3.medium"]

  scaling_config {
    desired_size = 2
    max_size     = 2
    min_size     = 2
  }

}
