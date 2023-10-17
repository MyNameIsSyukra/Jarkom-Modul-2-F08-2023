apt-get update

apt-get install nginx

apt-get install php

echo "Hello sini wisanggeni" > /var/www/html/index.html

cp wisanggeni.f08.com /etc/nginx/sites-available

ln -s /etc/nginx/sites-available/wisanggeni.f08.com /etc/nginx/sites-en$
service nginx restart