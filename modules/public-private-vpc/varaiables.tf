variable "vpc_cidr" {
  description = "ciderblock for VPC."
}

variable "public_subnets_cidr" {
  description = "ciderblock for public subnet."
}

variable "availability_zones" {
  description = "availability_zones for region"
}

variable "private_subnets_cidr" {
  description = "ciderblock for private subnet."
}

variable "name" {
  description = "the name of vpc."
}

variable "Nat_name" {
  description = "the name of nat of public vpc."
  default     = "main_NAT"
}

variable "public_subnets" {
  description = "A list of public subnets inside the VPC"
  type        = list(string)
  default     = []
}

variable "private_subnets" {
  description = "A list of private subnets inside the VPC"
  type        = list(string)
  default     = []
}
