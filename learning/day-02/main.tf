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
  backend "remote" {
    hostname = "app.terraform.io"
    organization = "AV"

    workspaces {
      name = "terraform-azure"
      # prefix = "my-app-"    # For multiple workspaces 
    }
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
    Environment = "Terraform Learning Day 02"
    Team = "Terraform Cloud"
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
