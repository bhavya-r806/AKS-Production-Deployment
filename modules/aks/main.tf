
resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.aks_name
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = "myaks"
  role_based_access_control_enabled = true

   oms_agent {
    log_analytics_workspace_id = var.log_analytics_workspace_id
  }


  default_node_pool {
    name       = "default"
    node_count = 2
    vm_size    = "Standard_B2ms"
  }

  identity {
    type = "SystemAssigned"
  }

  network_profile {
    network_plugin      = "azure"
    dns_service_ip      = "10.2.0.10"
    service_cidr        = "10.2.0.0/24"
    #docker_bridge_cidr  = "172.17.0.1/16" " as it is deprecated form the latest AKS version"
  }

  tags = {
    Environment = var.environment
  }

}
