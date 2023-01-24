resource "azurerm_linux_virtual_machine_scale_set" "vmss" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
  upgrade_mode        = var.upgrade_mode                                    // "Manual"
  sku                 = var.sku                                             // "Standard_F2"
  instances           = var.instances
  admin_username      = var.admin_username                                  // "ubuntu"
  
  admin_ssh_key {
    username = var.admin_username
    public_key = var.public_key              
  }

  network_interface {
    name    = var.network_interface_name                                  // "TestNetworkProfile"
    primary = var.network_interface_primary                               // true

    ip_configuration {
      name      = var.ip_configuration_name                                 // "TestIPConfiguration"
      primary   = var.ip_configuration_primary                              // true
      subnet_id = var.subnet_id                                             // azurerm_subnet.subnet1.id
    }
  }

  os_disk {
    caching              = var.os_disk_caching                               // "ReadWrite"
    storage_account_type = var.os_disk_storage_account_type                  // "StandardSSD_LRS"
  }

  source_image_reference {
    publisher =  var.source_image_reference_publisher                         // "Canonical"
    offer     = var.source_image_reference_offer                              // "0001-com-ubuntu-server-focal"
    sku       = var.source_image_reference_sku                                // "20_04-LTS"               
    version   = var.source_image_reference_version                            // "latest"
  }

  
}

# lifecycle {
  #   ignore_changes = ["instances"]
  # }