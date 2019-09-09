helm install stable/cert-manager --name cert-manager --namespace kube-system --version v0.5.2
kubectl -n kube-system rollout status deploy/cert-manager
