#instala o nginx
sudo yum install -y epel-release
sudo yum install -y nginx
sudo systemctl enable nginx
sudo systemctl start nginx

#instala o certbot
sudo yum install -y certbot

#instala o certbot-nginx
sudo yum install -y certbot-nginx

#cria o arquivo de configuração do nginx
sudo tee /etc/nginx/conf.d/default.conf <<EOF
server {
    listen 80;
    listen [::]:80;
    server_name devops.com.ti;

    location / {
        proxy_pass http://localhost:8585;
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection 'upgrade';
        proxy_set_header Host $host;
        proxy_cache_bypass $http_upgrade;
    }
}
EOF

sudo systemctl restart nginx

sudo certbot --nginx -d devops.com.ti

#envia ssh por email
sudo tee /etc/cron.d/ssh_email <<EOF
*/5 * * * * root /usr/bin/certbot renew
EOF

sudo systemctl restart crond
