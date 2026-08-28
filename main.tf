resource "azurerm_resource_group" "rg" {
  name     = "devopsABC"
  location = "Central India"
}

resource "azurerm_service_plan" "plan" {
  name                = "devopsabc-plan"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  os_type  = "Linux"
  sku_name = "B1"
}

resource "azurerm_linux_web_app" "app" {
  name                = "devopsabc-webapp"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  service_plan_id     = azurerm_service_plan.plan.id

  site_config {}
}

resource "azurerm_container_registry" "acr" {
  name                = "devopsabcacr2026"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  sku                 = "Basic"
  admin_enabled       = false
}
