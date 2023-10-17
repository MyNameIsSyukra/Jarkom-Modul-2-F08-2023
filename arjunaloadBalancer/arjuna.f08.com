upstream mynode {
        server 192.225.3.4:8001;
        server 192.225.3.5:8002;
        server 192.225.3.6:8003;
}

server {
    location / {
        proxy_pass http://mynode;
    }
}