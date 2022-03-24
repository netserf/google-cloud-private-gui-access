# google-cloud-private-gui-access

[![Actions Status](https://github.com/netserf/google-cloud-private-gui-access/workflows/Terraform%20Lint/badge.svg)](https://github.com/netserf/google-cloud-private-gui-access/actions)
[![Actions Status](https://github.com/netserf/google-cloud-private-gui-access/workflows/Docs/badge.svg)](https://github.com/netserf/google-cloud-private-gui-access/actions)

A review of some available options for accessing remote GUIs inside Google
Cloud when your organization restricts public IP address access.

Options for GUI access to be examined:

1. gcloud with SSH tunneling

2. gcloud to enable SOCKS proxied access

3. IAP - TBD

## Work Environment

These instructions assume you already have Google Cloud access and you're
working in the Cloud Shell. From here clone the repo and follow the build steps
below.

```bash
git clone https://github.com/netserf/google-cloud-private-gui-access.git
```

## Infrastructure Build

The following are the infrastructure build steps using terraform.

Note - terraform is available in the Cloud Shell.

```bash
cd terraform
```

Pull the providers:

```bash
terraform init
```

Review  the plan:

```bash
terraform plan
```

Apply the updates:

```bash
terraform apply
```

## Clean Up

```bash
terraform destroy
```

## TODOs

- Consider adding the infrastructure build to the deployment pipeline.
