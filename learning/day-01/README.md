# Terraform Learning - Day 01

### Learning Steps

#### Environment Setup
1. Install VS Code if not installed already.
2. Install Azure CLI if not installed already.
3. Check the Azure CLI version by executing this command <b>az --version</b> on your terminal in VS code.
4. Upgrade Azure CLI if it older version by executing this command <b>az upgrade</b> on your terminal in VS code.
5. Install Terraform extension by Microsoft in VS code.
6. Download Terraform for Windows 32/64 bit and install it on your machine. (https://www.terraform.io/downloads.html)
7. Validate terraform whether it is installed successfully or not by executing this command <b> terraform -v or terraform -help </b> on your terminal in VS code.

#### Project Setup
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
> <b>az login</b> - To login to azure.

> <b>az account list</b> - To see the list of your azure subscription.

> <b>az account set --subscription="43465ce6-1506-4876-a203-3d3f947d8be7"</b> - To set the desired subscription to use to create resources.

> <b>terraform init</b> - It will initialize provider plugins and backend.

> <b>terraform fmt</b> - It automatically updates configurations in the current directory for readability and consistency.

> <b>terraform validate</b> - It will validate your configuration to check whether it is valid syntactically and consistent internally.

> <b>terraform plan</b> - This generates an execution plan that shows what actions will be taken when the plan is applied. It includes the server configuration, log in details, storage settings, and the deployment zone as seen in the example underneath.

> <b>terraform apply</b> - It will start creating resources on cloud.

> <b>terraform show</b> - It will inspect the current state.

> <b>terraform state list</b> - It will list the resources in the project's state.

> <b>terraform state</b> - It is used for advanced state management.

> <b>terraform destroy</b> - It will destroy all the resources from cloud subscription.

#### Validate on Azure portal
![image](https://user-images.githubusercontent.com/84455469/130459762-b3db998d-387d-4c48-aceb-08fbf41123d8.png)



