variable "project_id" {
  type        = string
  description = "Identifier of your project"
}

variable "resource_group_name" {
  type        = string
  description = "Name of your resource group where service principal is contributor"
}

variable "service_principal_app_id" {
  type        = string
  description = "Application identifier of your service principal"
}

variable "service_principal_key" {
  type        = string
  description = "Secret key of your service principal"
}

variable "subscription_id" {
  type        = string
  description = "Identifier of your subscription"
}

variable "subscription_name" {
  type        = string
  description = "Name of your subscription"
}

variable "tenant_id" {
  type        = string
  description = "Identifier of your project"
}

