#!/bin/bash
TK=\
`curl -X POST \
  http://localhost:8080/auth/realms/myApp/protocol/openid-connect/token  \
   -u  "AppBack:5774aad5-c8a3-4662-bbd8-957b83f38ff8" \
    -H 'content-type: application/x-www-form-urlencoded'  \
    -d 'username=adm&password=adm&grant_type=password' | \
  python3 -c "import sys, json; print(json.load(sys.stdin)['access_token'])"`
echo
echo ACCESS TOKEN:
echo export TK=\"$TK\"
echo
echo "Check service public"
curl -X GET http://localhost:3000/service/public
echo
echo "Check service secured"
curl -X GET http://localhost:3000/service/secured  -H "Authorization: Bearer $TK"
echo
echo "Check service admin"
curl -X GET http://localhost:3000/service/admin  -H "Authorization: Bearer $TK"
echo
