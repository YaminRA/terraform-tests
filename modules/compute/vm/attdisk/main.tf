resource "azurerm_virtual_machine_data_disk_attachment" "attach_disk" {
  managed_disk_id    = var.disk_id
  virtual_machine_id = var.vm_id
  lun                = var.disk_lun
  caching            = var.disk_caching
}