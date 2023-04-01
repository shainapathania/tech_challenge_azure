
resource "azurerm_sql_server" "sqldb" {
    name =    var.sql_server_name
    resource_group_name = var.resource_group_name
    location = var.location
    version = "12.0"
    administrator_login = var.sql_admin_login
    administrator_login_password = var.sql_admin_password
  
}

resource "azurerm_sql_database" "db" {
  name = var.sql_db_name
   resource_group_name = var.resource_group_name
    location = var.location
    server_name = azurerm_sql_server.sqldb.name
}