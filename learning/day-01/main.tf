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
    storage_account_name = var.storage_account_name
    container_name       = var.storage_account_container_name    
    resource_group_name  = var.storage_account_resource_group_name
    key                  = var.terraform_state_name
  }

  required_version = ">= 0.14.9"
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {  
  name     = var.resource_group_name
  location = var.location

  # Optional
  tags = {
    Environment = "Terraform Learning Day 01"
    Team = "DevOps"
  }
}

resource "azurerm_virtual_network" "vnet" {    
  name                = var.vnet_name    
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  address_space       = ["10.0.0.0/16"]    
}

resource "azurerm_network_security_group" "sec-nsg"{
  name                = var.nsg_name    
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location    
}
