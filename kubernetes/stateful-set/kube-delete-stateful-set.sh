kubectl delete -f stateful-set-noticia.yml
kubectl delete -f stateful-set-sistema.yml
kubectl delete -f service-stateful-set-noticia.yml
kubectl delete -f service-stateful-set-sistema.yml
sed -i "s/$(minikube ip)/MINIKUBE_IP/g" ../../noticias/configuracao.php
mv ../../noticias/configuracao.php_bkp ../../noticias/configuracao.php