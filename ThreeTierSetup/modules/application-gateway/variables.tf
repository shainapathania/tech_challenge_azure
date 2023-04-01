variable "sku_name" {
  default =  "WAF_Medium"
}

variable "rule_type" {
  default = "Basic"
}

variable "sku_tier" {
  default = "WAF"
}
variable "resource_group_name" {
  
}
variable "appgwy_name" {
  default = "app-gateway-cus"
}

variable "location" {
 
}
variable "subnet_id" {
  description = "ID of the subnet to deploy application gateway"
}

# variable "private_ip_address" {
#   description = "The Private IP of the Application gateways"
# }

variable "waf_enabled" {
  description = "Set to true to enable WAF on application Gateway"
  type = bool 
  default = true

}

variable "waf_configuration" {
  description = "Configuration block for WAF"
  type = object({
      firewall_mode = string
      rule_set_type = string
      rule_set_version = string
      file_upload_limit_mb = number
      max_request_body_size_kb = number
  })
  default = null
}

variable "app_serverice_name" {
  
}