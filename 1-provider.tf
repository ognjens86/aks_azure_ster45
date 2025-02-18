terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.19.0"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "2.17.0"
    }
  }
}
provider "azurerm" {
  features {}
  subscription_id = "858edadb-886f-4947-a8a3-a51698a91fa1"
}
