# tigerbyby_infra
tigerbyby Infra repository

bastion_IP = 51.250.94.187  
someinternalhost_IP = 10.128.0.28

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
