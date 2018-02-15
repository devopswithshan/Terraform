resource "azurerm_resource_group" "emearegdata" {
name= "CloudFabriq-WebDataApi-emeareg"
location = "North Europe"
}

resource "azurerm_app_service_plan" "emearegdata" {
name="CloudFabriq-WebDataApi-emeareg"
location="North Europe"
resource_group_name = "${azurerm_resource_group.emearegdata.name}"

sku {
    tier = "Standard"
    size="S1"
}
}

resource "azurerm_app_service" "emearegdata" {
  name                = "CloudFabriq-WebDataApi-emeareg"
  location            = "${azurerm_resource_group.emearegdata.location}"
  resource_group_name = "${azurerm_resource_group.emearegdata.name}"
  app_service_plan_id = "${azurerm_app_service_plan.emearegdata.id}"

  site_config {
    dotnet_framework_version = "v4.0"
  }


}