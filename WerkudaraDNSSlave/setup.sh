apt-get update

apt-get install bind9 -y

cp -R baratayuda /etc/bind

cp named.conf.local /etc/bind/named.conf.local

cp named.conf.options /etc/bind

service bind9 restart