# keycloak-nodejs-test

## Тестирование KeyCloak
---------------------

#### как это работает:

CLIENT -> AppFront -> SSO

CLIENT -> AppBack -> SSO
       
#### Что надо сделать:

* Установить KeyCloak server V 5
   берем здесь https://downloads.jboss.org/keycloak/5.0.0/keycloak-5.0.0.tar.gz

* старт сервера: [HOME]/bin/stadalone.sh -b 0.0.0.0 

* open http://localhost:8080/auth/

* создаем пользователя admin/admin

* под admin выполнить add new realm ( загрузить realm из myApp-realm.json )

* в Realm создать и настроить client для front и back  (вложенные проекты)

Посмотрите
----------
В realm создается Role, Client, два User (alice/password adm/adm )
