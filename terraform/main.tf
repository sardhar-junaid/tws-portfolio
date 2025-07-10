provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "portfolio_rg" {
  name     = "tws-portfolio-rg"
  location = "East US"
}

resource "azurerm_storage_account" "portfolio_sa" {
  name                     = "junaidportfoliosa123"
  resource_group_name      = azurerm_resource_group.portfolio_rg.name
  location                 = azurerm_resource_group.portfolio_rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_account_static_website" "portfolio_web" {
  storage_account_id = azurerm_storage_account.portfolio_sa.id
  index_document     = "index.html"
  error_404_document = "index.html"
}

