terraform {
  required_version = ">= 1.6.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.113"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.6"
    }
  }
}

provider "azurerm" {
  features {}
}

variable "location" {
  type    = string
  default = "eastus"
}

variable "rg_name" {
  type    = string
  default = "rg-csed-staging"
}

variable "acr_name" {
  type    = string
  default = "acrcsed1234"
}

variable "aci_name" {
  type    = string
  default = "aci-hello-staging"
}

variable "image" {
  type    = string
  default = "acrcsed1234.azurecr.io/hello-fastapi:latest"
}

resource "azurerm_resource_group" "rg" {
  name     = var.rg_name
  location = var.location
}

resource "azurerm_container_registry" "acr" {
  name                = var.acr_name
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.location
  sku                 = "Basic"
  admin_enabled       = true
}

resource "random_id" "suffix" {
  byte_length = 2
}

resource "azurerm_container_group" "aci" {
  name                = var.aci_name
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  ip_address_type     = "Public"
  dns_name_label      = "${var.aci_name}-${random_id.suffix.hex}"
  os_type             = "Linux"

  container {
    name   = "app"
    image  = var.image
    cpu    = 1
    memory = 1.5

    ports {
      port     = 8080
      protocol = "TCP"
    }
  }

  exposed_port {
    port     = 8080
    protocol = "TCP"
  }
}
