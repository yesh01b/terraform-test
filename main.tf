terraform {
    required_providers {
        azurerm = {
            source = "hashicorp/azurerm"
            version = "=3.0.0"
        }
    }
}

provider "azurerm" {
    features {}
}

resource "azurerm_resource_group" "rg" {
    name = "rg-test-01"
    location = "EastUS"
}

resource "azurerm_key_vault" "rg" {
  name                        = "keyvault-04563-01"
  location                    = azurerm_resource_group.rg.location
  resource_group_name         = azurerm_resource_group.rg.name
  tenant_id                   = "ded48db1-3ee4-4bae-abdf-841ad71064b7"
  sku_name = "standard"

  access_policy {
    tenant_id = "ded48db1-3ee4-4bae-abdf-841ad71064b7"
    object_id = "f670434d-ecdd-426f-bb6e-adb7b85335c0"

    key_permissions = [
      "Get",
    ]

    secret_permissions = [
      "Get",
    ]

    storage_permissions = [
      "Get",
    ]
  }
}

