# Modules & Remote Backends demo

### Section 1 Modules
1. Create a new folder “modules&remotebackends”.
2. Create a main.tf file and copy the provider and resource group from the previous configuration.
3. Create a folder “myapp” within the folder “modules&remotebackends”.
   1. Create a main.tf for myapp folder.
   2. Copy the configuration from my source code. **(refer to the source code [myapp module](./myapp/main.tf))**

```
. (terraform-workshop)
|
├── Terraform
|   ├── modules&remotebackends
|   |   ├── myapp
|   |   |   └── main.tf
|   |   └── main.tf
|   ├── dependencies&datasources
|   |   └── main.tf
|   ├── variables&outputs
|   |   └── main.tf
|   |   └── variables.tf
│   └── first-resource
│       └── main.tf

```

4. Declare the module block in the root main.tf file. **(refer to the source code [modules&remotebackends](./main.tf))**
   1. The module block contains only the type of resource (module in this case) and a reference name "myappservice".
   2. In a module block you have to define a source path where the module configuration resides. In this case it's the subfolder called "myapp".
   3. The two variables we have set in the module, makes the module more reusable. We can call this module in different Terraform projects and create the app service in different resourcegroups with a different Azure Region (location).

### Section 2 Remote Backends
5. In the root main.tf add to the terraform block:

```
backend “azurerm” {
	resource_group_name  	= "tfstate-rg“ 	        # name of the resource group in Azure you created manually
    storage_account_name 	= "tfstatebesart“	    # name of the storage account in Azure you created manually
    container_name       	= "tfstate“		        # create a container if you don’t have one or use “mycontainerapp” you created earlier
    key                  	= "workshop.tfstate“	# the name of the terraform.tfstate file (can be any name as long as it ends in .tfstate)
} 
```

6. Run ``terraform init`` to initialize the backend and you’ll receive the message:
   1. Successfully configured the backend "azurerm"! Terraform will automatically use this backend unless the backend configuration changes.
   
7. Run ``terraform apply`` and approve the changes.
   1. Check the storage container in your Azure subscription and you should see the “workshop.tfstate” file there instead of it being locally on your machine. Everyone who gets access or has access to this storage account and when working with version control (Git) on the same source code, can access this state file. In this way you can work together with others on the same project.
   2. It’s also a best practice to store the state file in a remote backend like this! For AWS you could use for example an S3 bucket.
   3. Furthermore you should see the App service plan and App service in your Azure portal that have been deployed by calling upon it as a module.

8. Run ``terraform destroy`` and approve to destroy the resources you deployed. **Again leave the storage account that you created manually** for the next demo.
9. **Continue with the powerpoint presentation slide:** **"Recap modules & remote backends demo"**