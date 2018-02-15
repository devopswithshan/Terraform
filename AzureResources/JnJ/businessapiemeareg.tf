resource "azurerm_resource_group" "emearegbusiness" {
name= "cloudfabriqonlinesalAgilityWorks-CloudFabriq-BusinessApi-emeareg"
location = "North Europe"
}

resource "azurerm_app_service_plan" "emearegbusiness" {
name="cloudfabriqonlinesalAgilityWorks-CloudFabriq-BusinessApi-emeareg"
location="North Europe"
resource_group_name = "${azurerm_resource_group.emearegbusiness.name}"

sku {
    tier = "Standard"
    size="S1"
}
}

resource "azurerm_app_service" "emearegbusiness" {
  name                = "AgilityWorks-CloudFabriq-BusinessApi-emeareg"
  location            = "${azurerm_resource_group.emearegbusiness.location}"
  resource_group_name = "${azurerm_resource_group.emearegbusiness.name}"
  app_service_plan_id = "${azurerm_app_service_plan.emearegbusiness.id}"

  site_config {
    dotnet_framework_version = "v4.0"
  }


}