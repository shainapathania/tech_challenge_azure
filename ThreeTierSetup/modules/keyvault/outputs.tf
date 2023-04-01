output "DBPassword" {
  value = "${azurerm_key_vault_secret.db-secret.value }"
  sensitive = true
}