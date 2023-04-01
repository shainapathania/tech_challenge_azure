variable "app_service_plan" {
  default = "tech_challenge_asp"
}
variable "app_service_name" {
   default = "tech-challenge-as"
}
variable "resource_group_name" {
  default = "tech_challenge_rg"
}

variable "webapp_location" {
  default = "Central US"
}
variable "location" {
  default = "Central US"
}

variable "tier" {
  default = "Standard"
  
}

variable "size" {
  default = "S1"
}

