# Dependencies & Data Sources demo

### Section 1
1. Create a new folder “dependencies&datasources”.
2. Create a new main.tf and copy the provider and resource group of an earlier configuration.
3. Add an **App Service Plan and App service** to your main.tf. **(refer to the source code [dependencies&datasources](./main.tf))**
4. Add the ``depends_on`` argument to the app service referring to the plan. **(refer to the source code [dependencies&datasources](./main.tf))** </br>
   1. Terraform knows that an app plan belongs to an app service but for the purpose of learning, we’re adding this explicit dependency.

5. Run ``terraform apply`` and approve the changes.
   1. Without the explicit dependancy, terraform creates multiple resources in parallel. But, with the explicit dependency defined in this configuration, </br>
   2. Terraform creates the resources one by one. This means that it waits till the first resource is created, before the other one comes in that has an explicit dependency defined.

### Section 2
6. Create a new resource group and storage account manually in the azure portal. </br>
   1. Remember that a storage account name must be globally unique.
7. Create a container in the storage account called “containerformyapp”.
8. Go back to your main.tf, add a data source for the storage account you just created manually. **(refer to the source code [dependencies&datasources](./main.tf))**
   1. A data block is just like a resource block. You set the kind of block (data in this case), you set the type of resource "azurerm_storage_account" and then a reference name for example "tfstatestorage"
   2. Refer to the Terraform registry **[Data Source: azurerm_storage_account](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/storage_account)** to see the required attributes for a data source of the type "azurerm_storage_account" if you want to know more detailed information on this data source block. 
   3. When referring to my source code, keep in mind here to set the name of your own storage account you just created.

9.  Configure an output with the storage account tier. **(refer to the source code [dependencies&datasources](./main.tf))**
    1.  Remember that the output returns a certain value of a resource after it has been created. Though in this case we're using the output block for an existing storage account outside our configuration so it could come in handy to know what a certain value is of that resource if it's not existing in our Terraform configuration.

10. Uncomment the storage account sub block in the azure app service configuration (Notice some attributes in this block referencing the data source) **(refer to the source code [dependencies&datasources](./main.tf))**
11. Run ``terraform apply`` and approve the changes
12. Open the app service in Azure
13. Go to the “configuration” tab
14. Open “path mappings” </br>
    You’ll see the storage account container that was created manually. It's now configured in the app service, that was created by Terraform with the use of a data source block, to retrieve the information on a resource that was outside your Terraform configuration.

### **Note!**
Before continuing, run ``terraform destroy`` and all your resources deployed with Terraform will be deleted. **Leave the storage account that you created manually** for the next demos.

1.  **Continue with the powerpoint presentation slide:** **"Recap dependencies & data sources demo"**
