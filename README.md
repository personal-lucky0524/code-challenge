# code-challenge

This repo contains the following:
--------------------------------
- Terraform modules for creating Azure AKS infra
- Azure Pipelines for deploying terraform modules for Azure AKS
- Azure Pipelines for deploying nginx sample app on to AKS cluster


$ az login
$ az account show -o table
$ az account set --subscription <subscriptionId>
$ az ad sp create-for-rbac --name code-challenge-spn --role contributor --scopes /subscriptions/<subscriptionId>/resourceGroups/demo-env-rg
  {
  "appId": "c1bbf391-2585-47fb-afaf-c7f6c0b252e3",
  "displayName": "code-challenge-spn",
  "password": "WBw8Q~bO-SAwRHVZy.95ZK~huB.EMe735mr0hbJY",
  "tenant": "380c5b63-2fe8-4b52-a59f-25138aa86c9d"
  }
  

