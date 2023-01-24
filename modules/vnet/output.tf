output "vnetOutput" {
    value = azurerm_virtual_network.ot-vnet.id
}

output "vnetName" {
    value = azurerm_virtual_network.ot-vnet.name
}