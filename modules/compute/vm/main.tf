resource "azurerm_linux_virtual_machine" "vm" {
  name                            = var.name
  resource_group_name             = var.rg_name
  location                        = var.location
  size                            = var.size
  admin_username                  = var.vm_admin_username
  admin_password                  = var.vm_admin_password
  disable_password_authentication = false
  network_interface_ids           = var.nic_ids
  availability_set_id             = var.avs_id

  os_disk {
    name                 = var.os_disk_name
    caching              = var.os_caching
    storage_account_type = var.sa_type
  }

  source_image_reference {
    publisher = var.publisher
    offer     = var.offer
    sku       = var.sku
    version   = var.os_version
  }

  boot_diagnostics {
    storage_account_uri = var.sa_uri
  }

  tags = var.tags
}