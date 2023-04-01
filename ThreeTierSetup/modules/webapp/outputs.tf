output "app_serverice_name" {
  description = "this is output value for app service name"
  value = azurerm_app_service.app_service.name
}