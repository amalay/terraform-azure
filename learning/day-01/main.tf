# Configure the Azure provider
terraform {
  # Provider
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 2.65"
    }
  }

  # Backend to store Terraform state. I am using Azure Storage Account for it.
  backend "azurerm" {
    resource_group_name  = "RG-AVE"
    storage_account_name = "ave"
    container_name       = "terraformstate"
    key                  = "terraform.tfstate"
  }

  required_version = ">= 0.14.9"
}

provider "azurerm" {
  features {}
}

# 1. Create a Resource Group
resource "azurerm_resource_group" "rg" {
  # name     = "RG-AV-TF01"
  name     = var.resource_group_name
  location = "westus2"

  # Optional
  tags = {
        Environment = "Terraform Learning Day 01"
        Team = "DevOps"
    }
}

# 2. Create a virtual network
resource "azurerm_virtual_network" "vnet" {
    # name                = "avvnet"
    name                = var.vnet_name
    address_space       = ["10.0.0.0/16"]    
    resource_group_name = azurerm_resource_group.rg.name
    location            = azurerm_resource_group.rg.location
}
