# Setting up Terraform for Container Registry

# The following example creates a namespace in the default resource group with a name of your choice and attaches an image retention policy to that namespace that retains 10 images.

# https://cloud.ibm.com/docs/Registry?topic=Registry-registry_terraform-setup&interface=ui

data "ibm_resource_group" "group" {
    name = "Default"
}

resource "ibm_cr_namespace" "cr_namespace" {
    name = "02project"
    resource_group_id = data.ibm_resource_group.group.id
}

resource "ibm_cr_retention_policy" "cr_retention_policy" {
    namespace = ibm_cr_namespace.cr_namespace.id
    images_per_repo = 10
}

resource "ibm_iam_user_policy" "policy" {
    ibm_id = "rtalotta@us.ibm.com"
    roles  = ["Manager"]

    resources {
        service = "container-registry"
        resource = ibm_cr_namespace.cr_namespace.id
        resource_type = "namespace"
        region = var.region
    }
}