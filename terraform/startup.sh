#!/bin/bash

apt update
apt -y install apache2
cat <<EOF > /var/www/html/index.html
<html><body><h1>Hello from $(hostname)!</h1></body></html>
