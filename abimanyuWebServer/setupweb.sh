apt-get update

apt-get install nginx

apt-get install php

echo "Hello sini abimanyu" > /var/www/html/index.html

cp abimanyu.f08.com /etc/nginx/sites-available

ln -s /etc/nginx/sites-available/abimanyu.f08.com /etc/nginx/sites-enabled/abimanyu.f08.com

cp abimanyu.f08.com.conf /etc/apache2/sites-available

mkdir /var/www/abimanyu.f08

wget 'https://drive.usercontent.google.com/download?id=1a4V23hwK9S7hQEDEcv9FL14UkkrHc-Zc&export=download&authuser=0&confirm=t&uuid=ba803a01-09da-443a-aca9-f9af1f05407a&at=APZUnTW3k1liYo8m6AXA1QNDCNX1:1696931215102' -O /var/www/abimanyu.f08/abimanyu.zip

apt-get install unzip

unzip /var/www/abimanyu.f08/abimanyu.zip  -d /var/www/abimanyu.f08/

cp /var/www/abimanyu.f08/abimanyu.yyy.com/index.php /var/www/abimanyu.f08/

cp /var/www/abimanyu.f08/abimanyu.yyy.com/home.html /var/www/abimanyu.f08

cp /var/www/abimanyu.f08/abimanyu.yyy.com/abimanyu.webp /var/www/abimanyu.f08

cp parikesit.abimanyu.f08.com.conf /etc/apache2/sites-available

mkdir /var/www/parikesit.abimanyu.f08

cp -R parikesit.abimanyu.yyy.com/public /var/www/parikesit.abimanyu.f08/

cp -R parikesit.abimanyu.yyy.com/error /var/www/parikesit.abimanyu.f08/

mkdir /var/www/parikesit.abimanyu.f08/secret

echo "Ini secret" > /var/www/parikesit.abimanyu.f08/secret/index.html

cp rjp.baratayuda.abimanyu.f08.com.conf /etc/apache2/sites-available

mkdir /var/www/rjp.baratayuda.abimanyu.f08

cp rjp.baratayuda.abimanyu.yyy.com/loid.png /var/www/rjp.baratayuda.abimanyu.f08
cp rjp.baratayuda.abimanyu.yyy.com/yor.jpg /var/www/rjp.baratayuda.abimanyu.f08
cp rjp.baratayuda.abimanyu.yyy.com/waku.mp3 /var/www/rjp.baratayuda.abimanyu.f08
cp rjp.baratayuda.abimanyu.yyy.com/anya-bond.webp /var/www/rjp.baratayuda.abimanyu.f08

echo "Listen 14000" >> /etc/apache2/ports.conf
echo "Listen 14400" >> /etc/apache2/ports.conf

service nginx stop

a2ensite abimanyu.f08.com

a2ensite parikesit.abimanyu.f08.com

a2ensite rjp.baratayuda.abimanyu.f08.com

service apache2 restart