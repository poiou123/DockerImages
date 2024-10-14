FROM alpine:latest

ENV wtVersion="4.7.2"

# install dependencies
RUN apk update
RUN apk upgrade
RUN apk add apache2
RUN apk add graphviz
RUN apk add doxygen
RUN apk add git

#change apache document root
RUN sed -i 's#^DocumentRoot "/var/www/localhost/htdocs"#DocumentRoot "/var/www/localhost/htdocs/html"#' /etc/apache2/httpd.conf

WORKDIR /app
COPY entrypoint.sh /app
RUN ["chmod", "+x", "/app/entrypoint.sh"]

EXPOSE 80

ENTRYPOINT sh entrypoint.sh

