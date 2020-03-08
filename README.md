# PowerTerraform
A set of infrastructure as code examples specific for Dynamics and Power Platform patterns.

The example cover the creation of an Azure Service Bus, a queue, a function app (along with all the necessary pre-requisites), and assign the function read access to Auzre KeyVault.

# Prerequisites
Download the terraform installer from [here](https://www.terraform.io/downloads.html).

# Instructions
Clone the repository on your machine using the command line enter the desired folder and run the following commands
```
az login
terraform init
terraform plan
terraform apply
```
