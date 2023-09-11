source "yandex" "immutable" {
  image_name = "reddit-full-${formatdate("MM-DD-YYYY", timestamp())}"
  image_family = "reddit-full"
  ssh_username = "ubuntu"
  platform_id = "standard-v1"
  service_account_key_file = "/home/slava/key.json"
  folder_id = "b1gr93rlamsefp2el7vk"
  source_image_family = "ubuntu-1604-lts"
  zone = "ru-central1-a" 
  subnet_id = "e9bihbae82c2t78mrthq"
  use_ipv4_nat = true
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
    script          = "./files/immutable.sh"
    execute_command = "sudo {{.Path}}"
  }
}
