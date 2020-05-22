locals {
  tenant_id               = data.azurerm_client_config.current.tenant_id
  vnet_name               = "${module.solr_rg.name}-vnet"
  vnet_address_space      = ["10.68.19.0/24"]
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
  vm_oscaching            = "ReadWrite"
  vm_admin_username       = "solradmin"
  vm_publisher            = "OpenLogic"
  vm_offer                = "CentOS"
  vm_sku                  = "8_1"
  vm_version              = "latest"
  osdisk_sa_type          = "Premium_LRS"
  tags = {
    Tier            = "Backend"
    Infrastructure  = "NRF MICR"
    Environment     = "Production"
    Service         = "Solr"
    TerraformScript = "solrCluster_0.1.0"
  }
}