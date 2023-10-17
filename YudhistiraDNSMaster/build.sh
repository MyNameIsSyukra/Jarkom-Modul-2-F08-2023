apt-get update

apt-get install bind9 -y

cp -R jarkom /etc/bind

cp named.conf.local /etc/bind

cp named.conf.options /etc/bind

service bind9 restart