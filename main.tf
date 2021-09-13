resource azuredevops_serviceendpoint_azurerm main {
  project_id                = var.project_id
  service_endpoint_name     = "SC-ARM-${var.subscription_name}-${var.resource_group_name}"
  # resource_group            = var.resource_group_name
  credentials {
    serviceprincipalid      = var.service_principal_app_id
    serviceprincipalkey     = var.service_principal_key
  }
  azurerm_spn_tenantid      = var.tenant_id
  azurerm_subscription_id   = var.subscription_id
  azurerm_subscription_name = var.subscription_name
}
