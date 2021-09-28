
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



