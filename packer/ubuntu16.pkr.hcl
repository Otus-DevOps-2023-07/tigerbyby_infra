source "yandex" "ubuntu16" {
  image_name = "reddit-base-${formatdate("MM-DD-YYYY", timestamp())}"
  image_family = "reddit-base"
  ssh_username = "ubuntu"
  platform_id = "standard-v1"
  service_account_key_file = var.service_account_key_file
  folder_id = var.folder_id
  source_image_family = var.source_image_family
  zone = var.zone
  subnet_id = var.subnet_id
  use_ipv4_nat = var.use_ipv4_nat
}

build {
  sources = ["source.yandex.ubuntu16"]

  provisioner "shell" {
    inline = [
      "echo Waiting for apt-get to finish...",
      "a=1; while [ -n \"$(pgrep apt-get)\" ]; do echo $a; sleep 1s; a=$(expr $a + 1); done",
      "echo Done."
    ]
  }

  provisioner "shell" {
    name            = "ruby"
    script          = "./config-scripts/install_ruby.sh"
    execute_command = "sudo {{.Path}}"
  }

  provisioner "shell" {
    name            = "mongodb"
    script          = "./config-scripts/install_mongodb.sh"
    execute_command = "sudo {{.Path}}"
  }
}
