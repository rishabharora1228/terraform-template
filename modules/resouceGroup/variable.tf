variable "name" {
 type = string
 description = "Azure resource group name to use"  
}

variable "location" {
  type = string
  description = "Azure region to use"
}

variable "rg_tags" {
  type = map(any)
  description = "value"
}