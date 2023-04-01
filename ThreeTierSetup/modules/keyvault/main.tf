

# resource "azurerm_resource_group" "example" {
#   name     = "example-resources"
#   location = "West Europe"
# }

resource "azurerm_key_vault" "tc_keyvault" {
  name                = var.keyvault_name
  location            = var.location
  resource_group_name = var.resource_group_name
  tenant_id           = data.azurerm_client_config.current.tenant_id
  sku_name            = "premium"
}

resource "azurerm_key_vault_access_policy" "tc_keyvault_ap" {
  key_vault_id = azurerm_key_vault.tc_keyvault.id
  tenant_id    = data.azurerm_client_config.current.tenant_id
  object_id    = data.azurerm_client_config.current.object_id

  key_permissions = [
    "Create",
    "List",
    "Get"
  ]

  secret_permissions = [
    "Set",
    "List",
    "Get",
    "Delete",
    "Purge",
    "Recover"
  ]
}

resource "azurerm_key_vault_secret" "db-secret" {
  name         = var.DB_secret_name
  value        = var.DB_secret_value
  key_vault_id = azurerm_key_vault.tc_keyvault.id
}
