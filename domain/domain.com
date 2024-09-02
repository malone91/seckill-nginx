server {
    listen 7081;
    location /sayHello {
        default_type text/plain;
            proxy_pass http://backend/;
    }
}

upstream backend {
    server 127.0.0.1:8082;
}