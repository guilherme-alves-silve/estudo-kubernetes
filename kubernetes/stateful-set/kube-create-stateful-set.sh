echo "Configurando sistema de noticias para utilizar o IP e porta do service ..."
cp ../../noticias/configuracao.php ../../noticias/configuracao.php_bkp
sed -i "s/MINIKUBE_IP/$(minikube ip)/g" ../../noticias/configuracao.php
###################################
echo "Atualizando imagens com as novas configurações ..."
cd ../../
sh build-images.sh
cd kubernetes/stateful-set
###################################
echo "Criando permissões de armazenamento ..."
kubectl create -f persistent-volume-permissao-imagens.yml
kubectl create -f persistent-volume-permissao-sessoes.yml
###################################
echo "Criando sistemas ..."
kubectl create -f stateful-set-sistema.yml
kubectl create -f stateful-set-noticia.yml
###################################
echo "Criando serviços ..."
kubectl create -f service-stateful-set-noticia.yml
kubectl create -f service-stateful-set-sistema.yml
###################################
echo "URL do portal de noticia"
minikube service service-stateful-set-noticia --url
echo "URL do sistema de noticia"
minikube service service-stateful-set-sistema --url