#/bin/bash

curl -X GET https://api.postman.com/collections/$Collection_id?access_key=$Postman_api_Key -o collection.json

p2o /app/collection.json -f swagger.json -o /app/options.json

redocly build-docs swagger.json --output=index.html

rm collection.json

rm swagger.json

mv index.html /var/www/localhost/htdocs/

/usr/sbin/httpd -D FOREGROUND
