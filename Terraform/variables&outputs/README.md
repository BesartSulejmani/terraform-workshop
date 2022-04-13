# Variables & Outputs demo

### Section 1
1. Create a folder called “variables&outputs”
2. Create a “main.tf” file 
3. Copy provider block from the earlier configuraton into your main.tf
4. Copy resources from earlier configuraton into your main.tf
   
5. Add the following variable blocks with the type of string to your variables.tf:
- location 
- rgname
- vnetname

6. Add variable with the type of bool to your variables.tf:
- Vmprotection
- Add default = false

7. Add variable with the type of list(string) to your variables.tf:
- Vnetaddress [“10.0.0.0/16”, “10.1.0.0/16”]

8. Add variable with the type of map to your variables.tf:
- Subnetmap
- Add 
```
default = { </br>
    subnet01_name = "subnet01“ </br>
    subnet01_prefix = "10.0.0.0/24" </br>
    subnet02_name = "subnet02" </br>
    subnet02_prefix = "10.1.0.0/24" </br>
}
```

9. Change the resources in your main.tf to use the variables **(refer to the source code [variables&outputs](./main.tf))**
10. Add the ouput block for vnetid like in the source code on GitHub **(refer to the source code [variables&outputs](./main.tf))** </br>
    An output block outputs information in your terminal about a specific attribute of a resource that is only known after the resource is created

11. Open this folder in integrated terminal
12.  Run ``terraform init``
13.  Run ``terraform apply --auto-approve`` and you should see the attributes like vnet name and address spaces etc. </br>
    Also an output of the vnetid is shown which is only known after apply

14.  Before continuing run ``terraform destroy --auto-approve`` and all your resources will be deleted.

15. **Use the source code, if needed, to confirm your configuration:** **[first-resource](./main.tf)**

### Section 2
16. Remove the default input of the ``vnetname variable`` leaving only the description and the type. 
17. Run ``terraform plan`` again and it will ask for input during the run. You have created an input variable and you can see the description of that variable in the terminal.

### Section 3
18. Create a ``.tfvars file`` and add the value of the ``vnetname variable`` in there called “tf-workshop-vnet01” **(refer to the source code [tfvars](./terraform.tfvars))**
19. Run ``terraform plan`` again and you’ll see that terraform picks up the value from the tfvars file automatically. Terraform recognizes tfvars files and combines them with your variables declared in your configuration.

20. **Continue with the powerpoint presentation slide:** **"Recap variables & outputs demo "**

