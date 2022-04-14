# Automation with Azure DevOps demo

### Section 1
1. Set up an Azure DevOps organization for free to get started on [this page](https://azure.microsoft.com/en-us/services/devops/?nav=min).
2. Give your organization a name.
3. Choose the location that is most close to you where your project will be hosted (Azure Region).
4. Create a new project and give that a name as well (leave everything else default).

5. In your project, go to project settings.
6. Set up a service connection. [More info here!](https://docs.microsoft.com/en-us/azure/devops/pipelines/library/connect-to-azure?view=azure-devops)
7. Choose Azure Resource Manager for your Service Connection and click next.
8. Choose Service principal (automatic).
9. Select your Azure subscription where you want your resources deployed to.
10. Give the service connection a name and remember it or note it down somewhere (later used for your pipeline to connect).
11. Tik the box “grant access permission to all pipelines”

</br>

### Section 2
1. Copy this folder “cicdautomation” and add it to the Terraform folder. **(refer to the source code [cicdautomation](../cicdautomation))**
   1. This folder contains almost the same configuration as the “modules&remotebackends” config but it’s slightly different. You're going to use this configuration to deploy from an Azure DevOps pipeline. 

</br>

2. Copy the “.gitignore” file from the source code root folder. **(refer to the source code [.gitignore](../../.gitignore))**
   1. The .gitignore file contains file types and folders that you don’t want to push to your central repository like the terraform providers or files containing secrets etc. The reason is because in a later step you will push your code to Azure DevOps repos.

3. Copy the “azuredevops-pipeline.yml” from the source code. **(refer to the source code [pipeline file](../../azuredevops-pipeline.yml))**
   1. This is the yaml file that will be used to set up the “CI/CD” pipeline in Azure DevOps in a later section.

4. In VS Code open the root folder in an integrated terminal 
   1. We're going to use Git in the next steps. For more info on Git check out **[Introduction to Git](https://docs.microsoft.com/en-us/learn/modules/intro-to-git/)**.
   2. Execute the command: 	``git init``
   3. Execute the command: 	``git add .``
   4. Execute the command: 	``git commit –m “initial commit”``

5. Open Azure Repos in your Azure DevOps project.
6. Below the “Push an existing repository from command line” copy the command: 	``git remote add origin <url of your azure devops repo>``
   1. Execute the command in your VS Code terminal: 	``git remote add origin <url of your azure devops repo>``
   2. Execute the command in your VS Code terminal: 	``git push -u origin –all``
   3. If you look over in your Azure DevOps project in the Repos section (refresh the page if needed), you’ll see that your code has been pushed over to Azure DevOps.

</br>

### Section 3
7. Go to the [Azure DevOps Marketplace](https://marketplace.visualstudio.com/azuredevops).
7. Search for Terraform.
8. Select Terraform from Microsoft DevLabs and click “get it free”.
9. Install the extension for your Azure DevOps organization.

</br>

### Section 4
10. Open your Azure DevOps project.
11. Go to the Pipelines section and open “Library”.
12. Create a new variable group.
   1. Name: backend_config
   2. Variables key value pairs (Use the resource group and storage account that was manually created earlier):

```
    tbc__backend_service_arm	<service connection name>
    tbc__resource_group_name	<resource group name>
    tbc__storage_account_name 	<storage account name>
    tbc__stcontainer_name	    <storage container name>
    tbc__tfstate		        <tfstate file name>
```
</br>

### Section 5
13. Open the Pipelines page.
14. Click on “New Pipeline”.
15. Select “Azure Repos Git”.
16. Select the repository name that contains your code.
17. Select “Existing Azure Pipelines YAML File”.
18. Select in the “Path” drop down bar the “azuredevops-pipeline.yml” file and click continue.
19. Click “Run” in the next page and watch how the Terraform configuration in the folder “cicdautomation” will be deployed into your Azure subscription automatically.
    1.  The yaml file contains comments in each section with an explanation what they stand for so be sure to check that out.

### **Note!**
Don't forget to clean up the resources if you don't need them anymore in your Azure subscription. </br>
Delete them manually or **challenge yourself** and try to to create another pipeline that has the ``terraform destroy`` command in it. 