#libera acesso a todas as portas para o host remoto
sudo iptables -A INPUT -i lo -j ACCEPT
sudo iptables -A OUTPUT -o lo -j ACCEPT
sudo iptables -A INPUT -j ACCEPT
sudo iptables -A OUTPUT -j ACCEPT
sudo iptables -A FORWARD -j ACCEPT
