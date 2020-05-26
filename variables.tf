locals {
  glb_client         = "NRF"
  glb_infrastructure = "MICR"
  glb_location       = "UK South"
  glb_environment    = "PRD"
  glb_service        = "SOLR"
  glb_name           = "${local.glb_client}-${local.glb_infrastructure}-${local.glb_environment}-${local.glb_service}"

  rg_name = "${local.glb_name}-RG"

  vnet_name    = "UKSOUTH-NRFLIFT-PROD-VNT"
  vnet_rg_name = "UKSOUTH-NRFLIFT-PROD-RGP-NETWORK"

  subnet_name = "${local.glb_name}-SBN"
  subnet_cidr = ["10.68.19.240/28"]

  nsg_name = "${local.glb_name}-NSG"

  lb_name                  = "${local.glb_name}-LB"
  lb_fe_ipc_name           = "${local.lb_name}-IP"
  lb_private_ip_allocation = "Static"
  lb_private_ip            = "10.68.19.244"
  lb_bap_name              = "${local.lb_name}-BAP"
  lb_pb_name               = "${local.lb_name}-PB"
  lb_pb_protocol           = "Tcp"
  lb_pb_port               = 8983
  lb_rule_name             = "${local.lb_name}-RL"

  nic_ipc_name              = "Internal"
  nic_private_ip_allocation = "Static"
  solr_master_nic_name      = "${local.glb_name}-MSTR-NIC"
  solr_master_private_ip    = "10.68.19.245"
  solr_slave_1_nic_name     = "${local.glb_name}-SLV1-NIC"
  solr_slave_1_private_ip   = "10.68.19.246"
  solr_slave_2_nic_name     = "${local.glb_name}-SLV2-NIC"
  solr_slave_2_private_ip   = "10.68.19.247"

  avs_name = "${local.glb_name}-AVS"

  kv_name                         = replace("${local.glb_name}KV", "-", "")
  kv_sku                          = "standard"
  kv_ap_key_permissions           = ["backup", "create", "decrypt", "delete", "encrypt", "get", "import", "list", "purge", "recover", "restore", "sign", "unwrapKey", "update", "verify", "wrapKey"]
  kv_ap_secret_permissions        = ["backup", "delete", "get", "list", "purge", "recover", "restore", "set"]
  kv_ap_certificate_permissions   = ["backup", "create", "delete", "deleteissuers", "get", "getissuers", "import", "list", "listissuers", "managecontacts", "manageissuers", "purge", "recover", "restore", "setissuers", "update"]
  kv_ap_storage_permissions       = ["backup", "delete", "deletesas", "get", "getsas", "list", "listsas", "purge", "recover", "regeneratekey", "restore", "set", "setsas", "update"]
  kv_secret_length                = 32
  kv_secret_min_upper             = 5
  kv_secret_min_lower             = 5
  kv_secret_min_numeric           = 5
  kv_secret_min_special           = 5
  kv_secret_allowed_special_chars = "!@#$%&*()-_=+[]{}<>:?"
  kv_secret_content               = "VM admin user password"

  sa_tier              = "Standard"
  sa_replication       = "LRS"
  solr_master_sa_name  = "solrmasterdiagsa"
  solr_slave_1_sa_name = "solrslave1diagsa"
  solr_slave_2_sa_name = "solrslave2diagsa"

  vm_size                     = "Standard_D4s_v3"
  vm_oscaching                = "ReadWrite"
  vm_admin_username           = "solradmin"
  vm_publisher                = "OpenLogic"
  vm_offer                    = "CentOS"
  vm_sku                      = "8_1"
  vm_version                  = "latest"
  osdisk_sa_type              = "Premium_LRS"
  solr_master_vm_name         = replace("${local.glb_name}MSTRVM01", "-", "")
  solr_slave_1_vm_name        = replace("${local.glb_name}SLV1VM01", "-", "")
  solr_slave_2_vm_name        = replace("${local.glb_name}SLV2VM01", "-", "")
  solr_master_vm_osdisk_name  = "${local.glb_name}-MSTR-VM-OSDISK"
  solr_slave_1_vm_osdisk_name = "${local.glb_name}-SLV1-VM-OSDISK"
  solr_slave_2_vm_osdisk_name = "${local.glb_name}-SLV2-VM-OSDISK"

  datadisk_sa_type              = "Premium_LRS"
  datadisk_create_option        = "Empty"
  datadisk_size                 = 512
  datadisk_lun                  = "0"
  datadisk_caching              = "ReadOnly"
  solr_master_vm_datadisk_name  = "${local.glb_name}-MSTR-VM-DATADISK"
  solr_slave_1_vm_datadisk_name = "${local.glb_name}-SLV1-VM-DATADISK"
  solr_slave_2_vm_datadisk_name = "${local.glb_name}-SLV2-VM-DATADISK"

  tenant_id = data.azurerm_client_config.current.tenant_id
  object_id = data.azurerm_client_config.current.object_id

  tags = {
    Tier            = "Backend"
    Infrastructure  = "NRF MICR"
    Environment     = "Production"
    Service         = "Solr"
    TerraformScript = "solrCluster_1.0.0"
  }
}