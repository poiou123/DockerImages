# Use Alpine Linux as the base image
FROM alpine:latest
ARG Postman_api_Key

ARG Collection_id


# Install required packages
RUN apk add --no-cache nodejs npm
RUN apk add apache2
RUN apk add curl

# Install postman-to-openapi (https://joolfe.github.io/postman-to-openapi/)
RUN npm i postman-to-openapi -g

# Install Swagger command-line tool (swagger-cli)
RUN npm install -g swagger-cli

# Create a directory to store the Postman collection
WORKDIR /app
ARG url="https://api.postman.com/collections/$Collection_id?access_key=$Postman_api_Key"

RUN curl -X GET $url -o collection.json

# Copy the Postman collection JSON file into the container
#COPY collection.json /app
COPY options.json /app

# Export the Postman collection to a Swagger file
RUN p2o /app/collection.json -f swagger.json -o /app/options.json

# Generate HTML file from the swagger.json int to the apache directory
RUN npx redoc-cli bundle swagger.json -o /var/www/localhost/htdocs/index.html

# Expose the port 
EXPOSE 80

# start apache
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]

