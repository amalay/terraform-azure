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
  default = "RG-AV-TF03"
}

variable "location" {
  default = "eastus3"
}

variable "vnet_name" {
  default = "avvnet3"
}

variable "nsg_name" {
  default = "avnsg3"
}