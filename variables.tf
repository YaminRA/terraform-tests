locals {
  solr_subnet_cidr_prefix = "10.68.19"
  solr_subnet_cidr        = "${local.solr_subnet_cidr_prefix}.240/28"
  solr_lb_ip              = "${local.solr_subnet_cidr_prefix}.244"
  solr_master_nic_ip      = "${local.solr_subnet_cidr_prefix}.245"
  solr_slave1_nic_ip      = "${local.solr_subnet_cidr_prefix}.246"
  solr_slave2_nic_ip      = "${local.solr_subnet_cidr_prefix}.247"
  solr_master_vm_name     = "${module.solr_rg.name}-master"
  solr_slave1_vm_name     = "${module.solr_rg.name}-slave1"
  solr_slave2_vm_name     = "${module.solr_rg.name}-slave2"
  datadisk_sa_type        = "Premium_LRS"
  datadisk_create_opt     = "Empty"
  datadisk_size           = 512
  vm_size                 = "Standard_DS1_v2"
  osdisk_sa_type          = "Premium_LRS"
  tags = {
    Tier            = "Backend"
    Infrastructure  = "NRF MICR"
    Environment     = "Production"
    Service         = "Solr"
    TerraformScript = "solrCluster_0.1.0"
  }
}

variable "subscription_id" {
  description = "Enter Subscription ID where resources will be provisioned in Azure"
  type        = string
}

variable "tenant_id" {
  description = "The Azure Active Directory tenant ID that should be used for authenticating requests"
  type        = string
}

variable "client_id" {
  description = "Enter Client ID of Service Principal to use for authentication"
  type        = string
}

variable "client_secret" {
  description = "Enter Client Secret of Service Principal to use for authentication"
  type        = string
}