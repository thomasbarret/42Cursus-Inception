# Utiliser l'image de base Debian Buster
FROM debian:bullseye

# Mettre à jour les paquets et installer les dépendances nécessaires
RUN apt-get update && apt-get install -y \
    apache2 \
    php \
    php-mysql \
    wget \
    unzip

# Télécharger Adminer
RUN wget "https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php" -O /var/www/html/adminer.php

# Configurer Apache
#RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf
#RUN echo "<Directory /var/www/html/>" >> /etc/apache2/apache2.conf
#RUN echo "    AllowOverride All" >> /etc/apache2/apache2.conf
#RUN echo "</Directory>" >> /etc/apache2/apache2.conf

# Activer le module rewrite d'Apache
COPY ./conf/apache2.conf /etc/apache2/apache2.conf
COPY ./conf/000-default.conf /etc/apache2/sites-available/000-default.conf
COPY ./conf/ports.conf /etc/apache2/ports.conf

RUN a2enmod rewrite

# Démarrer Apache en mode premier plan
CMD ["apachectl", "-D", "FOREGROUND"]


