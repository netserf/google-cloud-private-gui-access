#!/bin/bash

apt update
apt -y install apache2
cat <<EOF > /var/www/html/index.html
<html><body><p>Hello from $(hostname)!</p></body></html>
