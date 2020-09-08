## Requirements

No requirements.

## Providers

No provider.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| description | An optional description for the security group | `any` | `null` | no |
| egress\_rules | A list of predefined rules for egress traffic | `list(string)` | <pre>[<br>  "all-tcp",<br>  "all-udp"<br>]</pre> | no |
| name | Name of the firewall configuration | `any` | n/a | yes |
| vpc | Name of the VPC to deploy to | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| security\_group\_id | n/a |

