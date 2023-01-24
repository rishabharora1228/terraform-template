resource "azurerm_network_security_group" "ot-nsg" {
  name                  = var.name
  location              = var.location
  resource_group_name   = var.resource_group_name
}


resource "azurerm_network_security_rule" "nsgRule" {
  name                        = var.name
  priority                    = 100
  direction                   = "Outbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = var.resource_group_name
  network_security_group_name = var.network_security_group_name
}
