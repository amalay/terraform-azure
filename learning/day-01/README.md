# Terraform Learning - Day 01

### Learning Steps
1. Create a file main.tf on root folder
2. Add below code snnipet in it:

# Configure the Azure provider
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 2.65"
    }
  }

  required_version = ">= 0.14.9"
}

provider "azurerm" {
  features {}
}

# 1. Create a Resource Group
resource "azurerm_resource_group" "rg" {
  name     = "RG-AV-TF01"  
  location = "westus2"  
}

3. Execute below commands one by one.

#### Commands
> terraform init
> terraform fmt
> terraform validate
> terraform apply
> terraform show
> terraform state list
> terraform state
> terraform destroy
