# DevOps-Tutorial

This tutorial contains a full, real-world solution for setting up an environment that is using DevOps technologies and practices for deploying apps and cloud services/cloud infrastructure to Azure. This project was done following [this repo](https://github.com/thomast1906/DevOps-The-Hard-Way-Azure). The app is ready made and the goal is to deploy it usin DevOps technologies.

## Approach

- Configure storage account for Terraform state file.

- Create Azure AD Group for AKS admins.

- Terraform:

          - Create ACR. This will store the Docker image created from the app.

          - Create VNET and two subnets, one for the AKS deployment and the other for the app gateway.
          
          - Create Log Analytics Workspace. This will be used to view container insights of the AKS Cluster.
          
          - Create the AKS cluster and IAM roles for it.
           
- Docker:

          - Create the Dockerfile for the ready made uber app.

          - Build the image from the Dockerfile.

          - Run the image locally to test the app.

          - Tag the image and push it to ACR.

- Kubernetes:

          - Connect to the AKS instance.
          
          - Create the deployment (to run the app), service (to expose the app) and application gateway ingress (to access the app from anywhere).
          
          - Deploy the created objects.
          
- GitHub Actions:

          - Create a Service Prinicpal for GitHub with the required IAM permissions, and store the secrets on GitHub.

          - Create The CI pipline. Code is checked out -> Terraform is set up -> Terraform fmt occurs -> Terraform init occurs ->
            Terraform plan occurs -> Terraform apply occurs. This pipeline creates the AKS cluster automatically.
