# Prerequisites

Tools and extensions needed to get started with this workshop:

</br>

### **VS Code**
| Name                                    | Installation Method    | Install Command                                    |
| ----------------------------------------| -----------------------| ---------------------------------------------------|
| VS Code                                 | Download & Install     | [Download here](https://code.visualstudio.com/)    |
| Hashicorp Terraform                     | VS Code extension      | Install in VS Code                                 |
| Azure Account                           | VS Code extension      | Install in VS Code                                 |

---

### Azure Account vs code extension

After installing the Azure Account extension in VS Code make sure you sign in to your Azure Subscription from that extension within VS Code.

```
Tip: ctrl + shift + p brings up the command palette and then you can search for "Azure: Sign in"
```

</br>

---


### **Git**

| Name                      | Installation Method    | Install Command                                              |
| ------------------------  | ---------------------- | -----------------------------------------------------------  |
| Git                       | Download & Install     | [Download here](https://git-scm.com/downloads)     |

</br>

---

### **Terraform**

| Name                      | Installation Method    | Install Command                                              |
| ------------------------  | ---------------------- | -----------------------------------------------------------  |
| Terraform                 | Download & Install     | [Download here](https://www.terraform.io/downloads.html)     |

Terraform install for Windows:

1. After downloading the package, unzip it.
2. Create a folder in your C: drive: "C:\Terraform"
3. Copy the terraform.exe file into the folder "C:\Terraform"
4. Edit the "System Environment Variables"
5. In the "System variables" edit the "Path" variable
6. Add "C:\Terraform" 
7. Open VS Code (reopen it if it was already opened up) and run the command ``terraform --version`` and it should show you the latest version installed on your machine

</br>

---

### **Azure subscription**

If you don't have an Azure Subscription, you can get one for free for 12 months (need a creditcard to sign up). [Sign up for free here!](https://azure.microsoft.com/en-us/free/)

Or use your MSDN or Visual Studio Enterprise subscription or any other subscription you may have.