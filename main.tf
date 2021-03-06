module "rg" {
  source   = "./modules/base"
  name     = local.rg_name
  location = local.glb_location
  tags     = local.tags
}
# VNet created only for testing purposes
module "vnet" {
  source        = "./modules/network/vnet"
  name          = local.vnet_name
  rg_name       = module.rg.name
  location      = local.glb_location
  address_space = local.vnet_address_space
  tags          = local.tags
}

module "subnet" {
  source       = "./modules/network/subnet"
  name         = local.subnet_name
  rg_name      = module.rg.name
  vnet_name    = module.vnet.name
  address_cidr = local.subnet_cidr
}

module "nsg" {
  source   = "./modules/network/nsg"
  name     = local.nsg_name
  rg_name  = module.rg.name
  location = local.glb_location
  tags     = local.tags
}

module "solr_nsg_rule_association" {
  source                       = "./modules/network/nsg/sr"
  name                         = "SOLR"
  description                  = "Allow reaching Solr whithin VNet resources"
  rg_name                      = module.rg.name
  nsg_name                     = module.nsg.name
  priority                     = 1000
  direction                    = "Inbound"
  access                       = "Allow"
  protocol                     = "Tcp"
  source_port_range            = "*"
  destination_port_ranges      = ["8983"]
  source_address_prefixes      = local.vnet_address_space
  destination_address_prefixes = local.subnet_cidr
}

module "ssh_nsg_rule_association" {
  source                       = "./modules/network/nsg/sr"
  name                         = "SSH"
  description                  = "Allow SSH connection whithin VNet resources"
  rg_name                      = module.rg.name
  nsg_name                     = module.nsg.name
  priority                     = 1001
  direction                    = "Inbound"
  access                       = "Allow"
  protocol                     = "Tcp"
  source_port_range            = "*"
  destination_port_ranges      = ["22"]
  source_address_prefixes      = local.vnet_address_space
  destination_address_prefixes = local.subnet_cidr
}
# Rule created only to reach JumpBox VM and reach Solr VMs
module "rdp_nsg_rule_association" {
  source                       = "./modules/network/nsg/sr"
  name                         = "RDP"
  description                  = "Allow RDP connection from anywhere"
  rg_name                      = module.rg.name
  nsg_name                     = module.nsg.name
  priority                     = 1002
  direction                    = "Inbound"
  access                       = "Allow"
  protocol                     = "Tcp"
  source_port_range            = "*"
  destination_port_ranges      = ["3389"]
  source_address_prefix        = "*"
  destination_address_prefixes = local.subnet_cidr
}

module "nsg_subnet_association" {
  source    = "./modules/network/subnet/nsg_association"
  subnet_id = module.subnet.id
  nsg_id    = module.nsg.id
}

module "lb" {
  source                = "./modules/lb"
  name                  = local.lb_name
  rg_name               = module.rg.name
  location              = local.glb_location
  fe_ipc_name           = local.lb_fe_ipc_name
  subnet_id             = module.subnet.id
  private_ip_allocation = local.lb_private_ip_allocation
  private_ip            = local.lb_private_ip
  tags                  = local.tags
}

module "lb_bap" {
  source  = "./modules/lb/bap"
  name    = local.lb_bap_name
  rg_name = module.rg.name
  lb_id   = module.lb.id
}

module "lb_pb" {
  source   = "./modules/lb/probe"
  name     = local.lb_pb_name
  rg_name  = module.rg.name
  lb_id    = module.lb.id
  protocol = local.lb_pb_protocol
  port     = local.lb_pb_port
}

module "lb_rule" {
  source      = "./modules/lb/rule"
  name        = local.lb_rule_name
  rg_name     = module.rg.name
  lb_id       = module.lb.id
  fe_ipc_name = local.lb_fe_ipc_name
  protocol    = local.lb_pb_protocol
  fe_port     = local.lb_pb_port
  be_port     = local.lb_pb_port
  lb_bap_id   = module.lb_bap.id
  lb_pb_id    = module.lb_pb.id
}

module "solr_master_nic" {
  source                = "./modules/network/nic"
  name                  = local.solr_master_nic_name
  rg_name               = module.rg.name
  location              = local.glb_location
  ipc_name              = local.nic_ipc_name
  subnet_id             = module.subnet.id
  private_ip_allocation = local.nic_private_ip_allocation
  private_ip            = local.solr_master_private_ip
  tags                  = local.tags
}

module "solr_slave_1_nic" {
  source                = "./modules/network/nic"
  name                  = local.solr_slave_1_nic_name
  rg_name               = module.rg.name
  location              = local.glb_location
  ipc_name              = local.nic_ipc_name
  subnet_id             = module.subnet.id
  private_ip_allocation = local.nic_private_ip_allocation
  private_ip            = local.solr_slave_1_private_ip
  tags                  = local.tags
}

module "solr_slave_2_nic" {
  source                = "./modules/network/nic"
  name                  = local.solr_slave_2_nic_name
  rg_name               = module.rg.name
  location              = local.glb_location
  ipc_name              = local.nic_ipc_name
  subnet_id             = module.subnet.id
  private_ip_allocation = local.nic_private_ip_allocation
  private_ip            = local.solr_slave_2_private_ip
  tags                  = local.tags
}

module "solr_slave_1_nic_bap_as" {
  source   = "./modules/network/nic/bapas"
  ipc_name = local.nic_ipc_name
  nic_id   = module.solr_slave_1_nic.id
  bap_id   = module.lb_bap.id
}

module "solr_slave_2_nic_bap_as" {
  source   = "./modules/network/nic/bapas"
  ipc_name = local.nic_ipc_name
  nic_id   = module.solr_slave_2_nic.id
  bap_id   = module.lb_bap.id
}

module "avs" {
  source   = "./modules/compute/avs"
  name     = local.avs_name
  rg_name  = module.rg.name
  location = local.glb_location
  avs_fd   = 2
  avs_ud   = 5
  tags     = local.tags
}

module "kv" {
  source    = "./modules/kv"
  name      = local.kv_name
  rg_name   = module.rg.name
  location  = local.glb_location
  tenant_id = local.tenant_id
  sku       = local.kv_sku
  tags      = local.tags
}

module "kv_ap" {
  source                  = "./modules/kv/ap"
  kv_id                   = module.kv.id
  tenant_id               = local.tenant_id
  object_id               = local.object_id
  key_permissions         = local.kv_ap_key_permissions
  secret_permissions      = local.kv_ap_secret_permissions
  certificate_permissions = local.kv_ap_certificate_permissions
  storage_permissions     = local.kv_ap_storage_permissions
}

module "solr_master_secret" {
  source                = "./modules/kv/secret"
  name                  = local.solr_master_vm_name
  kv_id                 = module.kv.id
  content               = local.kv_secret_content
  secret_length         = local.kv_secret_length
  min_upper             = local.kv_secret_min_upper
  min_lower             = local.kv_secret_min_lower
  min_numeric           = local.kv_secret_min_numeric
  min_special           = local.kv_secret_min_special
  allowed_special_chars = local.kv_secret_allowed_special_chars
  tags                  = local.tags
}

module "solr_slave_1_secret" {
  source                = "./modules/kv/secret"
  name                  = local.solr_slave_1_vm_name
  kv_id                 = module.kv.id
  content               = local.kv_secret_content
  secret_length         = local.kv_secret_length
  min_upper             = local.kv_secret_min_upper
  min_lower             = local.kv_secret_min_lower
  min_numeric           = local.kv_secret_min_numeric
  min_special           = local.kv_secret_min_special
  allowed_special_chars = local.kv_secret_allowed_special_chars
  tags                  = local.tags
}

module "solr_slave_2_secret" {
  source                = "./modules/kv/secret"
  name                  = local.solr_slave_2_vm_name
  kv_id                 = module.kv.id
  content               = local.kv_secret_content
  secret_length         = local.kv_secret_length
  min_upper             = local.kv_secret_min_upper
  min_lower             = local.kv_secret_min_lower
  min_numeric           = local.kv_secret_min_numeric
  min_special           = local.kv_secret_min_special
  allowed_special_chars = local.kv_secret_allowed_special_chars
  tags                  = local.tags
}

module "solr_master_sa" {
  source      = "./modules/storage"
  name        = local.solr_master_sa_name
  rg_name     = module.rg.name
  location    = local.glb_location
  tier        = local.sa_tier
  replication = local.sa_replication
  tags        = local.tags
}

module "solr_slave_1_sa" {
  source      = "./modules/storage"
  name        = local.solr_slave_1_sa_name
  rg_name     = module.rg.name
  location    = local.glb_location
  tier        = local.sa_tier
  replication = local.sa_replication
  tags        = local.tags
}

module "solr_slave_2_sa" {
  source      = "./modules/storage"
  name        = local.solr_slave_2_sa_name
  rg_name     = module.rg.name
  location    = local.glb_location
  tier        = local.sa_tier
  replication = local.sa_replication
  tags        = local.tags
}

module "solr_master_vm" {
  source            = "./modules/compute/vm"
  name              = local.solr_master_vm_name
  rg_name           = module.rg.name
  location          = local.glb_location
  size              = local.vm_size
  vm_admin_username = local.vm_admin_username
  vm_admin_password = module.solr_master_secret.value
  nic_ids           = [module.solr_master_nic.id]
  avs_id            = module.avs.id
  os_disk_name      = local.solr_master_vm_osdisk_name
  os_caching        = local.vm_oscaching
  sa_type           = local.osdisk_sa_type
  publisher         = local.vm_publisher
  offer             = local.vm_offer
  sku               = local.vm_sku
  os_version        = local.vm_version
  sa_uri            = module.solr_master_sa.pbe
  tags              = local.tags
}

module "solr_slave_1_vm" {
  source            = "./modules/compute/vm"
  name              = local.solr_slave_1_vm_name
  rg_name           = module.rg.name
  location          = local.glb_location
  size              = local.vm_size
  vm_admin_username = local.vm_admin_username
  vm_admin_password = module.solr_slave_1_secret.value
  nic_ids           = [module.solr_slave_1_nic.id]
  avs_id            = module.avs.id
  os_disk_name      = local.solr_slave_1_vm_osdisk_name
  os_caching        = local.vm_oscaching
  sa_type           = local.osdisk_sa_type
  publisher         = local.vm_publisher
  offer             = local.vm_offer
  sku               = local.vm_sku
  os_version        = local.vm_version
  sa_uri            = module.solr_slave_1_sa.pbe
  tags              = local.tags
}

module "solr_slave_2_vm" {
  source            = "./modules/compute/vm"
  name              = local.solr_slave_2_vm_name
  rg_name           = module.rg.name
  location          = local.glb_location
  size              = local.vm_size
  vm_admin_username = local.vm_admin_username
  vm_admin_password = module.solr_slave_2_secret.value
  nic_ids           = [module.solr_slave_2_nic.id]
  avs_id            = module.avs.id
  os_disk_name      = local.solr_slave_2_vm_osdisk_name
  os_caching        = local.vm_oscaching
  sa_type           = local.osdisk_sa_type
  publisher         = local.vm_publisher
  offer             = local.vm_offer
  sku               = local.vm_sku
  os_version        = local.vm_version
  sa_uri            = module.solr_slave_2_sa.pbe
  tags              = local.tags
}

module "solr_master_vm_datadisk" {
  source        = "./modules/compute/disk"
  name          = local.solr_master_vm_datadisk_name
  rg_name       = module.rg.name
  location      = local.glb_location
  sa_type       = local.datadisk_sa_type
  create_option = local.datadisk_create_option
  size          = local.datadisk_size
}

module "solr_slave_1_vm_datadisk" {
  source        = "./modules/compute/disk"
  name          = local.solr_slave_1_vm_datadisk_name
  rg_name       = module.rg.name
  location      = local.glb_location
  sa_type       = local.datadisk_sa_type
  create_option = local.datadisk_create_option
  size          = local.datadisk_size
}

module "solr_slave_2_vm_datadisk" {
  source        = "./modules/compute/disk"
  name          = local.solr_slave_2_vm_datadisk_name
  rg_name       = module.rg.name
  location      = local.glb_location
  sa_type       = local.datadisk_sa_type
  create_option = local.datadisk_create_option
  size          = local.datadisk_size
}

module "solr_master_vm_datadisk_attach" {
  source       = "./modules/compute/vm/attdisk"
  disk_id      = module.solr_master_vm_datadisk.id
  vm_id        = module.solr_master_vm.id
  disk_lun     = local.datadisk_lun
  disk_caching = local.datadisk_caching
}

module "solr_slave_1_vm_datadisk_attach" {
  source       = "./modules/compute/vm/attdisk"
  disk_id      = module.solr_slave_1_vm_datadisk.id
  vm_id        = module.solr_slave_1_vm.id
  disk_lun     = local.datadisk_lun
  disk_caching = local.datadisk_caching
}

module "solr_slave_2_vm_datadisk_attach" {
  source       = "./modules/compute/vm/attdisk"
  disk_id      = module.solr_slave_2_vm_datadisk.id
  vm_id        = module.solr_slave_2_vm.id
  disk_lun     = local.datadisk_lun
  disk_caching = local.datadisk_caching
}
# JumpBox resources to reach Solr VMs
module "jumpbox_pip" {
  source   = "./modules/network/pip"
  name     = "jumpbox-pip"
  rg_name  = module.rg.name
  location = local.glb_location
  tags     = local.tags
}

module "jumpbox_nic" {
  source                = "./modules/network/nic"
  name                  = "jumpbox-nic"
  rg_name               = module.rg.name
  location              = local.glb_location
  ipc_name              = local.nic_ipc_name
  subnet_id             = module.subnet.id
  private_ip_allocation = local.nic_private_ip_allocation
  private_ip            = "10.68.19.248"
  pip_id                = module.jumpbox_pip.id
  tags                  = local.tags
}

resource "azurerm_windows_virtual_machine" "jumpbox" {
  name                  = "jumpbox-vm"
  resource_group_name   = module.rg.name
  location              = local.glb_location
  size                  = local.vm_size
  admin_username        = "adminuser"
  admin_password        = "P@$$w0rd1234!"
  network_interface_ids = [module.jumpbox_nic.id]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2019-Datacenter"
    version   = "latest"
  }
}
/*
module "provision_solr_vm" {
  source          = "./modules/config"
  connection_host = module.remote_exec_pip.ip_address
  connection_type = "ssh"
  connection_user = local.vm_admin_username
  connection_password = module.solr_master_secret.value
  #private_key       = file("./terraform_rsa")
  module_depends_on = [azurerm_linux_virtual_machine.remote_exec]
}*/

/* Pending:
- Auto config Solr installation
- Auto config datadisk format and mounting
*/