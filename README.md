# DevOps-Tutorial
DevOps Tutorial
This tutorial contains a full, real-world solution for setting up an environment that is using DevOps technologies and practices for deploying apps and cloud services/cloud infrastructure to Azure. This project was done following [this repo](https://github.com/thomast1906/DevOps-The-Hard-Way-Azure).

## Approach

- Configure storage account for Terraform state file.

- Create Azure AD Group for AKS admins.

Terraform:
          - Create ACR. This will store the Docker image created from the app.

          - Create VNET and two subnets, one for the AKS deployment and the other for the app gateway.
          
          - Create Log Analytics Workspace. This will be used to view container insights of the AKS Cluster.
          
          - Create the AKS cluster and IAM roles for it.
