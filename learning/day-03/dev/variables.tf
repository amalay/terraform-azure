#===================================================================
# Azure Resources Details
#===================================================================
variable "resource_group_name" {
  default = "RG-AV-TF-DEV"
}

variable "location" {
  default = "eastus2"
}

variable "vnet_name" {
  default = "avvnetdev"
}

variable "nsg_name" {
  default = "avnsgdev"
}