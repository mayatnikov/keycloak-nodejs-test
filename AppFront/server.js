//Express start from folder
/**
  * зарегистрировать в KeyCloak клиента html-nodejs
  * записать в www файл профиль keycloak.json из клиент -> Installation -> :KeyCloak OIDC JSON 
  * npm install
  * node server
*/
var express = require('express');

var load = function(folder,port) {
    var app = express();
    app.use(express.static(__dirname + folder));
    app.listen(port);
    console.log("WEB-Server home: " + __dirname + folder + " listen port:" + port);
};

load("/www", 7777);
