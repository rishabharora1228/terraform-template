terraform {
  backend "azurerm"{
    	resource_group_name  = "ot-rg"
        storage_account_name = "terrabackened"
        container_name       = "terraform"
        key                  = "terraform.tfstate"
    
    #access_key = "value"
  }
}


