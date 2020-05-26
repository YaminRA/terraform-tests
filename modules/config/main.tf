resource "null_resource" "provision_solr" {
  connection {
    type     = var.connection_type
    user     = var.connection_user
    password = var.connection_password
    host     = var.connection_host
    timeout  = "30s"
  }

  provisioner "file" {
    source      = "scripts/"
    destination = "~/."
  }

  depends_on = [var.module_depends_on]
}