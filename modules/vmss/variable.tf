variable "resource_group_name" {
  type = string
}
variable "location" {
  type = string
}

variable "subnet_id" {
  type = string
}
variable "name" {
  type = string
}

variable "upgrade_mode" {
  type = string
}
variable "sku" {
  type = string
}
variable "instances" {
  type = string
}
variable "admin_username" {
    type = string
}

variable "public_key" {
  type = any
}

variable "network_interface_name" {
 type = string 
}

variable "network_interface_primary" {
  type = bool
}

variable "ip_configuration_name" {
  type = string
}

variable "ip_configuration_primary" {
  type = bool
}

variable "os_disk_caching" {
  type = string
}

variable "os_disk_storage_account_type" {
  type = string
}

variable "source_image_reference_publisher" {
  type = string
}

variable "source_image_reference_offer" {
  type = string
}

variable "source_image_reference_sku" {
  type = string
}

variable "source_image_reference_version" {
  type = string
}
