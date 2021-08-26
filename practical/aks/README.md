# Terraform for Azure Kubernete Service - Automate Infrastructure
Here I am going to automate infrastructure setup process for AKS using Terraform Scripts and Azure DevOps for two environments DEV and UAT on a single click.

### Project Structure
![image](https://user-images.githubusercontent.com/84455469/130923865-df54c0cd-85a1-4562-a930-c1025e8601bc.png)

Here you can see that few terraform files and few yaml files as below:
1. main.tf
2. aks.tf
3. variables.tf
4. outputs.tf
5. azure-pipeline.yml

All .tf files containes terraform scripts and .yml file contains pipeline script to execute terraform scripts on Azure DevOps.

### Pre-requisite
There are three pre-requisite steps your have follow before setting up the pipeline as below:

#### Step 1 - Install Terraform Task. 
Please make sure that your have installed "Azure Pipelines Terraform Tasks by Charles Zipp" component as a prerequisite on your Azure DevOps environment. If it is not installed already then please go to below link and install it first.

https://marketplace.visualstudio.com/items?itemName=charleszipp.azure-pipelines-tasks-terraform

#### Step 2 - Generate SSH-Key
You need to create ssh-key on your local machine in any directory of your choice by executing below commands on your command prompt:

```
ssh-keygen -m PEM -t rsa -b 4096 -C "azureuser@myserver" -f av-tf-aks-ssh-key
```
##### Example
```
C:\SSH-Keys>ssh-keygen -m PEM -t rsa -b 4096 -C "azureuser@myserver" -f av-tf-aks-ssh-key
```

After successfull execution of this command, it will generate two files as below:

1. <b>Private File:</b> av-tf-aks-ssh-key (To be stored safe with us)
2. <b>Public File :</b> av-tf-aks-ssh-key.pub (To be uploaded to Azure DevOps)

#### Step 3 - Upload SSH-Key to your Azure DevOps
Once you have ssh-keys, you have to upload public ssh-key (e.g. <b>av-tf-aks-ssh-key.pub</b> in my case) to your Azure DevOps as below:

1. Go to library under Pipelines on your Azure DevOps
2. Click on Secure Files
3. Click on + Secure File button
4. Browse your ssh-key public file (e.g. av-tf-aks-ssh-key.pub) on your local computer and select it.
5. Click on OK button to upload it on your Azure DevOps.
6. Once uploaded, go to Secure Files on and click on uploaded file
7. Click on pipeline permissions
8. Add your pipeline in the list to use it

Please refer below screenshot:

![image](https://user-images.githubusercontent.com/84455469/130929798-82aee4b4-20e2-485d-98d2-b1c1fb3d5158.png)

### Setup Pipeline

1. Go to pipelines in you Azure DevOps 
2. Click on New Pipeline
3. Select your Github/Azure repository
4. Select azure-pipeline.yml file from your repository
5. Click Save and Run

![image](https://user-images.githubusercontent.com/84455469/130920833-e0990eeb-be72-4dcc-8964-9d22e6465907.png)

This azure-pipeline.yml file contains three stages as below:

##### Stage 1: Build, Publish Artifacts and Validate Terraform Scripts
##### Stage 2: Deploy to DEV environment based.
##### Stage 3: Deploy to UAT environment based.

#### Validate pipeline run result on Azure DevOps
![image](https://user-images.githubusercontent.com/84455469/130919106-bb1d64a9-804d-4a60-a1e2-cb37de09daf8.png)

![image](https://user-images.githubusercontent.com/84455469/130920226-14faf9d2-acf6-433c-992f-3a8256991817.png)

#### Validate pipeline run result on Azure Portal
![image](https://user-images.githubusercontent.com/84455469/130923545-dd282c9b-2c16-49c8-bb21-2503e4cb077f.png)
