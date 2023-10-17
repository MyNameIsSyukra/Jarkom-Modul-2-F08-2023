;
; BIND data file for local loopback interface
;
$TTL    604800
@       IN      SOA     baratayuda.abimanyu.f08.com. root.baratayuda.abimanyu.f08.com. (
                        2023121005      ; Serial
                         604800         ; Refresh
                          86400         ; Retry
                        2419200         ; Expire
                         604800 )       ; Negative Cache TTL
;
@       IN      NS      baratayuda.abimanyu.f08.com.
www     IN      CNAME   baratayuda.abimanyu.f08.com.
@       IN      A       192.225.3.4                     ; IP Abimanyu
rjp     IN      A       192.225.3.4                     ; IP Abimanyu
www.rjp IN      CNAME   rjp.baratayuda.abimanyu.f08.com.