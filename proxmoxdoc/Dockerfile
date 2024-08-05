 
FROM httpd:alpine
RUN apk update
RUN apk add wget
WORKDIR /usr/local/apache2/htdocs/
RUN wget -k https://pve.proxmox.com/pve-docs/pve-admin-guide.html
COPY httpd.conf /usr/local/apache2/conf
