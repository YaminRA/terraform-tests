locals {
  vm_name = "${var.rg_name}-${var.vm_prefix}"
  os_disk_name = "${local.vm_name}-osdisk"
}

resource "azurerm_linux_virtual_machine" "vm" {
  resource_group_name = var.rg_name
  name                = local.vm_name
  location            = var.location
  size                = var.size
  admin_username   = var.vm_admin_username
  admin_password = var.vm_admin_password
  disable_password_authentication = false
  network_interface_ids = [var.nic_id]
  availability_set_id = var.avs_id

  os_disk {
    name = local.os_disk_name
    caching              = var.os_caching
    storage_account_type = var.sa_type
  }

  source_image_reference {
    publisher = var.publisher
    offer     = var.offer
    sku       = var.sku
    version   = var.os_version
  }

  custom_data = var.custom_data

  tags = var.tags
}