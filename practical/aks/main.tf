# Configure the Azure provider
terraform {

  # Provider
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 2.65"
    }
  }

  # Backend to store Terraform state. You can use Azure Storage Account or Terraform Cloud and so on for it.  
  backend "azurerm" {    
    storage_account_name = "ave"
    container_name       = "terraformstate"    
    resource_group_name  = "RG-AVE"
    key                  = "aks.terraform.tfstate"  
  }

  required_version = ">= 0.14.9"
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "dev" {  
  name     = var.resource_group_name
  location = var.location
}