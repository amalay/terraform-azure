#===================================================================
# Azure Resources Details
#===================================================================
variable "environment" {
  default = "DEV"
}

variable "resource_group_name" {
  default = "RG-AV-TF-AKS"
}

variable "location" {
  default = "northeurope"
}

variable aks_cluster_name {
    default = "avaks"
}

variable "aks_dns_prefix" {
    default = "avdns"
}

variable "kubernetes_version" {
  default = "1.19.9"
}

variable "aks_vm_size" {
    default = "Standard_D2_v2"
}

variable "aks_node_count" {
    default = 1
}

variable "load_balancer_sku" {
  default = "Standard"
}

variable "network_plugin" {  
  default     = "kubenet"
}

variable "ssh_public_key" {
    default = "~/.ssh/id_rsa.pub"
}

# refer https://azure.microsoft.com/global-infrastructure/services/?products=monitor for log analytics available regions
variable log_analytics_workspace_name {
    default = "avloganalytics"
}

# refer https://azure.microsoft.com/pricing/details/monitor/ for log analytics pricing 
variable log_analytics_workspace_sku {
    default = "PerGB2018"
}

variable "acr_name" {  
  default     = "avacr"
}

variable "acr_sku" {  
  default     = "Standard"
}