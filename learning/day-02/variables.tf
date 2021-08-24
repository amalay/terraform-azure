#===================================================================
# Storage Account Details
#===================================================================
variable "storage_account_name" {
  default = "ave"
}

variable "storage_account_container_name" {
  default = "terraformstate"
}

variable "storage_account_resource_group_name" {
  default = "RG-AVE"
}

variable "terraform_state_name" {
  default = "dev.terraform.tfstate"
}


#===================================================================
# Terraform Cloud Details
#===================================================================
variable "terraform_cloud_organization_name" {
  default = "AV"
}

variable "terraform_cloud_workspace_name" {
  default = "terraform-azure"
}

#===================================================================
# Azure Resources Details
#===================================================================
variable "resource_group_name" {
  default = "RG-AV-TF02"
}

variable "location" {
  default = "eastus2"
}

variable "vnet_name" {
  default = "avvnet2"
}

variable "nsg_name" {
  default = "avnsg2"
}