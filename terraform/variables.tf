variable "cloud_id" {
  description = "Cloud"
}
variable "folder_id" {
  description = "Folder"
}
variable "zone" {
  description = "Zone"
  # Значение по умолчанию
  default = "ru-central1-a"
}
variable "private_key_path" {
  description = "Path to the private key used for ssh access"
}
variable "public_key_path" {
  # Описание переменной
  description = "Path to the public key used for ssh access"
  default     = "/home/slava/.ssh/yc.pub"
}
variable "image_id" {
  description = "Disk image"
}
variable "subnet_id" {
  description = "Subnet"
}
variable "service_account_key_file" {
  description = "key.json"
}
variable "app_count" {
  description = "Number of app instances"
  default     = 1
}
variable db_disk_image {
 description = "Disk image for reddit db"
 default = "reddit-db-base"
}
variable app_disk_image {
 description = "Disk image for reddit app"
 default = "reddit-app-base"
}
