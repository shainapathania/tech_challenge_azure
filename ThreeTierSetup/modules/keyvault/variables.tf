
variable "resource_group_name" {
  type        = string
  default     = "vv-terraformed-cus"
  description = "RG name in Azure"
}

variable "location" {
  type        = string
  default     = "Central US"
  description = "RG location"
}

variable "keyvault_name" {
  type = string

  description = "key vault name in azure"

}
variable "DB_secret_name" {
  type        = string
  description = "key vault scret name"
}

variable "DB_secret_value" {
  type = string

  description = "key vault scret value"
  sensitive   = true
}
