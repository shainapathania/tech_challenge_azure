resource "azurerm_app_service_plan" "app_service_plan" {
  name                = var.app_service_plan
  location            = var.location
  resource_group_name = var.resource_group_name

  sku {
    tier = var.tier
    size = var.size
  }
}

resource "azurerm_app_service" "app_service" {
  name                = var.app_service_name
  location            = var.location
  resource_group_name = var.resource_group_name
  app_service_plan_id = azurerm_app_service_plan.app_service_plan.id

}
