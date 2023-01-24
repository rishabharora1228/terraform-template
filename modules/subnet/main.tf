
resource "azurerm_subnet" "subnet" {

  name                 = var.subnet_name
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.virtual_network_name
  address_prefixes     = var.subnet_address_prefixes
  
}

resource "azurerm_subnet_network_security_group_association" "nsg-rule" {
  subnet_id                 = var.subnet_id
  network_security_group_id = var.network_security_group_id
}


# resource "azurerm_subnet" "subnet2" {
#   name                 = "subnet2"
#   resource_group_name  = azurerm_resource_group.rg.name
#   virtual_network_name = azurerm_virtual_network.ot-vnet.name
#   address_prefixes     = ["13.0.2.0/24"]
  
#   delegation {
#     name = "delegation"

    # service_delegation {
    #   name    = "Microsoft.ContainerInstance/containerGroups"
    #   actions = ["Microsoft.Network/virtualNetworks/subnets/join/action", "Microsoft.Network/virtualNetworks/subnets/prepareNetworkPolicies/action"]
    # }
#   }
# }


