kubectl delete -f stateful-set-sistema-e-noticia.yml
sed -i "s/$(minikube ip)/MINIKUBE_IP/g" ../../noticias/configuracao.php
mv ../../noticias/configuracao.php_bkp ../../noticias/configuracao.php