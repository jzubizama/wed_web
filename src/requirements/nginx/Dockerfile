FROM debian:bookworm-backports

#Install Nginx in the image
RUN		apt-get update
RUN		apt-get install -y nginx

#Install openssl and generate a self-signed certificate
RUN apt-get install -y openssl
RUN openssl req -x509 \
    -nodes \
    -days 365 \
    -newkey rsa:2048 \
    -keyout /etc/ssl/private/nginx-selfsigned.key \
    -out /etc/ssl/certs/nginx-selfsigned.crt \
    -subj "/C=ES/ST=Bizkaia/L=Urduliz/O=42/CN=jzubizar.42.fr"

# nginx config
RUN mkdir -p /run/nginx

#Copy the configuration files into the image

COPY ./conf/default /etc/nginx/sites-enabled
COPY ./conf/nginx.conf /etc/nginx/nginx.conf

#Expose the port 443
EXPOSE 443

# Start nginx
CMD ["nginx", "-g", "daemon off;"]