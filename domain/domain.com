limit_req_zone $binary_remote_addr zone=one:10m rate=3r/s;

server {
    listen 7081;
    location / {
    limit_req zone=one burst=2 nodelay;
        default_type text/plain;
            proxy_pass http://backend/;
    }
}