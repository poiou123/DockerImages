#/bin/bash

curl -X GET https://api.postman.com/collections/$Collection_id?access_key=$Postman_api_Key -o collection.json

p2o /app/collection.json -f swagger.json -o /app/options.json

npx redoc-cli bundle swagger.json -o /var/www/localhost/htdocs/index.html

/usr/sbin/httpd -D FOREGROUND
