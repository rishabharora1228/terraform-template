resource "azurerm_route_table" "route" {
  name                          = var.name
  location                      = var.location
  resource_group_name           = var.resource_group_name
  disable_bgp_route_propagation = var.disable_bgp_route_propagation
  tags                          = var.tags
 
}

resource "azurerm_route" "route" {
    route_table_name        = azurerm_route_table.route.name
    resource_group_name     = var.resource_group_name
    name                    = var.route_names             
    address_prefix          = var.route_prefixes         
    next_hop_type           = var.route_nexthop_types    
}





 #depends_on                = var.depends_on
  # route {
  #   name           = var.routeName
  #   address_prefix = var.route_address_prefix
  #   next_hop_type  = var.route_next_hop_type
  # }





# resource "azurerm_route_table" "route" {
#   name                          = var.name
#   location                      = var.location
#   resource_group_name           = var.resource_group_name
#   disable_bgp_route_propagation = var.disable_bgp_route_propagation
#   tags                          = var.tags
#   #depends_on                = var.depends_on
#   route {
#     name                    = var.route_names             //[count.index]
#     address_prefix          = var.route_prefixes         //[count.index]
#     next_hop_type           = var.route_nexthop_types
#     route_table_name        = azurerm_route_table.route.name
#   }
# }


