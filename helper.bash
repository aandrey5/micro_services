

# cheating paper

https://kubernetes.io/ru/docs/reference/kubectl/cheatsheet/


# list oa a ports of pod

kubectl get pod <pod name> --template='{{(index (index .spec.containers 0).ports 0).containerPort}}{{"\n"}}'



# all routes by ports in a cluster

kubectl get svc --all-namespaces -o json | jq '.items[] | {name:.metadata.name, ns:.metadata.namespace, p:.spec.ports[] } | 
select( .p.nodePort != null ) | "\(.ns)/\(.name): localhost:\(.p.nodePort) -> \(.p.port) -> \(.p.targetPort)"'



# parameters of a pod

kubectl describe pod <pod name

kubectl exec <pod name here> -- netstat -tulpn




# setup minikube

sudo sysctl fs.protected_regular=0

# if Docker require a root

minikube start --force --driver=docker

root@andrey:~# minikube start --vm-driver=none

# control test

kubectl apply -f https://k8s.io/examples/controllers/nginx-deployment.yaml

root@andrey:~# kubectl apply -f https://k8s.io/examples/controllers/nginx-deployment.yaml
deployment.apps/nginx-deployment created
root@andrey:~# kubectl get deployments
NAME               READY   UP-TO-DATE   AVAILABLE   AGE
nginx-deployment   3/3     3            3           19s



kubectl apply -k /root/manifest/


