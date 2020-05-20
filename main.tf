module "solr_rg" {
  source         = "./modules/base"
  location       = "uksouth"
  infrastructure = "nrfmicr"
  environment    = "prd"
  service        = "solr"
  tags           = local.tags
}

module "solr_subnet" {
  source      = "./modules/network/subnet"
  rg_name     = "UKSOUTH-NRFLIFT-PRD-RGP-NETWORK"
  vnet_name   = "UKSOUTH-NRFLIFT-PRD-VNT"
  subnet_name = module.solr_rg.name
  subnet_pool = "ms"
  subnet_cidr = [local.solr_subnet_cidr]
}

module "solr_nsg" {
  source   = "./modules/network/nsg"
  rg_name  = module.solr_rg.name
  location = module.solr_rg.location
  tags     = local.tags
}

module "solr_nsg_rule_association" {
  source                     = "./modules/network/nsg/sr"
  name                       = "SOLR"
  priority                   = 1000
  direction                  = "Inbound"
  access                     = "Allow"
  protocol                   = "Tcp"
  source_port_range          = "*"
  destination_port_range     = "8983"
  source_address_prefix      = "*"
  destination_address_prefix = "*"
  rg_name                    = module.solr_rg.name
  nsg_name                   = module.solr_nsg.name
}

module "ssh_nsg_rule_association" {
  source                     = "./modules/network/nsg/sr"
  name                       = "SSH"
  priority                   = 1001
  direction                  = "Inbound"
  access                     = "Allow"
  protocol                   = "Tcp"
  source_port_range          = "*"
  destination_port_range     = "22"
  source_address_prefix      = "*"
  destination_address_prefix = "*"
  rg_name                    = module.solr_rg.name
  nsg_name                   = module.solr_nsg.name
}

module "solr_nsg_subnet_association" {
  source    = "./modules/network/subnet/nsg_association"
  subnet_id = module.solr_subnet.id
  nsg_id    = module.solr_nsg.id
}

module "solr_lb" {
  source                     = "./modules/lb"
  rg_name                    = module.solr_rg.name
  location                   = module.solr_rg.location
  subnet_id                  = module.solr_subnet.id
  private_address_allocation = "Static"
  ip_address                 = local.solr_lb_ip
  tags                       = local.tags
}

module "solr_lb_bap" {
  source  = "./modules/lb/bap"
  rg_name = module.solr_rg.name
  lb_name = module.solr_lb.name
  lb_id   = module.solr_lb.id
}

module "solr_lb_pb" {
  source  = "./modules/lb/probe"
  rg_name = module.solr_rg.name
  lb_name = module.solr_lb.name
  lb_id   = module.solr_lb.id
  port    = 8983
}

module "solr_lb_rule" {
  source      = "./modules/lb/rule"
  rg_name     = module.solr_rg.name
  lb_name     = module.solr_lb.name
  lb_id       = module.solr_lb.id
  protocol    = "Tcp"
  fe_port     = 8983
  be_port     = 8983
  fe_ipc_name = module.solr_lb.fe_ipc_name
  lb_bap_id   = module.solr_lb_bap.id
  lb_probe_id = module.solr_lb_pb.id
}

module "solr_master_nic" {
  source       = "./modules/network/nic"
  rg_name      = module.solr_rg.name
  location     = module.solr_rg.location
  nic_prefix   = "master"
  ip_name      = "Internal"
  subnet_id    = module.solr_subnet.id
  nic_ipconfig = "Static"
  nic_ip       = local.solr_master_nic_ip
  tags         = local.tags
}

module "solr_slave1_nic" {
  source       = "./modules/network/nic"
  rg_name      = module.solr_rg.name
  location     = module.solr_rg.location
  nic_prefix   = "slave1"
  ip_name      = "Internal"
  subnet_id    = module.solr_subnet.id
  nic_ipconfig = "Static"
  nic_ip       = local.solr_slave1_nic_ip
  tags         = local.tags
}

module "solr_slave2_nic" {
  source       = "./modules/network/nic"
  rg_name      = module.solr_rg.name
  location     = module.solr_rg.location
  nic_prefix   = "slave2"
  ip_name      = "Internal"
  subnet_id    = module.solr_subnet.id
  nic_ipconfig = "Static"
  nic_ip       = local.solr_slave2_nic_ip
  tags         = local.tags
}

module "solr_slave1_nic_bap_as" {
  source  = "./modules/network/nic/bapas"
  ip_name = module.solr_slave1_nic.ip_name
  nic_id  = module.solr_slave1_nic.id
  bap_id  = module.solr_lb_bap.id
}

module "solr_slave2_nic_bap_as" {
  source  = "./modules/network/nic/bapas"
  ip_name = module.solr_slave2_nic.ip_name
  nic_id  = module.solr_slave2_nic.id
  bap_id  = module.solr_lb_bap.id
}

module "solr_avs" {
  source   = "./modules/compute/avs"
  rg_name  = module.solr_rg.name
  location = module.solr_rg.location
  avs_fd   = 2
  avs_ud   = 5
  tags     = local.tags
}

module "solr_kv" {
  source    = "./modules/kv"
  rg_name   = module.solr_rg.name
  location  = module.solr_rg.location
  kv_name   = "solr-cluster"
  tenant_id = var.tenant_id
  kv_sku    = "standard"
  tags      = local.tags
}

module "solr_kv_ap" {
  source    = "./modules/kv/ap"
  kv_id     = module.solr_kv.id
  tenant_id = var.tenant_id
  object_id = data.azurerm_client_config.current.object_id
  kp        = ["backup", "create", "decrypt", "delete", "encrypt", "get", "import", "list", "purge", "recover", "restore", "sign", "unwrapKey", "update", "verify", "wrapKey"]
  sp        = ["backup", "delete", "get", "list", "purge", "recover", "restore", "set"]
  cp        = ["backup", "create", "delete", "deleteissuers", "get", "getissuers", "import", "list", "listissuers", "managecontacts", "manageissuers", "purge", "recover", "restore", "setissuers", "update"]
  sgp       = ["backup", "delete", "deletesas", "get", "getsas", "list", "listsas", "purge", "recover", "regeneratekey", "restore", "set", "setsas", "update"]
}

module "solr_master_secret" {
  source      = "./modules/kv/secret"
  kv_id       = module.solr_kv.id
  secret_name = local.solr_master_vm_name
  tags        = local.tags
}

module "solr_slave1_secret" {
  source      = "./modules/kv/secret"
  kv_id       = module.solr_kv.id
  secret_name = local.solr_slave1_vm_name
  tags        = local.tags
}

module "solr_slave2_secret" {
  source      = "./modules/kv/secret"
  kv_id       = module.solr_kv.id
  secret_name = local.solr_slave2_vm_name
  tags        = local.tags
}

module "solr_master_vm_datadisk" {
  source        = "./modules/compute/disk"
  rg_name       = module.solr_rg.name
  location      = module.solr_rg.location
  disk_prefix   = "master"
  sa_type       = local.datadisk_sa_type
  create_option = local.datadisk_create_opt
  size          = local.datadisk_size
}

module "solr_slave1_vm_datadisk" {
  source        = "./modules/compute/disk"
  rg_name       = module.solr_rg.name
  location      = module.solr_rg.location
  disk_prefix   = "slave1"
  sa_type       = local.datadisk_sa_type
  create_option = local.datadisk_create_opt
  size          = local.datadisk_size
}

module "solr_slave2_vm_datadisk" {
  source        = "./modules/compute/disk"
  rg_name       = module.solr_rg.name
  location      = module.solr_rg.location
  disk_prefix   = "slave2"
  sa_type       = local.datadisk_sa_type
  create_option = local.datadisk_create_opt
  size          = local.datadisk_size
}

module "solr_master_vm" {
  source            = "./modules/compute/vm"
  rg_name           = module.solr_rg.name
  location          = module.solr_rg.location
  vm_prefix         = "master"
  size              = local.vm_size
  vm_admin_username = "solradmin"
  vm_admin_password = module.solr_master_secret.value
  nic_id            = module.solr_master_nic.id
  avs_id            = module.solr_avs.id
  os_caching        = "ReadWrite"
  sa_type           = local.osdisk_sa_type
  publisher         = "OpenLogic"
  offer             = "CentOS"
  sku               = "8_1"
  os_version        = "latest"
  tags              = local.tags
}

module "solr_slave1_vm" {
  source            = "./modules/compute/vm"
  rg_name           = module.solr_rg.name
  location          = module.solr_rg.location
  vm_prefix         = "slave1"
  size              = local.vm_size
  vm_admin_username = "solradmin"
  vm_admin_password = module.solr_slave1_secret.value
  nic_id            = module.solr_slave1_nic.id
  avs_id            = module.solr_avs.id
  os_caching        = "ReadWrite"
  sa_type           = local.osdisk_sa_type
  publisher         = "OpenLogic"
  offer             = "CentOS"
  sku               = "8_1"
  os_version        = "latest"
  tags              = local.tags
}

module "solr_slave2_vm" {
  source            = "./modules/compute/vm"
  rg_name           = module.solr_rg.name
  location          = module.solr_rg.location
  vm_prefix         = "slave2"
  size              = local.vm_size
  vm_admin_username = "solradmin"
  vm_admin_password = module.solr_slave2_secret.value
  nic_id            = module.solr_slave2_nic.id
  avs_id            = module.solr_avs.id
  os_caching        = "ReadWrite"
  sa_type           = local.osdisk_sa_type
  publisher         = "OpenLogic"
  offer             = "CentOS"
  sku               = "8_1"
  os_version        = "latest"
  tags              = local.tags
}

module "solr_master_vm_datadisk_attach" {
  source       = "./modules/compute/vm/attdisk"
  disk_id      = module.solr_master_vm_datadisk.id
  vm_id        = module.solr_master_vm.id
  disk_lun     = "0"
  disk_caching = "ReadOnly"
}

module "solr_slave1_vm_datadisk_attach" {
  source       = "./modules/compute/vm/attdisk"
  disk_id      = module.solr_slave1_vm_datadisk.id
  vm_id        = module.solr_slave1_vm.id
  disk_lun     = "0"
  disk_caching = "ReadOnly"
}

module "solr_slave2_vm_datadisk_attach" {
  source       = "./modules/compute/vm/attdisk"
  disk_id      = module.solr_slave2_vm_datadisk.id
  vm_id        = module.solr_slave2_vm.id
  disk_lun     = "0"
  disk_caching = "ReadOnly"
}

/* Pending:
- Storage Account for Boot Diagnosis
- Auto config Solr installation
- Auto config datadisk format and mounting
*/