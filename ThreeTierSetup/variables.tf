variable "resource_group_name" {
  type        = string
  default     = "rg_tech_challenge_cus"
  description = "resource group name of the virtual network"
}
variable "location" {
  type        = string
  default     = "Central US"
  description = "location of the virtual network"
}
variable "virtual_network_name" {
  type        = string
  default     = "vnet-01-cus-tc"
  description = "name of the virtual network"
}
variable "address_space" {
  type        = list(string)
  default     = ["192.168.0.0/16"]
  description = "address space of the virtual network"
}
variable "subnet_name" {
  type        = list(string)
  default     = ["Subnet-01", "Subnet-02"]
  description = "name of the subnet"
}
variable "subnet_address_prefix" {
  type        = list(string)
  default     = ["192.168.1.0/28", "192.168.2.0/24"]
  description = "address prefix of the subnet"
}



variable "app_service_plan" {
  default = "tech_challenge_asp"
}

variable "tier" {
  default = "Free"

}

variable "size" {
  default = "F1"
}

variable "app_service_name" {
  default = "tech-challenge-as"
}


#####Application Gateway

variable "appgwy_name" {
  type        = string
  default     = "tech_challenge_appgwy_cus"
  description = "applicationgateway name"
}



#### Key Vault

variable "keyvault_name" {
  type        = string
  default     = "tech-challenge-cus"
  description = "key vault name in azure"

}

variable "DB_secret_name" {
  type        = string
  default     = "DatabasePassword"
  description = "key vault scret name"
}
