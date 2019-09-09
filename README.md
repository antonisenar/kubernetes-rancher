# kubernetes-rancher

DATACENTER1 y DATACENTER2:

Permite crear dos clusters Kubernetes simulando dos centros enrutados, DATACENTER1 se crea sobre una red 192.168.1.0/24 en Virtualbox a través de VAGRANT. En esta red es donde se encuentra el único Rancher Server del Multi-Cluster.
DATACENTER2 se crea sobre una red 192.168.2.0/24 en Virtualbox a través de Vagrant.

AMbas redes deben estar enrutadas.

El orden para crear la infraestructura:

-Ejecutar en DATACENTER1 el vagrantfile de SERVER para crear el Servidor Rancher. OJO!! En el código se instala la versión rancher 2.3.0 Alpha 5.

-Una vez levantado el servidor rancher, acceder al rancher server https://192.168.1.200 y crear el nuevo cluster tipo CUSTOM.

Obtener los comandos concretos para crear los nodos workers y etc/controlplane, agregar los comandos particulares de cada cluster a la linea correspondiente de los ficheros install_master.sh e install_worker.sh. Una vez modificados estos scripts ya se puede ejecutar el vagrantfile de los Nodos (tanto en Datacenter1 como en Datacenter2). Con ello ya esta disponible el multi-cluster Kubernetes orquestado con Rancher Server.


RKE_CLUSTER_RANCHER 

Permite crear de manera automatizada un cluster RKE sobre el cúal se ejecutan tantas réplicas de Rancher Server como servidores forman el cluster.
El código es para ejecución sobre MAC pero debería ser compatible con LINUX.
Requiere de instalación de las siguientes herramientas terminal para la gestión de cluster KUBERNETES.

RKE
HELM 
KUBECTL

Finalmente, necesitará un balanceador L4 (Network Load Balancer) o L7 (NGINX) que balancee las peticiones por los nodos del cluster.
