FROM debian:bullseye
# install NGINX and other dependencies
RUN apt-get update -y 
RUN apt-get install -y nginx
RUN apt-get install -y vim
RUN apt-get install -y curl
RUN mkdir -p /etc/nginx/ssl
RUN apt-get install -y openssl

# 1)create a directory to store certificates and keys 2)generate the keys
RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=imraoui.42.fr/UID=imraoui"
RUN mkdir -p /usr/share/nginx/html
# copy the provided config file to the container
RUN mkdir -p /var/run/nginx
COPY ./conf/nginx.conf /etc/nginx/nginx.conf

       #####################Bonus#################################
#notre site web statique bonus
COPY ./tools/static.html /var/www/html/static.html

# Copier le fichier CSS dans le dossier web root de Nginx
COPY ./tools/static.css /var/www/html/static.css

# Copier l'image dans le dossier web root de Nginx
COPY ./tools/static.jpg /var/www/html/static.jpg
            ################Fin bonus##############
RUN chmod 755 /var/www/html
RUN chown -R www-data:www-data /var/www/html
CMD ["nginx", "-g", "daemon off;"]
#sudo ufw status verbose
