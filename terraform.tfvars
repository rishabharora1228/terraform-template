
resource_group_name          = "service_infra"
location                     = "Norway EAST"
vnet_name                    = "vnet_ot"
address_space                = ["16.0.0.0/18"]

loadbalancer_allocation_method = "Static"

subnet_address_prefixes      = ["16.0.0.0/19", "16.0.32.0/20", "16.0.48.0/20"]
subnet_name                  = ["subnet1", "subnet2", "subnet3"]


disable_bgp_route_propagation = false

route_names                 = ["route1", "route2"]
route_prefixes              = ["16.0.0.0/19", "16.0.32.0/20"]
route_nexthop_types         = ["VnetLocal", "VirtualNetworkGateway"]

vmss_admin_username         = "azureuser"
vmss_upgrade_mode           = "Manual"
