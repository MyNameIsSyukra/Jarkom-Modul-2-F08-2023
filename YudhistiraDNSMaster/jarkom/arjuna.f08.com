
;
; BIND data file for local loopback interface
;
$TTL    604800
@       IN      SOA     arjuna.f08.com. root.arjuna.f08.com. (
                        2023121001      ; Serial
                         604800         ; Refresh
                          86400         ; Retry
                        2419200         ; Expire
                         604800 )       ; Negative Cache TTL
;
@       IN      NS      arjuna.f08.com.
@       IN      A       192.225.3.3     ; IP Arjuna
www     IN      CNAME   arjuna.f08.com.