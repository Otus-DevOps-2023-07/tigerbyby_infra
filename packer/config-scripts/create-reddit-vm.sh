#!/bin/bash -x

yc compute instance create \
  --name reddit-app-full-$DATE \
  --hostname reddit-app-full-$DATE \
  --zone=ru-central1-a \
  --create-boot-disk size=20GB,image-family=reddit-full \
  --cores=2 \
  --core-fraction=25 \
  --memory=4G \
  --network-interface subnet-id=e9bihbae82c2t78mrthq,ipv4-address=auto,nat-ip-version=ipv4
