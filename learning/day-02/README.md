# Terraform Learning - Day 02
Here I am going to use Terraform Cloud instead for Azure Storage Account for Terraform State Management. To do this you have to add below setting in your main.tf file withing terraform code block.

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

### Learning Steps

### Importent Note: 
To run this terraform script locally (e.g. from VS code terminal), the <b>Execution Mode</b> for <b>Terraform Cloud</b> must be set to <b>Local</b>. You can set it by following below steps:

1. Go to terraform cloud (https://app.terraform.io/) and login with your account.
2. Go to your organization
3. Go to your workspaces
4. Select the desired workspace which you want to use.
5. Go to Setting and select General settings
6. Check Execution Mode as Local
7. Click on Save Settings.

Refer below screenshot:
![image](https://user-images.githubusercontent.com/84455469/130636747-a5ff4114-c0bd-42f3-9b89-898b019c9cc7.png)


