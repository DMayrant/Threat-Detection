variable "private_subnet_count" {
  type    = number
  default = 6

}

variable "public_subnet_count" {
  type    = number
  default = 6

}

variable "availability_zones" {
  type    = list(string)
  default = ["us-east-1a", "us-east-1b", "us-east-1c"]

}

variable "public_subnet_cidrs" {
  description = "CIDR blocks for public subnets"
  type        = list(string)
  default = [
    "10.45.10.0/24",
    "10.45.12.0/24",
    "10.45.32.0/24",
    "10.45.42.0/24",
    "10.45.52.0/24",
    "10.45.62.0/24"
  ]
}

variable "private_subnet_cidrs" {
  description = "CIDR blocks for private subnets"
  type        = list(string)
  default = [
    "10.45.100.0/24",
    "10.45.110.0/24",
    "10.45.120.0/24",
    "10.45.130.0/24",
    "10.45.140.0/24",
    "10.45.150.0/24"
  ]
}

variable "aurora_subnet_cidrs" {
  description = "CIDR blocks for private subnets"
  type        = list(string)
  default = [
    "10.45.200.0/24",
    "10.45.210.0/24",
    "10.45.220.0/24",
    "10.45.230.0/24",
    "10.45.240.0/24",
    "10.45.250.0/24"
  ]
}

variable "engine" {
  type        = string
  default     = "aurora-postgresql"
  description = "The engine of the Aurora DB cluster"

  validation {
    condition     = contains(["aurora-postgresql"], var.engine)
    error_message = <<-EOT
        This engine must contain: 'aurora-postgresql'
        EOT
  }
}

variable "db_username" {
  description = "The database username for IAM authentication."
  type        = string
  sensitive   = true
  default = "DMay12345"
}

variable "db_password" {
  description = "The master password for the database."
  type        = string
  sensitive   = true
  default = "admin1234$"
}