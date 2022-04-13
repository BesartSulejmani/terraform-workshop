# First-Resource demo

1. Create a folder called “Terraform”
2. Create a sub folder called “first-resource”
3. Create a “main.tf” file 
4. Start off with the terraform block and add the required providers block, in this case azurerm
   1. Specify the source and version

5. Add the providers block for azurerm with the features block and leave it empty
6. Add a resource block
   1. Resource is telling terraform that we want to create something
   2. The Type tells terraform the actual resource that you want to create
   3. Name isn’t what we want to call the resource but rather internally inside our Terraform code how we can refer to it

7. Add virtual network resource with the attributes as is in the source code

8. **Use the source code, if needed, to confirm your configuration:** **[first-resource](./main.tf)**
9. **Continue with the powerpoint presentation slide:** **"Recap first-resource"**

----------------------------------

# Terraform Commands demo

1. Open the first-resource folder in an integrated terminal in VS Code
2. Run the command ``terraform init`` </br>
   This will initialize the project and download the azurerm provider. The provider is stored in the '.Terraform' folder that wil also be created after init has run succesfully. 

3. Run the command ``terraform plan`` </br>
   This will check what has already been set up or what has been changed. In the plan you can see there are properties defined by you, the user. </br>
   You also see all these “known after apply” properties. These are compute generated resources that are only known after the resource has been created. </br>
   You can see the plan to add, change and/or destroy resources. This way you can tell, what Terraform is going to create.

4. Run the command ``terraform apply`` </br>
   Terraform apply runs terraform plan to confirm what it’s setting up and prompts you if you want to continue deploying. </br>
   Terraform apply then makes an API call to the Azure Resource Manager and sets up the resources (Azure account extension you have installed in VS Code, </br>
   is what makes the connection with your Azure subscription in this case). </br>
   After the apply is finished, you will see a terraform.tfstate file in your working directory. Open the state file and you’ll see in a json format, the resources that have been deployed with Terraform. </br>
   Check the Azure portal for the deployed resources.

5. Run the command ``terraform destroy`` </br>
   Destroy will delete all the resources declared in the state file. </br>
   When running destroy, it will also output a plan first and promp you if you want to continue. Before you do that, continue to the next step below. </br>
   Check state file during destroy. You should receive a locked error because the state file is not accessible when a command is running like apply or destroy. </br>
   Locking is used by Terraform as a “security” measure when working in a group on the same state. This way no parallel changes can occur on the state file. </br> 
   If parallel changes would be made, it can mess up the state file and with that your environment becomes unmanagable through Terraform. </br>

6. Approve terraform destroy and check state file again after destroy is done. You’ll see that the state file is empty and doesn’t contain any resources anymore. </br>
   The resources should have also been deleted in your Azure subscription.


7. **Use the source code, if needed, to confirm your configuration:** **[first-resource](./main.tf)**
8. **Continue with the powerpoint presentation slide:** **"Terraform state file"**

