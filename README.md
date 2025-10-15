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
  - owasp 




