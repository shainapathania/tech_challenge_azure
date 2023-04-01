                                                     **Tech Challenge Azure**
                                           
This respository contains solution to Azure Cloud Technical Challenges.

* **Challenge I: A 3-tier architecture in Azure **  (infrastructure as code -Terraform)
Here in first challenge Terraform creates 3-tier architecture in Azure Platform . I have used below architecture diagram to implement it.

Architecture diagram:


![image](https://user-images.githubusercontent.com/62846579/229301643-f2cd0880-cc78-4cfd-85ee-8e901be38678.png)

**Note**** : This setup uses only http connection due to non-availabilty of SSL certificate. Also uses PIP instead of DNS Names.


**Description**: 
* Frontend application gateway(layer 7) which is regional resource recieves the traffic on Port 80
* Based on Routing Rules traffic will be routed to backends which is App service in our case. It could be windows / linus VM with IIS / webserver installed on it.
* App service tech stack is configured based on requirements. I have considered deafult setup for App service provided by Terraform documentation
* App service settings and SQL Azure connection string can be stored in Keyvault.
* No app code is deployed using these

      What Azure Resource will be created by Terraform :
      * Resource group --> rg_tech_challenge_cus
      * Vnet  -- > vnet-01-cus-tc
      * Subnet --> Subnet-01
      * App Service Plan --> tech_challenge_asp
      * App service  --> tech-challenge-as
      * Application Gateway --> tech_challenge_appgwy_cus
      * Public IP --> tech_challenge_appgwy_cus-pip
      * keyvault --> tech-challenge-cus
      * SQL DB Server --> tech-challenge-db-server
      * SQL DB --> tech-challenge-db

---------------------------------------------------------------------

*** Challenge II: Script to generate the json format metadata for Azure instances.**

**Problem Statement:**  Write Script that generate json format metata data for Azure Instances

**Language Used**: Powershell with Azure respource graph query.

Benifits of using Azure resource graph query.

* **Fast and Scalable:** Azure Resource Graph queries are optimized for speed and scalability, allowing you to query across large sets of resources and get results quickly.

* **Flexibility**: Resource Graph queries are flexible and powerful, allowing you to query and explore resources across multiple subscriptions, resource groups, and regions with a single query.

**Cost-Effective**: Azure Resource Graph queries can help you optimize your resource usage by identifying underutilized or overprovisioned resources, allowing you to make informed decisions about resource allocation and cost management.

**Integration**: Resource Graph can be integrated with Azure Policy and Azure Security Center, enabling you to create policies and security recommendations based on the results of Resource Graph queries.

**Customization**: You can create custom Resource Graph queries to fit your specific needs, allowing you to explore and analyze your resources in ways that are not possible with ARM.

--
**Script Functionality:**

    Pre-requisite: Azure Resource Graph Module, Az Cli module, Powershell version >= 5.1
    Required Parameters: ** Subscription ID, Resource Group Name and VM Name
     **It requires user to sign in to Azure Portal alternatively you can use Service Pricipal.
  
     * Once users are logged in through connect-AzAccount command, script with Prompt for subcription ID, Resource group Name and VM name(these should be non NULL and       non empty values as it has validation for it) 
     * Based on Parameters it fetch the metadata of VMs using Azure resource graph query.
    * Then it convert result to JSON format.


----------------------------------------------------------------------

*** Challenge III: Write Script to get vaule from nested object**

    Pre-requisite: Python 3.11.1
    
    **Script Functionality:**
        * Function accepts two parameters one is nested object and other is key 
        * It splits the key based on '/' and create a list
        * For above list we will loop through the object which is in form of dictionary or key-value pair.
        * once loop reaches to final iteration of key, it returns value for that key in nested object 
    








