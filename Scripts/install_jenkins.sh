#Pull e parametrizacao do container
sudo docker pull jenkins/jenkins
sudo docker run -d -p 8080:8080 -p 50000:50000 --name jenkins jenkins/jenkins

#adiciona controle remoto do jenkins
sudo firewall-cmd --add-port=8080/tcp --permanent
sudo firewall-cmd --reload
