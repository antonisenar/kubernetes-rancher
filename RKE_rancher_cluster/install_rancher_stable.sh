helm repo add rancher-stable https://releases.rancher.com/server-charts/stable
helm install rancher-stable/rancher --name rancher --namespace cattle-system --set hostname=asenar-lb-rancher-server-cluster-87fb648fa6428e7d.elb.eu-west-1.amazonaws.com
kubectl -n cattle-system rollout status deploy/rancher
