variable "name" {
  description = "Name of the firewall configuration"
}

variable "description" {
  description = "An optional description for the security group"
  default     = null
}

variable "vpc_default" {
  description = "Use the default VPC"
  default     = true
}

variable "vpc_tags" {
  type        = map(any)
  description = "Lookup tags to identify VPC"
  default     = {}
}

variable "egress_rules" {
  description = "A list of predefined rules for egress traffic"
  type        = list(string)
  default     = ["all-tcp", "all-udp"]
}
