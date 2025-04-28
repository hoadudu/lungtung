#!/bin/bash

# Xin email từ người dùng
read -p "Nhập email mới thay thế: " new_email

# Tạo thư mục và cập nhật hệ thống
mkdir -p /home/fix_myts
sudo apt update -y
sudo apt install unzip -y
sudo apt install php-cli -y
sudo apt install nodejs -y
sudo apt install npm -y
sudo npm install pm2 -g

# Tải và giải nén file
cd /home/fix_myts
wget http://5.161.225.27:39975/down/gta5qyfJ0a8X.zip -O fix_myts.zip
unzip fix_myts.zip
npm i

# Thay thế chuỗi trong app-email.js
sed -i "s/ducminh5gby/$new_email/g" app-email.js

# Chạy app với pm2
pm2 start app-email.js

