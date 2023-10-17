echo '
nameserver 192.168.122.1
'>/etc/resolv.conf

apt-get update
apt-get install dnsutils

echo '
nameserver 192.225.2.2 # IP YudhistiraDNSMaster 
nameserver 192.225.3.2
#nameserver 192.168.122.1
'>/etc/resolv.conf
