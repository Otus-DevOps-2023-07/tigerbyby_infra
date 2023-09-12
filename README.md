# tigerbyby_infra
tigerbyby Infra repository

## Homework #3
```
bastion_IP = 51.250.94.187  
someinternalhost_IP = 10.128.0.28
```

### Connecting options:
- ssh -i .ssh/otus-infra -J  appuser@51.250.94.187 appuser@10.128.0.28
### or
- Configure .ssh/config:
```
### First bastion. Directly reachable
Host bastion
  HostName 51.250.94.187
    IdentityFile ~/.ssh/otus-infra
    User appuser
    ForwardAgent yes

### Host to jump to via bastion
Host someinternalhost
  HostName 10.128.0.28
    User appuser
    ProxyJump bastion
```
- Command to connect
```
ssh someinternalhost
```
- Alias for someinternalhost
```
alias someinternalhost="ssh someinternalhost"
```

### Add SSL for pritunl:
https://51.250.94.187.nip.io/

## Homework #4

```
testapp_IP = 51.250.6.201
testapp_port = 9292
```

### Run YC command to deploy:
```
yc compute instance create \
  --name reddit-app2 \
  --hostname reddit-app2 \
  --memory=4 \
  --create-boot-disk image-folder-id=standard-images,image-family=ubuntu-1604-lts,size=10GB \
  --network-interface subnet-name=default-ru-central1-a,nat-ip-version=ipv4 \
  --metadata serial-port-enable=1 \
  --metadata-from-file user-data=startup.yaml
```

## Homework #5

### What done 
- Installed packer
- Configured *.pkr.hcl  and *.pkr.hcl templates
- Configured variables config
- Configured immutable template and run yc script
### Run command
- main task
```
cd packer/ && packer build -var-file=variables.json ubuntu16.json
```
- additional task
```
bash packer/config-scripts/create-reddit-vm.sh
```
## Homework #6

### What done
- Installed terraform
- Installed yandex module for terraform
- Configured main file
- Configured variables file and tfvars
- Created load balancer
### Run command
- For create instance
```
terraform init && terraform apply
```
- For destroy instance
```
terraform destroy
```
## Homework #7
### What done
- Added vpc network for app
- Сonfiguration files are separated
- Created modules for app, db and vpc
- Maked provisioning
### Run command
```
export ACCESS_KEY="<access_key>"
export SECRET_KEY="<secret_key>"
cd terraform/prod/
terraform init -backend-config="access_key=$ACCESS_KEY" -backend-config="secret_key=$SECRET_KEY"
terraform plan
terraform apply
```

## Homework #8

### What done
- Installed ansible
- Created inventory and inventory.yml files
- Added ansible.cfg
- Created clone.yml 
- Created bash script for dynamic inventory.json
- Modified ansible.cfg for inventory.json

###Run commands
```
ansible all -m ping 
ansible app -m command -a 'ruby -v; bundler -v'
ansible app -m shell -a 'ruby -v; bundler -v'
ansible db -m systemd -a name=mongod
ansible db -m service -a name=mongod
ansible app -m apt -a name=git
ansible app -m git -a \
'repo=https://github.com/express42/reddit.git dest=/home/appuser/reddit'
ansible-playbook clone.yml

```