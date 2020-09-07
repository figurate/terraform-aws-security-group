variable "name" {
  description = "Security group name"
}

variable "description" {
  description = "Security group description"
  default     = null
}

variable "vpc" {
  description = "Name of the VPC to deploy to"
}

variable "ingress_rules" {
  description = "A list of ingress rule identifiers"
  type        = list(string)
  default     = []
}

variable "egress_rules" {
  description = "A list of egress rule identifiers"
  type        = list(string)
  default     = []
}
