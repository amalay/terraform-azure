# Terraform for Azure Kubernete Service

### Project Structure
![image](https://user-images.githubusercontent.com/84455469/130923865-df54c0cd-85a1-4562-a930-c1025e8601bc.png)

Here you can see that few terraform files and few yaml files as below:
1. main.tf
2. aks.tf
3. variables.tf
4. outputs.tf
5. azure-pipeline.yml

All .tf files containes terraform scripts and .yml file contains pipeline script to execute terraform scripts on Azure DevOps.

### Setup Pipeline
Before setting up the pipeline, please make sure that your have installed "Azure Pipelines Terraform Tasks by Charles Zipp" component as a prerequisite on your Azure DevOps environment. If it is not installed already then please go to below link and install it first.

https://marketplace.visualstudio.com/items?itemName=charleszipp.azure-pipelines-tasks-terraform


![image](https://user-images.githubusercontent.com/84455469/130920833-e0990eeb-be72-4dcc-8964-9d22e6465907.png)

![image](https://user-images.githubusercontent.com/84455469/130919106-bb1d64a9-804d-4a60-a1e2-cb37de09daf8.png)

![image](https://user-images.githubusercontent.com/84455469/130920226-14faf9d2-acf6-433c-992f-3a8256991817.png)

![image](https://user-images.githubusercontent.com/84455469/130923545-dd282c9b-2c16-49c8-bb21-2503e4cb077f.png)
