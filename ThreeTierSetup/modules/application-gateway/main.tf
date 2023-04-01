resource "azurerm_public_ip" "public_ip" {
  name                = "${var.appgwy_name}-pip"
  resource_group_name = var.resource_group_name
  location            =  var.location
  allocation_method   = "Dynamic"
}


resource "azurerm_application_gateway" "app_gwy" {
  name                = "${var.appgwy_name}"
  resource_group_name = var.resource_group_name
  location            = var.location

  sku {
    name     = var.sku_name
    tier     = var.sku_tier
    capacity = 2
  }

  gateway_ip_configuration {
    name      = "${var.appgwy_name}-ip-configuration"
    subnet_id =  var.subnet_id
  }


frontend_ip_configuration {
    name                 = "${local.frontend_ip_configuration_name}"
    public_ip_address_id = azurerm_public_ip.public_ip.id

  }


  frontend_port {
    name = "${local.frontend_port_name}-80"
    port = 80
  }

#   frontend_port {
#     name = "${local.frontend_port_name}-443"
#     port = 443
#   }

  backend_address_pool {
    name = local.backend_address_pool_name
    fqdns = ["${var.app_serverice_name}.azurewebsites.net"]
  }

  backend_http_settings {
    name                  = local.http_setting_name
    cookie_based_affinity = "Disabled"
    #path                  = "/path1/"
    port                  = 80
    protocol              = "Http"
    request_timeout       = 20
    pick_host_name_from_backend_address = true
    probe_name = "HTTP_Probe"
  }

  http_listener {
    name                           = local.listener_name
    frontend_ip_configuration_name = "${local.frontend_ip_configuration_name}"
    frontend_port_name             = "${local.frontend_port_name}-80"
    protocol                       = "Http"
  }

  request_routing_rule {
    name                       = local.request_routing_rule_name
    rule_type                  = var.rule_type
    http_listener_name         = local.listener_name
    backend_address_pool_name  = local.backend_address_pool_name
    backend_http_settings_name = local.http_setting_name
  }
  waf_configuration {
    enabled = var.waf_enabled
    firewall_mode =  "Prevention"
    rule_set_type =  "OWASP"
    rule_set_version =  "3.0"
    request_body_check = true
    max_request_body_size_kb =  128
    file_upload_limit_mb =  100

  }

  probe {
    name = "HTTP_Probe"
    path = "/"
    protocol = "Http"
    interval = 30
    timeout = 30
    unhealthy_threshold = 3
    pick_host_name_from_backend_http_settings = true
    minimum_servers = 0
    
  }

}