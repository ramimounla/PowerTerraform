# PowerTerraform
A set of infrastructure as code examples specific for Dynamics and Power Platform patterns.

The example cover the creation of an Azure Service Bus, a queue, a function app (along with all the necessary pre-requisites), and assign the function read access to Auzre KeyVault.

# Prerequisites
Download the terraform CLI from [here](https://www.terraform.io/downloads.html).
Download the Azure CLI from [here](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli-windows?view=azure-cli-latest).

# Instructions
1. Clone the repository on your machine.
2. Update the terraform.tfvars files of the resource you would like to deploy.
3. Using the command line enter the desired folder and run the following commands
```
az login
terraform init
terraform plan
terraform apply
```
