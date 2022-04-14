# Variables & Outputs demo

### Section 1
1. Create a folder called “variables&outputs”.
2. Create a “main.tf” file.
3. Create a "variables.tf" file.

```
. (terraform-workshop)
|
├── Terraform
|   ├── variables&outputs
|   |   └── main.tf
|   |   └── variables.tf
│   └── first-resource
│       └── main.tf

```

4. Copy provider block from the earlier configuraton into your main.tf
5. Copy resources from earlier configuraton into your main.tf
   
6. Add the following variable blocks with the type of string to your variables.tf:
- location 
- rgname
- vnetname

```
variable "name" {
    type = string
}
```

7. Add variable with the type of bool to your variables.tf:
- Vmprotection
- Add default = false

```
variable "name" {
    type = bool
    default = false
}
```

8. Add variable with the type of list(string) to your variables.tf:
- Vnetaddress 
- default = [“10.0.0.0/16”, “10.1.0.0/16”]

```
variable "name" {
    type = list(string)
}
```

9. Add variable with the type of map to your variables.tf:
- Subnetmap

```
variable "name" {
    type = map
    default = { 
        subnet01_name = "subnet01“
        subnet01_prefix = "10.0.0.0/24"
        subnet02_name = "subnet02"
        subnet02_prefix = "10.1.0.0/24"
    }
}
```

10.   Change the resources in your main.tf to use the variables **(refer to the source code [variables&outputs](./main.tf))**
11.   Add the ouput block for vnetid like in the source code on GitHub **(refer to the source code [variables&outputs](./main.tf))** </br>
      1.    An output block outputs information in your terminal about a specific attribute of a resource that is only known after the resource is created.

12.   Open this folder in integrated terminal
13.   Run ``terraform init``
14.   Run ``terraform apply --auto-approve`` and you should see the attributes like vnet name and address spaces etc. </br>
      1.    An output of the vnetid is shown which is only known after apply.

15.  Before continuing run ``terraform destroy --auto-approve`` and all your resources will be deleted.

### Section 2
16.    Remove the default input of the ``vnetname variable`` leaving only the description and the type. 
17.    Run ``terraform plan`` again and it will ask for input during the run. 
       1.     You have created an input variable and you can see the description of that variable in the terminal.

### Section 3
18.   Create a ``.tfvars file`` and add the value of the ``vnetname variable`` in there called “tf-workshop-vnet01” **(refer to the source code [tfvars](./terraform.tfvars))**
19.   Run ``terraform plan`` again and you’ll see that terraform picks up the value from the tfvars file automatically. 
      1.    Terraform recognizes tfvars files and combines them with your variables declared in your configuration.

20. **Continue with the powerpoint presentation slide:** **"Recap variables & outputs demo "**

