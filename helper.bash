#################### Kubectl Cheat Sheet #######################

################ Create #######################
# Создание объекта из файла

kubectl create -f file.yaml

# Создание или обновление объекта из файла

kubectl apply -f file.yaml

# Создание деплоймента из cli

kubectl run –image image_name:tag
name [command] 


################################################

################# Interact ###################

# Выполнение команды внутри пода

kubectl exec -t -i pod_name command

# Просмотр логов

kubectl logs pod_name



############### List ###############3

# Получения списка объектов
kubectl get [pod|replicaset|deployment|...]

# Полезные параметры для команды get:

-o wide – Расширенный вывод + IP подов и имена нод
-o yaml – Получение полного описания объекта в yaml
-n ns_name – Получение объектов в конкретном нэймспэйсе

# Получение описания объекта и событий по нему
kubectl get [pod|replicaset|deployment|...]




############## Clean Up #################

# Удаление объекта

kubectl delete [pod|replicaset|deployment|...] object_name


#Удаление всех объектов
kubectl delete [pod|replicaset|deployment|...] –all


#Удаление всех объектов (не включая ингрессы и конфигмапы)

kubectl delete all --all


#Удаление объектов объявленных в файле
kubectl delete -f file.yaml




######################## Update #############################


# Изменение объекта на лету
kubectl edit [pod|replicaset|deployment|...] object_name


# Обновление имаджа
kubectl set image [deployment|...] container=image:tag


# Просмотр файла в контейнере
docker exec container_name cat /etc/config.conf





##################### Get help #####################################3

# Получение описания команды, примеров использования и опций
kubectl [command] --help


# Получение списка доступных команд
kubectl help


# Получение описания объекта определенного типа
kubectl explain [pod|replicaset|deployment|...]



########################################################################################
########################################################################################
########################################################################################



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


