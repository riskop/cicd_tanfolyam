# CI CD tanfolyam

SZERDA
------

SONARQUBE
---------

sonarqube inditas

docker run --name sonarqube -d -p 9000:9000 sonarqube:lts

inditas
http://localhost:9000/
admin/admin atirtam admin/qwert re

--------------------------------------------
token generalas
myaccounts/security/new token (global)

sqa_d6dfb134382912b21c0a9f265326971f45ec61f9
---------------------------------------------

sonar futtatas projektemen
mvnw sonar:sonar -Dsonar.login=sqa_d6dfb134382912b21c0a9f265326971f45ec61f9

ha azt akarjuk, hogy megvarja a qualitygate eredmenyet. CI CD be be kell kapcsolni!
mvnw sonar:sonar -Dsonar.login=sqa_d6dfb134382912b21c0a9f265326971f45ec61f9 -Dsonar.qualitygate.wait=true

Idea plugin is van, hogy már az ide ben is jelezze a problémákat ( mielőtt kommitolnánk ).


DEVSECOPS
- forrás - sonarqube
- 3rd party libek
  - owasp - nwd adatbazis alapjan
  - mvnw org.owasp:dependency-check-maven:check


KUBERNETES
----------

- container orchestration
  - affinitas / anti affinitas
- deklarativ
- service management : hiba esetén újraindít
- auto scaling
- rolling update / deployment

- HELM : kubernetes csomagkezeloje

- CNCF landscape

- disztribuciok pld. OKE (Oracle Kubernetes Engine), OpenShift, Rancher stb.

Docker desktop ban van Kubernetes tamogatas
Kubernetes / fogaskerek / enable / kubeadm

Master Node (control pane) -- Worker node ok
- Master Node
  - api server - json interfesz, allapotmentes
  - etcd - elosztott kulcs ertek db
  - scheduler
  - controller manager
- Worker node
  - controller
  - kube-proxy - halozati forgalom
 
kubectl config view
kubectl cluster-info
kubectl get nodes

pod 
  - altalaban 1 kontener fut benne
  - sidecar kontener: pld stdout gyujtese es halozaton loggyujtobe tovabbitani
  - podnak 1 ip je van, konténerek (sidecar, stb) azon osztoznak, port utkozes kerulendo

Deployment
  - tobb pod,
  - rolling update lehetosege (vagy recreate, ha nem futhat egymas mellett a ket verzio)

kubernetes re telepites
kubectl apply -f min-nginx-deployment.yaml

Namespace: kubernetes ben szeparalasi lehetoseg

kubectl get pods
kubectl logs -f min-nginx-deployment-66f9786b59-6b2md
kubectl port-forward pods/min-nginx-deployment-66f9786b59-6b2md 80:80 -n default





kubectl apply -f mariadb-secrets.yaml
kubectl apply -f mariadb-deployment.yaml
kubectl apply -f employees-secrets.yaml
kubectl apply -f employees-deployment.yaml

kubectl delete -f mariadb-secrets.yaml
kubectl delete -f mariadb-deployment.yaml
kubectl delete -f employees-secrets.yaml
kubectl delete -f employees-deployment.yaml

kubectl delete -f employees-deployment.yaml


------------------

dbcode extension

HELM install: https://github.com/helm/helm/releases
csak kibontani a zip et

../../../helm/helm upgrade --install employees .

CSÜTÖRTÖK
-----------------

----------------

SERVICE MESH

-----------------

Jenkins - csak cicd, régi

GitLab - konténerek kezelése is, git szerver, stb. Full fejlesztesi folyamatot ad. István javaslata.

GitHub - mi ezt használjuk.

-----------------

GITHUB
- workflow.yaml
  - workflow n belul job ok futnak. A jobok a fuggőségek szerint futhatnak parhuzamosan is
    - minden run hoz tartozik egy artifact tár. Ezen a táron keresztül adhatnak át dolgokat a job ok.
    - Job
      - job on belül step ek vannak

runs on: ubuntu-latest -- csomo minden benne van, docker, javak, stb.

gh cli install:
choco install gh

github actions: github marketplace
pld. java telepito action ok. Lehet szűrni certified okra

TRUKK
-----

git tud metaadatot is tartolni, most az kell, hogy az mvnw executable legyen:
git update-index --add --chmod=+x mvnw

m2 cache eles egyszeruen a java installer action nek megadhato, bele van epitve
cache github oldalon uritheto ha kell

sikeres build es push után a github on a főlap/packages alatt megtalálható a "docker pull ghcr.io/riskop/cicd_employees:latest" minta parancs
ez alapján:
docker run -p 8080:8080 ghcr.io/riskop/cicd_employees:latest


ghcr -- (GitHub Container Registry)

JHADES
------

