# Terraform Learning - Day 03


### Learning Steps

![image](https://user-images.githubusercontent.com/84455469/130738953-21e150f3-f6e0-4842-9e6b-caf8f4eee0e8.png)

When we run <b>terraform init</b> command, It will the workspace automatically in Terraform Cloud if it is not exists already. To experience it execute the command from your VS terminal:

```
> PS C:\GitHub\terraform-azure\learning\day-03\dev> terraform init

OR 

> PS C:\GitHub\terraform-azure\learning\day-03\prod> terraform init
```

![image](https://user-images.githubusercontent.com/84455469/130739187-5c469822-abc4-49e8-a714-ea1a0d5f1d3d.png)

At this moment, if we run <b>terraform plan</b> or <b>terraform apply</b> command on our current configuration. We will get the following error:
```
Error: Error building AzureRM Client: Azure CLI Authorization Profile was not found. Please ensure the Azure CLI is installed and then log-in with `az login`.

on main.tf line 13, in provider "azurerm":
13: provider "azurerm" {  
```
Because Terraform Cloud doesn't just store remote state; it will also remotely execute the Terraform code on its own disposable VM environment, which is called a run.

To solve this issue we have two option to execute our terraform configuration :
1. We can remotely execute our Terraform code in Terraform Cloud; or
2. We can choose to disable this feature and execute our code in Azure Cloud Shell, which will only use the remote state feature of Terraform Cloud.

Below are the steps on how to do either a local execution or a Terraform Cloud execution:

#### Local Execution
To do local execution, you have to set the local option in your terraform cloud by following the below steps:

1. Go to terraform cloud (https://app.terraform.io/) and login with your account.
2. Go to your organization
3. Go to your workspaces
4. Select the desired workspace which you want to use.
5. Go to Setting and select General settings
6. Check Execution Mode as Local
7. Click on Save Settings.

Refer screenshot below:
![image](https://user-images.githubusercontent.com/84455469/130740631-15d5dfd4-b700-4237-82c7-d6cc45174f45.png)

In this case only terraform state will be managed on terraform cloud but the execution of the terraform configuration will be happend locally.

