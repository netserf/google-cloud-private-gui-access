# google-cloud-private-gui-access

[![Actions Status](https://github.com/netserf/google-cloud-private-gui-access/workflows/Terraform%20Lint/badge.svg)](https://github.com/netserf/google-cloud-private-gui-access/actions)
[![Actions Status](https://github.com/netserf/google-cloud-private-gui-access/workflows/Docs/badge.svg)](https://github.com/netserf/google-cloud-private-gui-access/actions)

A review of some available options for accessing remote GUIs inside Google
Cloud when your organization restricts public IP address access.

Options for GUI access to be examined:

1. gcloud with SSH tunneling
2. gcloud to enable SOCKS proxied access - TODO
3. IAP for Windows - TODO

## Work Environment

These instructions assume you already have Google Cloud access and you're
working in the Cloud Shell. From here clone the repo and follow the build steps
below.

```bash
git clone https://github.com/netserf/google-cloud-private-gui-access.git
```

The Terraform infrastructure steps provided will build out GCE instances that
you can use to test your GUI access. Follow the infrastructure build
instructions to turn up your test environment, then follow the test steps to
test your GUI access.

Things to Consider:

- If you are inside a private GCP network, then you may need to turn on Cloud
NAT to enable egress access to the public Internet for package updates

## Infrastructure Build

The following are the infrastructure build steps using terraform.

Note - terraform is available in the Cloud Shell.

```bash
PROJECT_ID="YOUR_PROJECT_ID"
gcloud config set project ${PROJECT_ID}
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

TODO

sudo apt update
sudo apt install -y apache2

## Test Steps

1. gcloud with SSH tunneling

```bash
# workstation host
gcloud compute ssh bastion-instance -- -NL 30080:localhost:80
```

```bash
# test
curl -s localhost:30080 | head
```

(in the browser)  localhost:30080


## Clean Up

```bash
terraform destroy
```

## TODOs

- Consider adding the infrastructure build to the deployment pipeline.
