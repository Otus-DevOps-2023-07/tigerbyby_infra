provider "yandex" {
  service_account_key_file = var.service_account_key_file
  cloud_id                 = var.cloud_id
  folder_id                = var.folder_id
  zone                     = var.zone
}

module "vpc" {
  source = "../modules/vpc"
}

module "app" {
  #  prod = var.prod
  source           = "../modules/app"
  subnet_id        = module.vpc.vpc_id
  public_key_path  = var.public_key_path
  private_key_path = var.private_key_path
  app_disk_image   = var.app_disk_image
  db_host_ip       = module.db.internal_ip_address_db
}

module "db" {
  source           = "../modules/db"
  subnet_id        = module.vpc.vpc_id
  public_key_path  = var.public_key_path
  private_key_path = var.private_key_path
  db_disk_image    = var.db_disk_image
}
