# Bootstrap

Creates the S3 state bucket and the GitHub Actions OIDC roles used by every
other Terraform stack in this repo (`aws/`, `cloudflare/*`). This stack is
applied locally, by hand, and never via CI.

It creates one role per stack instead of one shared role, so that no workflow
can touch another stack's state. Each role's S3 access is scoped to that
stack's own key prefix in the bucket, plus whatever other AWS resource
permissions that stack's provider block actually uses — add more actions to
a role as its stack grows. Each role is assumed directly via OIDC, and none
of them can manage themselves or IAM/OIDC.

Every other stack (`aws/`, `cloudflare/*`) is applied only through its
GitHub Actions workflow, never locally.

## Prerequisites

- AWS root account access
- AWS CLI installed
- Terraform >= 1.10 installed

## Initial setup (one time only)

### 1. Create IAM user

In the AWS console (do not use root for day-to-day operations):

1. IAM → Users → Create user → name: `Davy`
2. Attach policy: `AdministratorAccess`
3. Security credentials → Create access key → CLI → save the key ID and secret

### 2. Configure local credentials

Write the key to `~/.aws/credentials` directly (never `export`/paste it into
a terminal session that's shared with anyone else, e.g. an AI coding
assistant transcript):

```sh
aws configure --profile bootstrap
# enter the access key id / secret / region eu-central-1
```

### 3. Bootstrap local state

The S3 bucket does not exist yet, so the S3 backend must be disabled temporarily.

Comment out the `backend "s3"` block in `main.tf`:

```hcl
# backend "s3" {
#   bucket       = "davydehaas-terraform-state"
#   key          = "bootstrap/terraform.tfstate"
#   region       = "eu-central-1"
#   use_lockfile = true
#   encrypt      = true
# }
```

Initialize and apply:

```sh
AWS_PROFILE=bootstrap terraform init
AWS_PROFILE=bootstrap terraform apply
```

This creates the S3 bucket, the OIDC provider, and the GitHub Actions roles.

### 4. Migrate state to S3

Restore the backend block in `main.tf`, then migrate:

```sh
AWS_PROFILE=bootstrap terraform init -migrate-state
```

From now on, `bootstrap`'s own state lives in the same bucket it manages
(key `bootstrap/terraform.tfstate`) — no local state file to keep track of.

### 5. Configure GitHub Actions

The `aws/` and `cloudflare/*` workflows use `aws-actions/configure-aws-credentials`
with OIDC — no static credentials needed.

Read the role ARNs:

```sh
aws sts get-caller-identity --query Account --output text
```

Role ARNs aren't secret (the trust policy is what actually gates access), so
the workflows build them from the role name plus your account ID. Add the
account ID as a secret in GitHub (Settings → Secrets → Actions):

- `AWS_ACCOUNT_ID`

That's the only secret each workflow's `role-to-assume` needs — it's
combined with a hardcoded role name (e.g. `github-aws`) in the
workflow YAML.

The root account / `Davy` IAM user credentials stay in `~/.aws/credentials`
under the `bootstrap` profile — you'll need them again any time you change
something in this stack. GitHub Actions itself authenticates via OIDC with
short-lived tokens and never sees these credentials.

## Making changes later

Once the initial setup above is done, changing anything in `bootstrap/`
(e.g. widening the CI role's permissions for a new stack) is just:

```sh
cd _terraform/bootstrap
AWS_PROFILE=bootstrap terraform plan
AWS_PROFILE=bootstrap terraform apply
```

No backend juggling needed — that was only required for the very first apply,
before the state bucket existed.
