# PowerTerraform
A set of infrastructure as code examples specific for Dynamics and Power Platform patterns.

The example cover the creation of an Azure Service Bus, a queue, a function app (along with all the necessary pre-requisites), and assign the function read access to Auzre KeyVault.

# Prerequisites
Download the terraform CLI from [here](https://www.terraform.io/downloads.html).
Download the Azure CLI from [here](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli-windows?view=azure-cli-latest).

# Instructions
1. Clone the repository on your machine.
2. Update the terraform.tfvars files of the resource you would like to deploy with your prefered values.
3. Using the command line enter the desired folder and run the following commands - the plan command display what will change without making any changes so it could be optional. Given that the files are following the naming conventions, there is no need to specify the file names (e.g. terraform.tfvars).
```
az login
terraform init
terraform plan
terraform apply
```
