resource "random_id" "value" {
    byte_length = 8
}

resource "azurerm_log_analytics_workspace" "dev" {
    # The WorkSpace name has to be unique across the whole of azure, not just the current subscription/tenant.
    # name                = "${var.log_analytics_workspace_name}-${random_id.valye.dec}"

    name                = var.log_analytics_workspace_name   

    resource_group_name = azurerm_resource_group.dev.name
    location            = azurerm_resource_group.dev.location   # refer https://azure.microsoft.com/global-infrastructure/services/?products=monitor for log analytics available regions

    sku                 = var.log_analytics_workspace_sku
}

resource "azurerm_log_analytics_solution" "dev" {
    solution_name         = "ContainerInsights"

    resource_group_name   = azurerm_resource_group.dev.name
    location              = azurerm_resource_group.dev.location
    
    workspace_resource_id = azurerm_log_analytics_workspace.dev.id
    workspace_name        = azurerm_log_analytics_workspace.dev.name

    plan {
        publisher = "Microsoft"
        product   = "OMSGallery/ContainerInsights"
    }
}

resource "azurerm_kubernetes_cluster" "dev" {
    name                  = var.aks_cluster_name
    dns_prefix            = var.aks_dns_prefix

    resource_group_name   = azurerm_resource_group.dev.name
    location              = azurerm_resource_group.dev.location
    
    kubernetes_version    = var.kubernetes_version

    default_node_pool {
        name                = "avagentpool"
        type                = "VirtualMachineScaleSets"        
        vm_size             = var.aks_vm_size        
        os_disk_size_gb     = 30
        
        availability_zones  = ["1", "2"]
        enable_auto_scaling = true
        enable_node_public_ip = false

        node_count          = var.aks_node_count
        min_count           = 1
        max_count           = 3
        max_pods            = 110
    }
    
    linux_profile {
        admin_username = "ubuntu"

        ssh_key {
            key_data = file(var.ssh_public_key)
        }
    }

    addon_profile {
        oms_agent {
            enabled                    = true
            log_analytics_workspace_id = azurerm_log_analytics_workspace.dev.id
        }        
    }

    network_profile {        
        network_plugin      = var.network_plugin
        load_balancer_sku   = var.load_balancer_sku
    }

    identity {
        type = "SystemAssigned"
    }

    tags = {
        Environment = var.environment
    }
}

resource "azurerm_container_registry" "dev" {
    name                = var.acr_name
    sku                 = var.acr_sku

    resource_group_name = azurerm_resource_group.dev.name
    location            = azurerm_resource_group.dev.location    
}
