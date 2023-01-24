locals {
  location              = module.resourceGroup.rg_location
  resource_group_name   = module.resourceGroup.nameOutput
  owner                 = "Mukesh kumar"
  name                  = "OT-Services"
  all_subnetsId         = [module.subnet["0"].subnetID, module.subnet["1"].subnetID, module.subnet["2"].subnetID]
  
}

module "resourceGroup" {
  source          = "./modules/resouceGroup"
  name            = var.resource_group_name
  location        = var.location
  rg_tags         = {
    name  = local.name
    owner = local.owner
  }
}

module "vnet" {
  source                = "./modules/vnet"
  name                  = var.vnet_name                              //"Ot-vnet"
  resource_group_name   = local.resource_group_name
  location              = local.location
  address_space         = var.address_space
  tags = {
    name = local.name
    owner = local.owner
  }
}

module "NSG" {
  source  = "./modules/NSG"
  name    = "NSG-OT"
  resource_group_name = local.resource_group_name
  location = local.location
  network_security_group_name = module.NSG.nsg_name
}

module "subnet" {
  source                      = "./modules/subnet"
  count                       = "${length(var.subnet_name)}"
  subnet_name                 = var.subnet_name[count.index]
  resource_group_name         = local.resource_group_name
  subnet_id                   = local.all_subnetsId[count.index] 
  network_security_group_id   = module.NSG.nsg_id
  virtual_network_name        = module.vnet.vnetName
  subnet_address_prefixes     = [var.subnet_address_prefixes[count.index]]
  
}

module "lb" {
  source = "./modules/loadbalancer"
  resource_group_name    = local.resource_group_name
  location               = local.location
  allocation_method      = var.loadbalancer_allocation_method          // "Static"
  public_ip_address_id   = module.lb.PublicIPAddress
}

module "RouteTable1" {
  source = "./modules/routeTable"
  name                   = "ot-route-table"
  resource_group_name    = local.resource_group_name
  location               = local.location
  disable_bgp_route_propagation = var.disable_bgp_route_propagation      //"false"          
  count                  = "${length(var.route_names)}"
  route_names            = var.route_names[count.index]
  route_prefixes         = var.route_prefixes[count.index]
  route_nexthop_types    = var.route_nexthop_types[count.index]
  tags = {
    "owner" = local.owner
  }
}

# module "rtAssociation" {
#   source = "./modules/rtAssociation"
#   subnet_id = local.all_subnetsId[0]
#   routetable_id         = module.RouteTable1.routeID
# }

# module "rtAsso" {
#   source = "./modules/rtAssociation"
#   subnet_id              = module.subnet["1"].subnetID
#   routetable_id         = module.RouteTable1.routeID
# }



module "VMSS" {
  source                            = "./modules/vmss"
  name                              = "ScaleSet"
  resource_group_name               = local.resource_group_name
  location                          = local.location
  upgrade_mode                      = var.vmss_upgrade_mode        // "Manual"
  sku                               = "Standard_F2"
  instances                         = "2"
  admin_username                    =  var.vmss_admin_username               // "azureuser"
  public_key                        = file("key")
  network_interface_name            = "TestNetworkProfile"
  network_interface_primary         = true         
  ip_configuration_name             = "TestIPConfiguration"
  ip_configuration_primary          = true
  subnet_id                         = module.subnet["0"].subnetID
  os_disk_caching                   = "ReadWrite"
  os_disk_storage_account_type      = "StandardSSD_LRS"
  source_image_reference_publisher  = "Canonical"
  source_image_reference_offer      = "0001-com-ubuntu-server-focal"
  source_image_reference_sku        =  "20_04-LTS"               
  source_image_reference_version    = "latest"
  
}

# variable "image_info" {
#   type = object({
#     publisher = string
#     offer     = string
#     sku       = string
#     version   = string
#   })
#   default = null
# }
