server {
    listen 7081;
    location /sayHello {
        default_type text/plain;
            proxy_pass http://backend/;
    }
}