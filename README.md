# Terraform Azure AZDO Service Connection for ARM with SP

This module for Terraform allows to create a service connection for ARM (Azure Resource Manager) using Service Principal.
This service connexion is scoped in a subscription and a Ressource Group.

## Usage

- Set Azure DevOps variable

```console
$ export AZDO_PERSONAL_ACCESS_TOKEN=<PAT>
$ export AZDO_ORG_SERVICE_URL=https://dev.azure.com/<ORGANIZATION>/
```

- See main.tf in example