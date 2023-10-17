;
; BIND data file for local loopback interface
;
$TTL    604800
@       IN      SOA     abimanyu.f08.com. root.abimanyu.f08.com. (
                        2023121002      ; Serial
                         604800         ; Refresh
                          86400         ; Retry
                        2419200         ; Expire
                         604800 )       ; Negative Cache TTL
;
@               IN      NS      abimanyu.f08.com.
@               IN      A       192.225.3.4             ; IP Abimanyu
www             IN      CNAME   abimanyu.f08.com.
parikesit       IN      A       192.225.3.4             ; IP abimanyu
www.parikesit   IN      CNAME   parikesit.abimanyu.f08.com.
ns1             IN      A       192.225.3.3             ; IP Werkudara
baratayuda      IN      NS      ns1
www.baratayuda  IN      CNAME   baratayuda.abimanyu.f08.com.