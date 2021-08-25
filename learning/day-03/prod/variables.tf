#===================================================================
# Azure Resources Details
#===================================================================
variable "resource_group_name" {
  default = "RG-AV-TF-PROD"
}

variable "location" {
  default = "eastus2"
}

variable "vnet_name" {
  default = "avvnetprod"
}

variable "nsg_name" {
  default = "avnsgprod"
}