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
