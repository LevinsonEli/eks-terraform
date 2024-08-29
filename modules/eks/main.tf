resource "aws_eks_cluster" "eks" {
  name     = "${var.naming_prefix}-${var.project_name}-cluster"
  role_arn = var.cluster_role_arn
  version = var.cluster_version

  vpc_config {
    subnet_ids = var.subnet_ids
  }

  tags = merge(
    var.bootcamp_tags,
    {
      Name = "${var.naming_prefix}-${var.project_name}-cluster"
    }
  )
}

resource "aws_eks_node_group" "eks_node_group" {
  cluster_name    = aws_eks_cluster.eks.name
  node_group_name = "${var.naming_prefix}-${var.project_name}-node-group"
  node_role_arn   = var.node_role_arn
  subnet_ids      = var.subnet_ids
  instance_types = [var.instance_type]

  scaling_config {
    desired_size = var.desired_capacity
    max_size     = var.max_capacity
    min_size     = var.min_capacity
  }

  # remote_access {
  #   ec2_ssh_key = var.key_name
  # }

  tags = merge(
    var.bootcamp_tags,
    {
      Name = "${var.naming_prefix}-${var.project_name}-node-group"
    }
  )
}

# Adds-On
resource "aws_eks_addon" "ebs_csi_driver" {
  cluster_name = aws_eks_cluster.eks.name
  addon_name   = "aws-ebs-csi-driver"
  addon_version = "v1.27.0-eksbuild.1"

  tags = merge(
    var.bootcamp_tags,
    {
      Name = "aws-ebs-csi-driver"
    }
  )
}

resource "aws_eks_addon" "vpc_cni" {
  cluster_name = aws_eks_cluster.eks.name
  addon_name   = "vpc-cni"
  addon_version = "v1.17.1-eksbuild.1"

  tags = merge(
    var.bootcamp_tags,
    {
      Name = "vpc-cni"
    }
  )
}

resource "aws_eks_addon" "coredns" {
  cluster_name  = aws_eks_cluster.eks.name
  addon_name    = "coredns"
  addon_version = "v1.10.1-eksbuild.7"

  tags = merge(
    var.bootcamp_tags,
    {
      Name = "coredns"
    }
  )
}
