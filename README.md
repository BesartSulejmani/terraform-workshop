# **Terraform Workshop**

This repository contains the code that is demoed during the presentation **"Infrastructure as Code with Terraform"** given by Besart Sulejmani. </br>

The PowerPoint slide deck has been added to this repository. Make sure to check the "notes" in each PowerPoint slide for extra information. I recommend to go through the PowerPoint slide deck before starting to work with the configurations and instructions.

</br>

README files have been added in each configuration folder as an instruction set to help you go over the demos by yourself.

# Logical order of this workshop

- Go through the PowerPoint slide deck and switch between the demo slides to the below instructions

1. [First resource configuration](./Terraform/first-resource/README.md#first-resource-demo)
2. [Terraform Commands](./Terraform/first-resource/README.md#terraform-commands-demo)
3. [Variables & Outputs](./Terraform/variables%26outputs/README.md)
   1. [Section 1 General usage variables & outputs](./Terraform/variables%26outputs/README.md#section-1-general-usage-variables--outputs)
   2. [Section 2 Input variables](./Terraform/variables%26outputs/README.md#section-2-input-variables)
   3. [Section 3 .tfvars file](./Terraform/variables%26outputs/README.md#section-3-tfvars-file)
4. [Dependencies & Data Sources](./Terraform/dependencies%26datasources/README.md)
   1. [Section 1 Dependencies](./Terraform/dependencies%26datasources/README.md#section-1-dependencies)
   2. [Section 2 Data Sources](./Terraform/dependencies%26datasources/README.md#section-2-data-sources)
5. [Modules & Remote Backends](./Terraform/modules%26remotebackends/README.md)
   1. [Section 1 Modules](./Terraform/modules%26remotebackends/README.md#section-1-modules)
   2. [Section 2 Remote Backends](./Terraform/modules%26remotebackends/README.md#section-2-remote-backends)
6. [CI/CD Automation](./Terraform/cicdautomation/README.md)
   1. [Section 1 Azure DevOps organization & Service Connection setup](./Terraform/cicdautomation/README.md#section-1-azure-devops-organization--service-connection-setup)
   2. [Section 2 Uploading your source code to Azure Repos](./Terraform/cicdautomation/README.md#section-2-uploading-your-source-code-to-azure-repos)
   3. [Section 3 Azure DevOps Marketplace Extensions](./Terraform/cicdautomation/README.md#section-3-azure-devops-marketplace-extensions)
   4. [Section 4 Variable Groups](./Terraform/cicdautomation/README.md#section-4-variable-groups)
   5. [Section 5 Automation with an Azure Pipeline](./Terraform/cicdautomation/README.md#section-5-automation-with-an-azure-pipeline)

</br>

## Check the [**prerequisites**](Prerequisites.md) before you start!

</br>

***Focus is deploying Azure resources with Terraform*