resource "azurerm_resource_group" "emeareg" {
name= "Cloudfabriqemeareg-OnlineSales"
location = "North Europe"
}

resource "azurerm_app_service_plan" "emeareg" {
name="cloudfabriqonlinesalesemeareg"
location="North Europe"
resource_group_name = "${azurerm_resource_group.emeareg.name}"

sku {
    tier = "Standard"
    size="S1"
}
}

resource "azurerm_app_service" "emeareg" {
  name                = "cloudfabriqonlinesalesemeareg"
  location            = "${azurerm_resource_group.emeareg.location}"
  resource_group_name = "${azurerm_resource_group.emeareg.name}"
  app_service_plan_id = "${azurerm_app_service_plan.emeareg.id}"

  site_config {
    dotnet_framework_version = "v4.0"
  }


}