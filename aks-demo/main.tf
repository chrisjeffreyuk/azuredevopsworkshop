provider "azurerm" {
  features {}
}


terraform {
  backend "azurerm" {
    storage_account_name  = "__terraformstorageaccountname__"
    container_name        = "terraform"
    key                   = "terraform.tfstate"
  }
}


resource "azurerm_resource_group" "example" {
  name     = "__resourcegroupname__"
  location = "__location__"
}


data "azurerm_key_vault_secret" "clientsecret" {
name = "clientsecret"
vault_uri = "https://cjhack-vault.vault.azure.net/"
}


resource "azurerm_kubernetes_cluster" "example" {
  name                = "__k8sclustername__"
  location            = "${azurerm_resource_group.example.location}"
  resource_group_name = "${azurerm_resource_group.example.name}"
  dns_prefix          = "__k8sclusterdnsname__"

  agent_pool_profile {
    name            = "default"
    count           = 2
    vm_size         = "Standard_D1_v2"
    os_type         = "Linux"
    os_disk_size_gb = 30
  }


  service_principal {
    client_id     = "03fc3f84-61cd-4444-ae6c-401d19ca7145"
    client_secret = "${data.azurerm_key_vault_secret.clientsecret.value}"
  }


  tags = {
    Environment = "DEMO"
  }
}
