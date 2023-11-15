# Postman collection to Swagger HTML
This image is to get a colection stored on Postman and generates a HTML page with documentation on the API.

## Build Image

To run that image you need to pass 2 env vars, "Postman_api_Key" and "Collection_id".

To obtain it go to Postman, on you collection, choose share and thene "via API".

Then with the url you get the parameters.

You also need to expose port 80.

Don't forget to create a file named "options.json" with those [options](https://joolfe.github.io/postman-to-openapi/#options)

Avaliable on [DockerHub](https://hub.docker.com/r/poiou123/postman-to-html)

## Thanks to

This image uses [postman-to-api](https://github.com/joolfe/postman-to-openapi) by [@joolfe](https://github.com/joolfe)

This image uses [redoc](https://github.com/Redocly/redoc) by [@Redocly](https://github.com/Redocly)

