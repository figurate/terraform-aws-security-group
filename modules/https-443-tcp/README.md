## Requirements

No requirements.

## Providers

No provider.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| description | An optional description for the security group | `any` | `null` | no |
| egress\_rules | A list of predefined rules for egress traffic | `list(string)` | <pre>[<br>  "allow-all"<br>]</pre> | no |
| name | Name of the firewall configuration | `any` | n/a | yes |
| vpc\_default | Use the default VPC | `bool` | `true` | no |
| vpc\_tags | Lookup tags to identify VPC | `map(any)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| security\_group\_id | n/a |
| security\_group\_name | n/a |

