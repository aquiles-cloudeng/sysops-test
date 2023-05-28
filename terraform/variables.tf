############# VARIABLES #############
variable "tags" {
  type = map(any)
}

variable "cluster_name" {
  description = "Cluster Name"
  type        = string
}

variable "project_name" {
  description = "Project Name"
  type        = string
}

variable "env_name" {
  description = "environment name"
  type        = string
}

variable "azs" {
 type        = list(string)
 description = "Public Subnet CIDR values"
 default     = ["us-east-1a", "us-east-1b", "us-east-1c"]
}


############# VPC VARIABLES #############

variable "public_subnet_cidrs" {
 type        = list(string)
 description = "Public Subnet CIDR values"
 default     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}
 
variable "private_subnet_cidrs" {
 type        = list(string)
 description = "Private Subnet CIDR values"
 default     = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
}