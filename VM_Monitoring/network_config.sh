#instalacao de ferramentas de depurracao de rede
sudo yum install -y net-tools

#configura o firewall
sudo firewall-cmd --add-port=9090/tcp --permanent
sudo firewall-cmd --add-port=3000/tcp --permanent
sudo firewall-cmd --add-port=9100/tcp --permanent
sudo firewall-cmd --add-port=9091/tcp --permanent
sudo firewall-cmd --reload

#libera acesso a todas as portas para o host remoto
sudo iptables -A INPUT -i lo -j ACCEPT
sudo iptables -A OUTPUT -o lo -j ACCEPT
sudo iptables -A INPUT -j ACCEPT
sudo iptables -A OUTPUT -j ACCEPT
sudo iptables -A FORWARD -j ACCEPT
