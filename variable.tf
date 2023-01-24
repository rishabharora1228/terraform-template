variable "resource_group_name" {
  type =string
  description = "required resource_group_name"
}
variable "location" {
  type = string
  description = "required location"
}

variable "address_space" {
  type = list(string)
  default = [ "" ]
}

variable "subnet_address_prefixes" {
  type = list(string)
  default = [ "" ]
}

variable "vnet_name" {
  type = string
  description = "required name"
}


variable "subnet_name" {
 type = list(string)  
}

variable "loadbalancer_allocation_method" {
  type = string
  description = "value"
}


variable "route_prefixes" {
  type = list(string)
  description = "The list of address prefixes to use for each route."
  #default     = ["10.0.1.0/24"]
}
variable "disable_bgp_route_propagation" {
  type = bool
  description = "value"
}

variable "route_names" {
  type = list(string)
  description = "A list of public subnets inside the vNet."
  #default     = ["subnet1"]
}

variable route_nexthop_types {
  type = list(string)
  description = "The type of Azure hop the packet should be sent to for each corresponding route.Valid values are 'VirtualNetworkGateway', 'VnetLocal', 'Internet', 'HyperNetGateway', 'None'"
  #default     = ["VnetLocal"]
}



variable "vmss_upgrade_mode" {
  type = string
}

variable "vmss_admin_username" {
  type = string
  description = "Provide the User name "
}



