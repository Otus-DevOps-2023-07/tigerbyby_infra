output "external_ip_address_app" {
  value = module.app.external_ip_address_app
}
output "external_ip_address_db" {
  value = module.db.external_ip_address_db
}

### Ansible inventory file
resource "local_file" "AnsibleInventory" {
  content = templatefile("../files/inventory.tmpl",
   {
     ip_address_app = module.app.external_ip_address_app
     db_host = module.db.internal_ip_address_db
     ip_address_db = module.db.external_ip_address_db
   }
 )
  filename = "../../ansible/environments/stage/inventory"
}
