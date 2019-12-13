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

resource "azurerm_virtual_network" "example" {
  name                = "__vnetname__"
  resource_group_name = "${azurerm_resource_group.example.name}"
  location            = "${azurerm_resource_group.example.location}"
  address_space       = ["10.0.0.0/16"]
}

resource "azurerm_subnet" "subnet1" {
  name                 = "web-subnet"
  virtual_network_name = "${azurerm_virtual_network.example.name}"
  resource_group_name  = "${azurerm_resource_group.example.name}"
  address_prefix       = "10.0.1.0/24"
}

resource "azurerm_subnet" "subnet2" {
  name                 = "app-subnet"
  virtual_network_name = "${azurerm_virtual_network.example.name}"
  resource_group_name  = "${azurerm_resource_group.example.name}"
  address_prefix       = "10.0.2.0/24"
}

resource "azurerm_subnet" "subnet3" {
  name                 = "data-subnet"
  virtual_network_name = "${azurerm_virtual_network.example.name}"
  resource_group_name  = "${azurerm_resource_group.example.name}"
  address_prefix       = "10.0.3.0/24"
}

resource "azurerm_subnet" "subnet4" {
  name                 = "aks-subnet"
  virtual_network_name = "${azurerm_virtual_network.example.name}"
  resource_group_name  = "${azurerm_resource_group.example.name}"
  address_prefix       = "10.0.4.0/24"
}