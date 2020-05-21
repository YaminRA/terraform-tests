resource "null_resource" "provision_solr" {
  connection {
    type     = var.connection_type
    user     = var.connection_user
    password = var.connection_password
    host     = var.connection_host
  }

  provisioner "remote-exec" {
    inline = [
      "df -h"
    ]
  }

  # Copies the file as the root user using SSH
  /*provisioner "file" {
    source      = "script.sh"
    destination = "/tmp/script.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/script.sh",
      "/tmp/script.sh args",
    ]
  }*/
  depends_on = [var.module_depends_on]
}