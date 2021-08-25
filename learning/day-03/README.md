# Terraform Learning - Day 03
Here I am going to extend my day 02 learning and make it scalable/manageable for DEV and PROD environment using same Terraform Cloud state management technique.

### Learning Steps

1. You need to have Terraform Cloud account. If not having, create it here https://app.terraform.io/
2. Create an organization.
3. Create a workspace withing the organization.
4. On VS terminal execute this command <b>terraform login</b> to login to terraform first.
5. Then execute <b>terraform init</b> folowed by <b>terraform validate</b>, <b>terraform plan</b> and <b>terraform apply</b>.

Now I am going to devide our project structure in two parts, one is for DEV environment and another is for PROd environment as below:

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
2. We can choose to disable this feature and execute Terraform code in Azure Cloud Shell locally using VS terminal, which will only use the remote state feature of Terraform Cloud.

Below are the steps on how to do either a Local Execution or a Terraform Cloud Execution:

## Local Execution with Terraform Cloud
To do local execution, you have to set the local option in your terraform cloud by following the below steps:

1. Go to terraform cloud (https://app.terraform.io/) and login with your account.
2. Go to your organization
3. Go to your workspaces
4. Select the desired workspace which you want to use.
5. Go to Setting and select General settings
6. Check Execution Mode as Local
7. Click on Save Settings.

Refer screenshot below:

![image](https://user-images.githubusercontent.com/84455469/130741777-76fc28f6-dec1-4a0d-83dc-1e8a9b577c65.png)

In this case only terraform state will be managed on terraform cloud but the execution of the terraform configuration will be happend locally.

Now if you apply below commands on your dev workspace then it will be executed successfully without throwing any error

```
> PS C:\GitHub\terraform-azure\learning\day-03\dev> terraform plan

OR 

> PS C:\GitHub\terraform-azure\learning\day-03\dev> terraform apply
```

But at the same time if we run the plan or apply command on prod workspace then we will still get the same error because it is not set for local execution.

#### Lets execute terraform plan and terraform apply command on dev workspace as below:

```
> PS C:\GitHub\terraform-azure\learning\day-03\dev> terraform plan
> PS C:\GitHub\terraform-azure\learning\day-03\dev> terraform apply
```

##### Terraform Result
![image](https://user-images.githubusercontent.com/84455469/130751981-c61dd52a-05ca-44ff-901f-1a35ac9d65b1.png)

##### Terraform State
![image](https://user-images.githubusercontent.com/84455469/130752065-621497aa-b9be-4ca3-900a-26e09eace376.png)

##### Validate created resources on Azure Protal
![image](https://user-images.githubusercontent.com/84455469/130752586-2280b3ff-5f68-4b3e-b711-b66c156d1ecf.png)

## Remote Execution with Terraform Cloud
To manage Terraform state remotely and execute our Terraform configuration remotely through Terraform Cloud's, we need to configure Azure Authentication in Terraform Cloud. This can be done through AAD Service Principal. That means we should have AAD Service Principal. And we have to store this AAD Service Principal in Terraform Cloud's securily. We can choose Terraform Cloud's environment variables to store it. As shown below:

```
ARM_CLIENT_ID = "dd38c6ff-1c1a-41df-82c8-5bdsadsad332"
ARM_CLIENT_SECRET = "543543l5nndfgg-6451-40ad-b0f7-89ddfd234f"
ARM_SUBSCRIPTION_ID = "sf345gf-81bd-4e97-977b-s435dfds3"
ARM_TENANT_ID = "ff34ggc-af72-454e-8dc0-435345fdg"
```

![image](https://user-images.githubusercontent.com/84455469/130744095-db0e1241-7710-4478-8d3f-64fe771c9b66.png)

Once you apply <b>terraform apply</b> command as below:

```
> PS C:\GitHub\terraform-azure\learning\day-03\prod> terraform apply

```

You will see the below screen on Terraform Cloud:

![image](https://user-images.githubusercontent.com/84455469/130747518-c1553058-3e26-4e53-85ab-354387698f2e.png)

If you click on See Details button, you will see the below screen:

![image](https://user-images.githubusercontent.com/84455469/130747207-06dce60d-982f-4595-bf1f-980ff56ca5de.png)

Here you can see that plan is finished and to apply the command, it is waiting for the confirmation.
![image](https://user-images.githubusercontent.com/84455469/130747655-284c6e2a-3b03-4535-bace-699c7dc8610b.png)

Once get the confirmation, it will start applying the terraform script and create the azure resources on the azure portal. After finished, you can see the below screen:
##### Terraform Result
![image](https://user-images.githubusercontent.com/84455469/130747808-f576c173-7ac6-43f2-978c-ee7b661131bf.png)

##### Terraform State
![image](https://user-images.githubusercontent.com/84455469/130748823-dbe9940e-aa82-44ba-a746-25b29ca88942.png)

##### Validate on Azure Portal:
![image](https://user-images.githubusercontent.com/84455469/130748510-0aa2e88d-96ba-4172-b0cc-da1d98aa59ba.png)
