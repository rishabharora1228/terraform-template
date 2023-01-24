variable "name" {
 type = string  
}

variable "location" {
  type = string
}

variable "resource_group_name" {
    type = string  
}

variable "disable_bgp_route_propagation" {
 type = bool 
}

variable "tags" {
  type = map(string)
}
variable "route_names" {
 type = string 
}
variable "route_prefixes" {
 type = string
}
variable "route_nexthop_types" {
  type = string
}

# variable "depends_on" {
#   type = list(string)
# }