#!/bin/bash

sudo apt update
sudo apt install mongodb -y

#Запускаем MongoDB:
sudo systemctl start mongodb
#Добавлāем в автозапуск:
sudo systemctl enable mongodb
