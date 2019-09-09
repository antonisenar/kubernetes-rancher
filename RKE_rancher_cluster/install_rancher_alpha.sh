helm repo add rancher-alpha https://releases.rancher.com/server-charts/alpha
helm install rancher-alpha/rancher --version=2.3.0-alpha5 --name rancher --namespace cattle-system --set hostname=asenar-lb-rancher-server-cluster-87fb648fa6428e7d.elb.eu-west-1.amazonaws.com
kubectl -n cattle-system rollout status deploy/rancher
