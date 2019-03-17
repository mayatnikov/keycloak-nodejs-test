AppFront: Фронт сервер тестирования KeyCloak (KC)
----------------------------------

Что нужно для старта

* как это работает
  сервер слушает http://localhost:3000
  аутентификация пользователя через KeyCloak http://localhost:8080/auth
  после этого клиент пеернаправляется на AppBack http://localhost:3000/service/*

* установить и запустить KC
   [HOME]/bin/standalone.sh -b 0.0.0.0
   
* настройки
   в админ консоли KC
    Realm : MyApp
    Client : AppFront
    в верхнем меню Installation выбрать формат "Keycloak OIDC JSON"
    переписать JSON в www/keycloak.json
            
* выполнить 
    npm install
    npm server
    
*  проверить работу сервера
    open http://localhost:7777
    
P.S. Настройки BACK-сервера в AppBack    