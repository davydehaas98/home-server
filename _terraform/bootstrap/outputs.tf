output "github_aws_role_arn" {
  value = aws_iam_role.github_aws.arn
}

output "github_state_cloudflare_dev_role_arn" {
  value = aws_iam_role.github_state_cloudflare_dev.arn
}

output "github_state_cloudflare_nl_role_arn" {
  value = aws_iam_role.github_state_cloudflare_nl.arn
}

output "github_state_oci_role_arn" {
  value = aws_iam_role.github_state_oci.arn
}
