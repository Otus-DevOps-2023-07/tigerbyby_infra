#!/bin/bash -x

yc compute instance create \
  --name reddit-app-full \
  --hostname reddit-app-full \
  --zone=ru-central1-a \
  --create-boot-disk size=20GB,image-family=reddit-full \
  --cores=2 \
  --core-fraction=20 \
  --memory=4G \
  --network-interface subnet-id=e9bihbae82c2t78mrthq,ipv4-address=auto,nat-ip-version=ipv4
