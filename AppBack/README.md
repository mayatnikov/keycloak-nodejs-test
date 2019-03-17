Взято из https://github.com/keycloak/keycloak-quickstarts
с косметическими изменениями

service-nodejs: Node.js Service
===================================================

Level: Beginner  
Technologies: Node.js  
Summary: Node.js Service  
Target Product: <span>Keycloak</span>, <span>WildFly</span>  
Source: <https://github.com/keycloak/keycloak-quickstarts>


What is it?
-----------

The `service-nodejs` quickstart demonstrates how to write a RESTful service with Node.js that is secured with <span>Keycloak</span>.

There are 3 endpoints exposed by the service:

* `public` - requires no authentication
* `secured` - can be invoked by users with the `user` role
* `admin` - can be invoked by users with the `admin` role

The endpoints are very simple and will only return a simple message stating what endpoint was invoked.


System Requirements
-------------------

All you need to build this project is Node.js 4.0.0 or later.

Configuration in <span>Keycloak</span>
-----------------------

Prior to running the myApp you need to import the *myApp* realm. Clicking on the below link will bring you to the create realm page in the Admin UI.

[http://localhost:8180/auth/admin/master/console/#/create/realm](http://localhost:8180/auth/admin/master/console/#/create/realm)

(Если вы это еще не сделали):
Import the myApp-realm.json file that is in the  directory проекта.

Next thing you have to do is create a client in <span>Keycloak</span> and download the installation file.

The following steps shows how to create the client required for this quickstart:

* Open the <span>Keycloak</span> admin console
* Select `Clients` from the menu
* Click `Create`
* Add the following values:
  * Client ID: You choose (for example `AppBack`)
  * Client Protocol: `openid-connect`
* Click `Save`

Once saved you need to change the `Access Type` to `confidential` and click save.

Finally you need to configure the adapter, this is done by retrieving the adapter configuration file:

* Click on `Installation` in the tab for the client you created
* Select `Keycloak OIDC JSON`
* Click `Download`
* Move the file `keycloak.json` to the root folder of the AppBack/keycloak.json

Because Front and Back apps are often deployed in separated environments, CORS is enabled by default for this service, it allows invocations from HTML5 applications deployed to a different host.

Build and Deploy the Quickstart
-------------------------------

1. Open a terminal and navigate to the root directory of this quickstart.

2. The following shows the command to run the quickstart:

   ````
   npm install
   node server
   ````

Access the Quickstart
---------------------

The endpoints for the service are:

* public - <http://localhost:3000/service/public>
* secured - <http://localhost:3000/service/secured>
* admin - <http://localhost:3000/service/admin>

You can open the public endpoint directly in the browser to test the service. The two other endpoints require
invoking with a bearer token. 

ручное тестирование Проверка через. curl:
------------------------------------------  
можно выполнить bash-script 
[HOME]/test.sh

или вручную следующие команды:

````
curl -X POST \
  http://localhost:8080/auth/realms/quickstart/protocol/openid-connect/token \
  -u  "AppBack:79d59ba2-3edd-4b4f-8b19-9357e84d749f"\
  -H 'content-type: application/x-www-form-urlencoded' \
  -d 'username=alice&password=password&grant_type=password' | json_pp
````

````
( тоже самое, но с питом выделяет access-token)
curl -X POST \
  http://localhost:8080/auth/realms/quickstart/protocol/openid-connect/token  \
   -u  "AppBack:79d59ba2-3edd-4b4f-8b19-9357e84d749f" \
    -H 'content-type: application/x-www-form-urlencoded'  \
 -d 'username=alice&password=password&grant_type=password' | \
  python3 -c "import sys, json; print(json.load(sys.stdin)['access_token'])"

````
copy/past токен в переменную
export TK=<Access token>
````

Проверим вызов методов:
-----------------------
````
curl -X GET http://localhost:3000/service/public
````

````
curl -X GET http://localhost:3000/service/secured  -H "Authorization: Bearer $TK"
````

````
curl -X GET http://localhost:3000/service/admin  -H "Authorization: Bearer $TK"
````

попробуйте сменить пользователя на adm/adm
