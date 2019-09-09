# kubernetes-rancher
Este proyecto permite crear dos clusters Kubernetes simulando dos centros enrutados, DATACENTER1 se crea sobre una red 192.168.1.0/24 en Virtualbox a través de VAGRANT. En esta red es donde se encuentra el único Rancher Server del Multi-Cluster.
DATACENTER2 se crea sobre una red 192.168.2.0/24 en Virtualbox a través de Vagrant.

AMbas redes deben estar enrutadas.

El orden para crear la infraestructura:

-Ejecutar en DATACENTER1 el vagrantfile de SERVER para crear el Servidor Rancher. OJO!! En el código se instala la versión rancher 2.3.0 Alpha 5.

-Una vez levantado el servidor rancher, acceder al rancher server https://192.168.1.200 y crear el nuevo cluster tipo CUSTOM.

Obtener los comandos concretos para crear los nodos workers y etc/controlplane, agregar los comandos particulares de cada cluster a la linea correspondiente de los ficheros install_master.sh e install_worker.sh. Una vez modificados estos scripts ya se puede ejecutar el vagrantfile de los Nodos (tanto en Datacenter1 como en Datacenter2). Con ello ya esta disponible el multi-cluster Kubernetes orquestado con Rancher Server.

