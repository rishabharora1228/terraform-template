resource "azurerm_virtual_network" "ot-vnet" {
  name                = var.name
  location            = var.location                    //azurerm_resource_group.rg.location
  resource_group_name = var.resource_group_name         // azurerm_resource_group.rg.name
  address_space       = var.address_space               // ["13.0.0.0/16"]
  tags                = var.tags                        //environment = "ot-microservices"
}