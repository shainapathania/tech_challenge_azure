variable "resource_group_name" {
  default = "tech_challenge_rg"
}

variable "virtual_network_name" {
  default = "Default_tech_challenge"
}

variable "subnet_names" {
    type = list(string)
  default = ["tech_challenge"]
}

variable "location" {
  default = "Central US"
}
variable "address_space" {
    type = list(string)
  default = ["192.168.0.0/16"]
}

variable "subnet_prefixes" {
    type = list(string)
   default = ["192.168.1.0/24"]
}

