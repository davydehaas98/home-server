# AWS Terraform Bootstrap

One-time setup to create the S3 state bucket and configure GitHub Actions OIDC.
Run this when starting from scratch with only a root AWS account.

## Prerequisites

- AWS root account access
- AWS CLI installed
- Terraform >= 1.10 installed

## Steps

### 1. Create IAM user

In the AWS console (do not use root for day-to-day operations):

1. IAM → Users → Create user → name: `Davy`
2. Attach policy: `AdministratorAccess`
3. Security credentials → Create access key → CLI → save the key ID and secret

### 2. Configure local credentials

Export credentials for the session (nothing is written to disk):

```sh
export AWS_ACCESS_KEY_ID=<key id>
export AWS_SECRET_ACCESS_KEY=<secret>
export AWS_DEFAULT_REGION=eu-central-1
```

### 3. Bootstrap local state

The S3 bucket does not exist yet, so the S3 backend must be disabled temporarily.

Comment out the backend block in `main.tf`:

```hcl
# backend "s3" {
#   bucket       = "davydehaas-terraform-state"
#   key          = "aws/terraform.tfstate"
#   region       = "eu-central-1"
#   use_lockfile = true
#   encrypt      = true
# }
```

Initialize:

```sh
terraform init
```

Import any resources that already exist in AWS to avoid conflicts:

```sh
terraform import aws_iam_user.davy Davy
terraform import aws_iam_group.administrators Administrators
terraform import aws_iam_group_membership.administrators_membership Administrators
terraform import "aws_iam_group_policy_attachment.administrators" "Administrators/arn:aws:iam::aws:policy/AdministratorAccess"
```

Apply:

```sh
terraform apply
```

This creates the S3 bucket, OIDC provider, and role, and lets Terraform adopt the IAM resources.

### 4. Migrate state to S3

Restore the backend block in `main.tf`, then migrate:

```sh
terraform init -migrate-state
```

### 5. Configure GitHub Actions

The workflow uses `aws-actions/configure-aws-credentials` with OIDC — no static credentials needed.
Get your account ID:

```sh
aws sts get-caller-identity --query Account --output text
```

Add the role ARN as a secret in GitHub (Settings → Secrets → Actions):

- Name: `AWS_ROLE_ARN`
- Value: `arn:aws:iam::<ACCOUNT_ID>:role/github-actions-terraform`

Remove the `AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY` secrets from GitHub if they exist.

### 6. Delete the access key

In the AWS console: IAM → Users → Davy → Security credentials → Delete access key.

The root account and the `Davy` IAM user are now only needed for AWS console access.
GitHub Actions authenticates via OIDC with short-lived tokens.
