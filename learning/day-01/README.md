# Terraform Learning - Day 01

### Learning Steps
1. Create a file <b>main.tf</b> on root folder
2. Add below code snnipet in it:

```
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

```

3. Execute below commands one by one.

#### Commands
> <b>terraform init</b> - It will initialize provider plugins and backend.

> <b>terraform fmt</b> - It automatically updates configurations in the current directory for readability and consistency.

> <b>terraform validate</b> - It will validate your configuration to check whether it is valid syntactically and consistent internally.

> <b>terraform apply</b> - It will start creating resources on cloud.

> <b>terraform show</b> - It will inspect the current state.

> <b>terraform state list</b> - It will list the resources in the project's state.

> <b>terraform state</b> - It is used for advanced state management.

> <b>terraform destroy</b> - It will destroy all the resources from cloud subscription.

#### Validate on Azure portal
![image](https://user-images.githubusercontent.com/84455469/130459762-b3db998d-387d-4c48-aceb-08fbf41123d8.png)



