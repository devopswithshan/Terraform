
resource "azurerm_resource_group" "test" {
  name     = "shancreatedusingtf"
  location = "West US"

  tags {
    environment = "Production"
  }
}