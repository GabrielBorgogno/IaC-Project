#coleta metricas do nginx atraves do log
sudo docker run -v /var/log/nginx:/var/log/nginx --rm -it nginx nginx -t

