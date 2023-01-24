
resource "azurerm_public_ip" "publicIP" {
  name                = "PublicIPForLB"
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = var.allocation_method
}

resource "azurerm_lb" "loadbalancer" {
  name                = "LoadBalancer"
  location            = var.location
  resource_group_name = var.resource_group_name

  frontend_ip_configuration {
    name                 = "PublicIPAddress"
    public_ip_address_id = var.public_ip_address_id
  }
}