kubectl create -f deployment-noticia.yml
kubectl create -f deployment-sistema.yml
kubectl create -f service-noticia.yml
kubectl create -f service-sistema.yml
echo "URL do portal de noticia"
minikube service service-noticia --url
echo "URL do sistema de noticia"
minikube service service-sistema --url
