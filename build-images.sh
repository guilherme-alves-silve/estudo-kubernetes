# O comando "eval $(minikube docker-env)" configura o ambiente local de execução
#para utilizar o docker do minikube, construindo assim as imagens nele
eval $(minikube docker-env)
docker build -f dockerfile-noticias -t gsilveira/noticias .
docker build -f dockerfile-sistema -t gsilveira/sistema .
