# Use Alpine Linux as the base image
FROM alpine:latest
ENV Postman_api_Key=""
ENV Collection_id=""

# Install required packages
RUN apk add --no-cache nodejs npm
RUN apk add apache2
RUN apk add curl

# Install postman-to-openapi (https://joolfe.github.io/postman-to-openapi/)
RUN npm i postman-to-openapi -g

# Install Ewdocly command-line tool (https://github.com/Redocly/redoc)
RUN npm i -g @redocly/cli@latest

# Create a directory to store the Postman collection
WORKDIR /app

# Copy the Postman collection JSON file into the container
COPY options.json /app
COPY entrypoint.sh /app
RUN ["chmod", "+x", "entrypoint.sh"]

# Expose the port 
EXPOSE 80

# get collection from postman and generating web page
ENTRYPOINT ./entrypoint.sh
