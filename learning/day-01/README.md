# Terraform Learning - Day 01

### Learning Steps

#### Environment setup at your local machine
1. Install VS Code if not installed already.
2. Install Azure CLI if not installed already.
3. Check the Azure CLI version by executing this command <b>az --version</b> on your terminal in VS code.
4. Upgrade Azure CLI if it older version by executing this command <b>az upgrade</b> on your terminal in VS code.
5. Install Terraform extension by Microsoft in VS code.
6. Download Terraform for Windows 32/64 bit and install it on your machine. (https://www.terraform.io/downloads.html)
7. Validate terraform whether it is installed successfully or not by executing this command <b> terraform -v or terraform -help </b> on your terminal in VS code.

#### Project setup at your local machine
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

3. <b>azurerm</b> is the Azure Provider which used to configure infrastructure in Azure subscription using Azure Resource Manager APIs.

4. Execute below commands one by one.

#### Setup Terraform State
There are multiple way to setup and manage terraform state e.g. <b>Local</b> or <b>Remote</b>. 
On Remote, again there are multiple way to manage it. e.g. <b>Using Azure Storage Account</b>, <b>Using Terraform Cloud</b> and so on.

##### Remote State Management - Using Azure Storage Account
```
# Backend to store Terraform state. You can use Azure Storage Account or Terraform Cloud and so on for it.
  backend "azurerm" {    
    storage_account_name = "ave"
    container_name       = "terraformstate"    
    resource_group_name  = "RG-AVE"
    key                  = "dev.terraform.tfstate"
  }
```

##### Remote State Management - Using Terraform Cloud
```
# Backend to store Terraform state. You can use Azure Storage Account or Terraform Cloud and so on for it.  
  backend "remote" {
    hostname = "app.terraform.io"
    organization = "AV"

    workspaces {
      name = "terraform-azure"
      # prefix = "my-app-"    # For multiple workspaces 
    }
  }
```

#### Commands to execute from your local machine terminal
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

#### Validate on Azure portal after deployment from local machine
![image](https://user-images.githubusercontent.com/84455469/130588372-849b2893-8501-4941-9bda-e1722393c728.png)


### Maintaining terraform state
There are various way to maintain terraform state. Here I am using Azure Storage Account to maintain terraform state. Why terraform state is needed to manage? Because when we deploy the same script multiple times either through your local machine or any DevOps tools, terraform must know that what all the resources deployed already and find out the delta changes to deploy.

## Setup CI/CD pipeline to run Terraform scripts
To setup Build and Release pipeline to build and deploy terraform script, we need <b>Azure Service Connection</b> and <b>Azure Storage Account</b>.

### Build pipeline

![image](https://user-images.githubusercontent.com/84455469/130579686-7dcf6317-e683-41f1-807d-87e6a1b74b6d.png)

![image](https://user-images.githubusercontent.com/84455469/130580537-9fb945ff-00a4-47fa-bdb2-38b4cad6cf81.png)

### Release pipeline
![image](https://user-images.githubusercontent.com/84455469/130582569-55c3cd82-be03-433a-930b-40a398809746.png)

![image](https://user-images.githubusercontent.com/84455469/130583438-cba170bc-0bde-4b7e-8d63-e163b0e51da8.png)

![image](https://user-images.githubusercontent.com/84455469/130583845-983debf2-d8d3-4cf5-a1d6-a65e3cdd199d.png)

### Validate Build and Release
![image](https://user-images.githubusercontent.com/84455469/130589772-a43488fe-f55f-45f5-8b34-cec81215d590.png)

![image](https://user-images.githubusercontent.com/84455469/130586260-208ca642-9724-4ab9-b94c-f6908433cd6c.png)

### Validate on Azure portal after deployment through Azure DevOps
![image](https://user-images.githubusercontent.com/84455469/130587797-e2126890-7556-439d-ae58-83e4042e7115.png)

![image](https://user-images.githubusercontent.com/84455469/130587967-ad797c87-e3fa-4b03-b5f7-1927ae767b18.png)
