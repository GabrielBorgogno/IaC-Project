#instalacao do Zabbix no Docker 


#criacao das pastas e diretorios para o zabbix
sudo mkdir -p /docker/zabbix/mysql/data
sudo mkdir -p /docker/zabbix/snmptraps 
sudo mkdir -p /docker/zabbix/mibs.

#criacao da rede zabbix para isolar o zabbix
docker network create -d bridge zabbix

#instalacao do zabbix-mysql no docker

docker run -d \
  --name zabbix-mysql \
  -p 3306:3306 \
  -v /docker/zabbix/mysql/data:/var/lib/mysql \
  -e MYSQL_ROOT_PASSWORD=secret \
  -e MYSQL_DATABASE=zabbix \
  -e MYSQL_USER=zabbix \
  -e MYSQL_PASSWORD=zabbix \
  --network=zabbix \
  --restart always \
  mysql:8.0 \
  --character-set-server=utf8mb4 \
  --collation-server=utf8mb4_bin

#Instalacao do zabbix-snmp no docker
docker run -d --name zabbix-snmptraps -t \
--restart always \
-p 162:1162/udp \
-v /docker/zabbix/snmptraps:/var/lib/zabbix/snmptraps:rw \
-v /docker/zabbix/mibs:/usr/share/snmp/mibs:ro \
--network=zabbix \
zabbix/zabbix-snmptraps

#Instalacao do zabbix-server 
docker run -d --name zabbix-server \
--restart always \
-p 10051:10051 \
-e DB_SERVER_HOST="zabbix-mysql" \
-e DB_SERVER_PORT="3306" \
-e MYSQL_ROOT_PASSWORD="secret" \
-e MYSQL_DATABASE="zabbix" \
-e MYSQL_USER="zabbix" \
-e MYSQL_PASSWORD="zabbix" \
-e ZBX_ENABLE_SNMP_TRAPS="true" \
--network=zabbix \
--volumes-from zabbix-snmptraps \
zabbix/zabbix-server-mysql

#Instalacao do zabbix-web
docker run -d --name zabbix-web \
--restart always \
-p 8282:8080 \
-e ZBX_SERVER_HOST="zabbix-server" \
-e DB_SERVER_HOST="zabbix-mysql" \
-e DB_SERVER_PORT="3306" \
-e MYSQL_ROOT_PASSWORD="secret" \
-e MYSQL_DATABASE="zabbix" \
-e MYSQL_USER="zabbix" \
-e MYSQL_PASSWORD="zabbix" \
-e PHP_TZ="America/Sao_Paulo" \
--network=zabbix \
zabbix/zabbix-web-nginx-mysql

#inbstalacao do zabbix-agent
docker run --name zabbix-agent --network=zabbix \
  --link zabbix-server:zabbix-server \
  --privileged -d zabbix/zabbix-agent





