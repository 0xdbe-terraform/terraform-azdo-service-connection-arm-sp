locals {
  azure_location       = "eastus"
  project_name         = "HelloWorld"
  project_description  = "A simple demo app in Azure"
  project_repositories = ["frontend", "backend"]
}

data azurerm_subscription current {
}

provider "azurerm" {
  features {}
}

module "azdo_project" {
  source               = "git::https://github.com/0xdbe-terraform/terraform-azure-azdo-project.git?ref=v3.0.1"
  project_name         = local.project_name
  project_description  = local.project_description
  project_repositories = local.project_repositories
}

module "azure_ad_service_principal_azdo" {
  source                    = "git::https://github.com/0xdbe-terraform/terraform-azure-ad-service-principal.git?ref=v2.0.2"
  application_full_name     = local.project_name
  application_environment   = "test"
  service_principal_purpose = "azdo"
}

module "azure_ressource_group" {
  source                 = "git::https://github.com/0xdbe-terraform/terraform-azure-resource-group.git?ref=v2.0.2"
  azure_location          = local.azure_location
  application_full_name   = local.project_name
  application_short_name  = local.project_name
  application_environment = "test"
  contributors            = [module.azure_ad_service_principal_azdo.service_principal_id]
}

module "azdo_service_connexion_arm" {
  source                   = "../"
  project_id               = module.azdo_project.project_id
  resource_group_name      = module.azure_ressource_group.name
  service_principal_app_id = module.azure_ad_service_principal_azdo.application_id
  service_principal_key    = module.azure_ad_service_principal_azdo.service_principal_key
  subscription_id          = data.azurerm_subscription.current.subscription_id
  subscription_name        = data.azurerm_subscription.current.display_name
  tenant_id                = data.azurerm_subscription.current.tenant_id
}