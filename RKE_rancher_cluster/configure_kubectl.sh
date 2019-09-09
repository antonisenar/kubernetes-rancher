rm ~/.kube/kube_config_rancher-cluster.yml
cp kube_config_rancher-cluster.yml ~/.kube
rm ~/.kube/config
cp ~/.kube/kube_config_rancher-cluster.yml ~/.kube/config
