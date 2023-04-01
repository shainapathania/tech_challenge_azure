output "vnet_id" {
  description = "the is newly created"
  value = azurerm_virtual_network.vnet.id
}

output "vnet_name" {
  description = "The newly creatd vnet"
  value = azurerm_virtual_network.vnet.name
}

output "vnet_location" {
  value = azurerm_virtual_network.vnet.location

}

output "subnet_1" {
  value = "${azurerm_subnet.subnet[0].id }"
}

output "subnet_2" {
  value = "${azurerm_subnet.subnet[1].id}"
}