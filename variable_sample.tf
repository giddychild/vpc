variable "user_region" {
  default = ""
  description = "AWS Region"
  type        = string
}

variable "user_vpc_prod_cidr" {
  default = ""
  description = "VPC CIDR Block"
  type        = string
}

variable "user_ec2_instance_type" {
  default = ""
  description = "EC2 Instance Type to Launch"
}

variable "user_production_public_1a_cidr" {
  default = ""
  description = "Production_Public_Transit A CIDR Block"
}

variable "user_production_public_1b_cidr" {
  default = ""
  description = "Production_Public_Transit B CIDR Block"
}

variable "user_production_private_1a_cidr" {
  default = ""
  description = "Production_Private_Transit A CIDR Block"
}

variable "user_production_private_1b_cidr" {
  default = ""
  description = "Production_Private_Transit B CIDR Block"
}

variable "user_production_db_1a_cidr" {
  default = ""
  description = "Production_DB_Transit A CIDR Block"
}

variable "user_production_db_1b_cidr" {
  default = ""
  description = "Production_DB_Transit B CIDR Block"
}

variable "user_ec2_server_ami" {
  default = ""
  description = "EC2 Server AMI"
}

variable "user_key_pair" {
  default = ""
  description = "EC2 Key Pair"
}