# locals {
#   sku_name    = "WAF_Medium"
#   rule_type   = "Basic"
#   sku_tier    = "WAF"
#   appgwy_name = "appgatewayuswdev"
#   waf_enabled = true
# }


locals {
  
  #sku_name = var.waf_enabled ? "WAF_Medium" : "Standard_v2"
  #sku_tier = var.waf_enabled ? "WAF" : "Standard_v2"

  backend_address_pool_name      = "${var.appgwy_name}-beap"
  frontend_port_name             = "${var.appgwy_name}-feport"
  frontend_ip_configuration_name = "${var.appgwy_name}-feip"
  http_setting_name              = "${var.appgwy_name}-be-htst"
  listener_name                  = "${var.appgwy_name}-httplstn"
  request_routing_rule_name      = "${var.appgwy_name}-rqrt"
  redirect_configuration_name    = "${var.appgwy_name}-rdrcfg"
}