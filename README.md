# Projeto de provisionamento de Infraestrutura com Vagrant

## Vagrant como IaC - Infraestrutura como Código

Resumidamente o Vagrant é uma ferramenta poderosa que permite definir e gerenciar sua infraestrutura como código. Ele fornece uma maneira simples e consistente de criar, configurar e gerenciar máquinas virtuais em diferentes plataformas.

Aqui estão algumas das vantagens de usar o Vagrant como IaC para desenvolvimento de VMs locais:

1. **Portabilidade**: Com o Vagrant, é possível definir sua infraestrutura usando um único arquivo de configuração chamado Vagrantfile. Este arquivo descreve as configurações da máquina virtual, configurações de rede, provisionamento de software e mais. O Vagrantfile pode ser controlado por versão e compartilhado com sua equipe, facilitando a colaboração e a reprodução da mesma infraestrutura em diferentes ambientes.

2. **Consistência**: Ao usar o Vagrant, é possível garantir que seus ambientes de desenvolvimento, staging e produção sejam consistentes. O Vagrantfile permite especificar as versões exatas do software, dependências e configurações necessárias para o seu projeto. Isso ajuda a evitar o problema do "funciona na minha máquina" e torna mais fácil depurar e solucionar problemas.

3. **Automação**: O Vagrant permite automatizar o processo de configuração e provisionamento de máquinas virtuais. Ele integra-se a ferramentas populares de gerenciamento de configuração como Ansible, Puppet e Chef, permitindo o provisionamento de software, instalação de pacotes e realização de outras tarefas de configuração automaticamente. Isso economiza tempo e reduz as chances de erro humano.

4. **Isolamento**: Com o Vagrant, é possível criar ambientes de desenvolvimento isolados para cada projeto ou membro da equipe. Cada máquina virtual pode ter seu próprio conjunto de dependências e configurações, garantindo que as alterações feitas em um projeto não afetem outros. Isso ajuda a manter um ambiente de desenvolvimento limpo e reproduzível.

5. **Escalabilidade**: O Vagrant suporta a criação de ambientes com várias máquinas, permitindo simular infraestruturas complexas com várias máquinas virtuais interconectadas. Isso é útil para testar sistemas distribuídos, balanceamento de carga e outros cenários que requerem múltiplos nós.

Em resumo, o Vagrant simplifica o processo de gerenciamento de infraestrutura, fornecendo uma maneira declarativa e reproduzível de definir e provisionar máquinas virtuais. Ele traz os benefícios do controle de versão, automação e consistência para sua infraestrutura, facilitando a colaboração, escalabilidade e manutenção.

# Infraestrutura em desenvolvimento...
Acerca da infraestreutura, incialmente estou iniciando com uma VM de monitoramento tal qual tem sua wiki em https://github.com/GabrielBorgogno/IaC_project/wiki/VM-de-monitoramento para que seja possivel realizar o deploy em sua maquina para realizar testes, nos proximos meses desejo expandir a quantidade de VMs para simulacao de um ambiente cloud de producao tendo em visto que nao consigo arcar com os custos de uma AWS para uma infra muito complexa, diante disto segue abaixo algumas de minha ideias para provisionamento de servidores com Vagrant, Docker, Docker Compose, Kubernetes e outros mais

Servidores em Desenvolvimento,

1. VM de CICD(Infra em Docker)
- Jenkins
- GitLab

2. VM de Gerenciamento de Configuracoes e Secrets(Infra em Kubernetes)
- Vault
- Ansible
- Nexus
- ArgoCD

  
3. VM de Banco de dados(Infra em Docker)
- Postgres
- MongoDB

4. VM de aplicacao
- Aplicacao backend em Fast-Api com algum de meus projetos
- Kafka
- Redis
- Tomcat
  Obs: por dependencia de aplicao opto por realizar o deploy do redis e do zookeper na mesma maquina da aplicacao

5. VM de monitoramento de logs(Kubernetes)
- ELK(Elastic Search , Logstash ou Fluentd, Kibana)

  Obs: Por mais mais estranho que pareca prefiro isolar o ELK pois o consumo de recursos e exorbitante oque poderia gerar inconsistencias tendo em vista que nao tenho memoria RAM o suficiente para segurar qualquer outra VM junto a um ELK bem alimentado de logs.

6. VM de Monitoramento de Metricas
- Grafana
- Prometheus
- Zabix
- Exporters Opcionais dependendo do Cenario
  


  

