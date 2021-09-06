terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>2.69.0"
    }
  }
}

provider "azurerm" {
  #Add subscription_id and tenant_id to avoid "az login" error message:
  #Error: Error building AzureRM Client: obtain subscription() from Azure CLI: Error parsing json result from the Azure CLI: Error waiting for the Azure CLI: exit status 1: ERROR: Please run 'az login' to setup account.
  #with provider["registry.terraform.io/hashicorp/azurerm"]
  #on main.tf line 10, in provider "azurerm":
  subscription_id = var.subscription_id
  tenant_id       = var.tenant_id
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

module "sa" {
  source = "./modules/storage_account"

  storage_account_name = var.storage_account_name
  resource_group_name  = var.resource_group_name
  location             = var.location
}

module "container" {
  source = "./modules/container"

  storage_account_name = module.sa.sa_name
}

output "storage_account" {
  value = module.sa.sa_name
}

output "container" {
  value = module.container.container_name
}