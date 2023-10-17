apt-get update

apt-get install nginx

apt-get install php

echo "Hello sini prabakusuma" > /var/www/html/index.html

cp prabakusuma.f08.com /etc/nginx/sites-available

ln -s /etc/nginx/sites-available/prabakusuma.f08.com /etc/nginx/sites-e$

service nginx restart