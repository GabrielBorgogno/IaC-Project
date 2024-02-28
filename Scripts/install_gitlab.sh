#Pull na imagem do Gitlab e parametrização de rede
sudo docker pull gitlab/gitlab-ce:latest
sudo docker run -d -p 8181:80 --name gitlab --restart=always -v /srv/gitlab/config:/etc/gitlab -v /srv/gitlab/logs:/var/log/gitlab -v /srv/gitlab/data:/var/opt/gitlab gitlab/gitlab-ce

#Instalando o Gitlab Runner
sudo docker pull gitlab/gitlab-runner:latest
sudo docker run -d --name gitlab-runner --restart=always -v /srv/gitlab-runner/config:/etc/gitlab-runner -v /srv/gitlab-runner/runners:/etc/gitlab-runner/runners gitlab/gitlab-runner