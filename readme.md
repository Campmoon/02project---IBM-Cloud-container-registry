Setting up Terraform for Container Registry

Terraform on IBM Cloud® enables predictable and consistent provisioning of IBM Cloud services so that you can rapidly build complex, multitiered cloud environments that follow Infrastructure as Code (IaC) principles. Similar to using the IBM Cloud CLI or API and SDKs, you can automate the provisioning, update, and deletion of your IBM Cloud® Container Registry instances by using HashiCorp Configuration Language (HCL).

Installing Terraform and creating a Container Registry namespace

Before you begin, ensure that you have the required access to create and work with IBM Cloud Container Registry resources.

    To install the Terraform CLI and configure the IBM Cloud Provider plug-in for Terraform, follow the Terraform on IBM Cloud getting started tutorial. The plug-in abstracts the IBM Cloud APIs that are used to provision, update, or delete Container Registry resources.

    Create a Terraform configuration file that is named main.tf. In this file, you add the configuration to create a Container Registry namespace and to assign a user an IAM access policy
    in Identity and Access Management (IAM) for that namespace by using HashiCorp Configuration Language (HCL). For more information, see the Terraform Language Documentation.

    The following example creates a namespace in the default resource group
    with a name of your choice and attaches an image retention policy to that namespace that retains 10 images. To retrieve the ID of the default resource group, the ibm_resource_group data source is used. Then, the user user@ibm.com is assigned the Manager role in the IAM access policy for the namespace for a particular region. The region is retrieved from the terraform.tfvars file that you created in step 1.