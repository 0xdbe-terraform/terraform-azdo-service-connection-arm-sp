output "service_connection_id" {
  value = azuredevops_serviceendpoint_azurerm.main.id
}

output "service_connection_name" {
  value = azuredevops_serviceendpoint_azurerm.main.service_endpoint_name
}