#===================================================================
# Azure Resources Details
#===================================================================
variable "environment" {
  default = "dev"
}

variable "resource_group_name" {
  default = "rg-av-tf-aks"
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

variable log_analytics_workspace_name {
    default = "avloganalytics"
}

variable log_analytics_workspace_sku {
    default = "PerGB2018"   # refer https://azure.microsoft.com/pricing/details/monitor/ for log analytics pricing 
}

variable "acr_name" {  
  default     = "avacr"  // It should be globally unique
}

variable "acr_sku" {  
  default     = "Standard"
}