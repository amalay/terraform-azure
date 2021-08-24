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
variable "resource_group_name" {
  default = "RG-AV-TF01"
}

variable "location" {
  default = "eastus2"
}

variable "vnet_name" {
  default = "avvnet"
}

variable "nsg_name" {
  default = "avnsg"
}