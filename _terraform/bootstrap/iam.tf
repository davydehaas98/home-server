resource "aws_iam_openid_connect_provider" "github" {
  url             = "https://token.actions.githubusercontent.com"
  client_id_list  = ["sts.amazonaws.com"]
  thumbprint_list = ["6938fd4d98bab03faadb97b34396831e3780aea1"]
}

locals {
  github_oidc_sub_condition = {
    StringLike = {
      "token.actions.githubusercontent.com:sub" = "repo:davydehaas98/home-server:*"
    }
    StringEquals = {
      "token.actions.githubusercontent.com:aud" = "sts.amazonaws.com"
    }
  }

  state_bucket_arn = "arn:aws:s3:::davydehaas-terraform-state"
}

resource "aws_iam_role" "github_aws" {
  name = "github-aws"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect    = "Allow"
      Principal = { Federated = aws_iam_openid_connect_provider.github.arn }
      Action    = "sts:AssumeRoleWithWebIdentity"
      Condition = local.github_oidc_sub_condition
    }]
  })
}

resource "aws_iam_role_policy" "github_aws_budgets" {
  name = "budgets"
  role = aws_iam_role.github_aws.name

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "budgets:CreateBudget",
          "budgets:ModifyBudget",
          "budgets:DescribeBudget",
          "budgets:ViewBudget",
          "budgets:ListTagsForResource"
        ]
        Resource = "*"
      }
    ]
  })
}

resource "aws_iam_role_policy" "github_aws_state" {
  name = "terraform-state"
  role = aws_iam_role.github_aws.name

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "s3:GetBucketAcl",
          "s3:GetBucketCORS",
          "s3:GetBucketLocation",
          "s3:GetBucketPolicy",
          "s3:GetBucketVersioning",
          "s3:GetBucketWebsite"
        ]
        Resource = local.state_bucket_arn
      },
      {
        Effect   = "Allow"
        Action   = "s3:ListBucket"
        Resource = local.state_bucket_arn
        Condition = {
          StringLike = { "s3:prefix" = ["aws/*"] }
        }
      },
      {
        Effect = "Allow"
        Action = [
          "s3:GetObject",
          "s3:PutObject",
          "s3:DeleteObject"
        ]
        Resource = "${local.state_bucket_arn}/aws/*"
      }
    ]
  })
}

resource "aws_iam_role" "github_state_cloudflare_dev" {
  name = "github-state-cloudflare-dev"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect    = "Allow"
      Principal = { Federated = aws_iam_openid_connect_provider.github.arn }
      Action    = "sts:AssumeRoleWithWebIdentity"
      Condition = local.github_oidc_sub_condition
    }]
  })
}

resource "aws_iam_role_policy" "github_state_cloudflare_dev" {
  name = "terraform-state-cloudflare-dev"
  role = aws_iam_role.github_state_cloudflare_dev.name

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "s3:GetBucketAcl",
          "s3:GetBucketCORS",
          "s3:GetBucketLocation",
          "s3:GetBucketPolicy",
          "s3:GetBucketVersioning",
          "s3:GetBucketWebsite"
        ]
        Resource = local.state_bucket_arn
      },
      {
        Effect   = "Allow"
        Action   = "s3:ListBucket"
        Resource = local.state_bucket_arn
        Condition = {
          StringLike = { "s3:prefix" = ["cloudflare/davydehaas.dev/*"] }
        }
      },
      {
        Effect = "Allow"
        Action = [
          "s3:GetObject",
          "s3:PutObject",
          "s3:DeleteObject"
        ]
        Resource = "${local.state_bucket_arn}/cloudflare/davydehaas.dev/*"
      }
    ]
  })
}

resource "aws_iam_role" "github_state_cloudflare_nl" {
  name = "github-state-cloudflare-nl"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect    = "Allow"
      Principal = { Federated = aws_iam_openid_connect_provider.github.arn }
      Action    = "sts:AssumeRoleWithWebIdentity"
      Condition = local.github_oidc_sub_condition
    }]
  })
}

resource "aws_iam_role_policy" "github_state_cloudflare_nl" {
  name = "terraform-state-cloudflare-nl"
  role = aws_iam_role.github_state_cloudflare_nl.name

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "s3:GetBucketAcl",
          "s3:GetBucketCORS",
          "s3:GetBucketLocation",
          "s3:GetBucketPolicy",
          "s3:GetBucketVersioning",
          "s3:GetBucketWebsite"
        ]
        Resource = local.state_bucket_arn
      },
      {
        Effect   = "Allow"
        Action   = "s3:ListBucket"
        Resource = local.state_bucket_arn
        Condition = {
          StringLike = { "s3:prefix" = ["cloudflare/davydehaas.nl/*"] }
        }
      },
      {
        Effect = "Allow"
        Action = [
          "s3:GetObject",
          "s3:PutObject",
          "s3:DeleteObject"
        ]
        Resource = "${local.state_bucket_arn}/cloudflare/davydehaas.nl/*"
      }
    ]
  })
}

resource "aws_iam_role" "github_state_oci" {
  name = "github-state-oci"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect    = "Allow"
      Principal = { Federated = aws_iam_openid_connect_provider.github.arn }
      Action    = "sts:AssumeRoleWithWebIdentity"
      Condition = local.github_oidc_sub_condition
    }]
  })
}

resource "aws_iam_role_policy" "github_state_oci" {
  name = "terraform-state-oci"
  role = aws_iam_role.github_state_oci.name

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "s3:GetBucketAcl",
          "s3:GetBucketCORS",
          "s3:GetBucketLocation",
          "s3:GetBucketPolicy",
          "s3:GetBucketVersioning",
          "s3:GetBucketWebsite"
        ]
        Resource = local.state_bucket_arn
      },
      {
        Effect   = "Allow"
        Action   = "s3:ListBucket"
        Resource = local.state_bucket_arn
        Condition = {
          StringLike = { "s3:prefix" = ["oci/*"] }
        }
      },
      {
        Effect = "Allow"
        Action = [
          "s3:GetObject",
          "s3:PutObject",
          "s3:DeleteObject"
        ]
        Resource = "${local.state_bucket_arn}/oci/*"
      }
    ]
  })
}
