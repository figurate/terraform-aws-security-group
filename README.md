# ![AWS](aws-logo.png) Security Group

Purpose: Blueprints for AWS Security Groups.

![AWS Security Group](aws\_security\_group.png)

<div>Icons made by <a href="https://www.flaticon.com/authors/vitaly-gorbachev" title="Vitaly Gorbachev">Vitaly Gorbachev</a> from <a href="https://www.flaticon.com/" title="Flaticon">www.flaticon.com</a></div>
<div>Icons made by <a href="https://www.flaticon.com/authors/those-icons" title="Those Icons">Those Icons</a> from <a href="https://www.flaticon.com/" title="Flaticon">www.flaticon.com</a></div>

## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| aws | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| description | Security group description | `any` | `null` | no |
| egress\_rules | A list of egress rule identifiers | `list(string)` | `[]` | no |
| ingress\_rules | A list of ingress rule identifiers | `list(string)` | `[]` | no |
| name | Security group name | `any` | n/a | yes |
| vpc | Name of the VPC to deploy to | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| security\_group\_id | n/a |

