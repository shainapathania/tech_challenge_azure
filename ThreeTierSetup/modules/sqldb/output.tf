output "connection_string" {
  value = azurerm_sql_server.sqldb.fully_qualified_domain_name
}
