variable "name" {
  description = "Security group name"
}

variable "description" {
  description = "Security group description"
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
