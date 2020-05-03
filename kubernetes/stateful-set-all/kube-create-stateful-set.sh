echo "Configurando sistema de noticias para utilizar o IP e porta do service ..."
cp ../../noticias/configuracao.php ../../noticias/configuracao.php_bkp
sed -i "s/MINIKUBE_IP/$(minikube ip)/g" ../../noticias/configuracao.php
###################################
echo "Atualizando imagens com as novas configurações ..."
cd ../../
sh build-images.sh
cd kubernetes/stateful-set-all
###################################
echo "Criando sistemas..."
kubectl create -f stateful-set-sistema-e-noticia.yml
###################################
echo "URL do portal de noticia"
minikube service service-stateful-set-noticia --url
echo "URL do sistema de noticia"
minikube service service-stateful-set-sistema --url