apt-get update

apt-get install nginx

apt-get install php

rm /etc/nginx/sites-enabled/default

cp arjuna.f08.com /etc/nginx/sites-available

ln -s /etc/nginx/sites-available/arjuna.f08.com /etc/nginx/sites-enabled/arjuna.f08.com

service nginx restart