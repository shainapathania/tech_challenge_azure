#Tech challenge Resource Group
resource "azurerm_resource_group" "rg" {
  name     = local.resource_group_name_tc
  location = local.location_tc
}

#Password for DB user
resource "random_password" "db_password" {
  length  = 20
  special = true
  # override_special = "_%@"
}

# create viratual network according to needs
module "virtual-network" {
  source              = "./modules/virtual-network"
  resource_group_name = azurerm_resource_group.rg.name
  address_space       = ["192.168.0.0/16"]
  subnet_names        = ["subnet-appgwy", "subnet-01"]
  subnet_prefixes     = ["192.168.1.0/28", "192.168.2.0/24"]
  location            = var.location

}

#keyvault for storing App and DB secret and App Gateway Certificates
module "keyvault" {
  source              = "./modules/keyvault"
  resource_group_name = var.resource_group_name
  location            = var.location
  keyvault_name       = var.keyvault_name
  DB_secret_name      = var.DB_secret_name
  DB_secret_value     = random_password.db_password.result
}

# backend SQL DB Creation
module "sqldb" {
  source              = "./modules/sqldb"
  resource_group_name = var.resource_group_name
  location            = var.location
  sql_admin_password  = random_password.db_password.result

}

# Web app 
module "webapp" {
  source              = "./modules/webapp"
  app_service_plan    = var.app_service_plan
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  tier                = var.tier
  size                = var.size
  depends_on = [
    module.sqldb
  ]
}

#FrontEnd Application gateway along with WAF
module "appgwy" {
  source              = "./modules/application-gateway"
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.location
  appgwy_name         = var.appgwy_name
  app_serverice_name  = module.webapp.app_serverice_name
  #appgwy_location = var.location
  subnet_id   = module.virtual-network.subnet_1
  waf_enabled = true
  waf_configuration = {
    firewall_mode            = "Prevention"
    rule_set_type            = "OWSAP"
    rule_set_version         = "3.1"
    file_upload_limit_mb     = 100
    max_request_body_size_kb = 128
  }
  depends_on = [
    module.virtual-network
  ]
}

