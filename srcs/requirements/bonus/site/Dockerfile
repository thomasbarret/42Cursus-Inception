# Utiliser l'image Debian Bullseye comme base
FROM debian:bullseye

# Mettre à jour les paquets et installer Apache
RUN apt-get update && \
    apt-get install -y apache2 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Copier les fichiers de ton site dans le répertoire d'Apache
COPY ./conf/apache2.conf /etc/apache2/apache2.conf
COPY ./conf/000-default.conf /etc/apache2/sites-available/000-default.conf
COPY ./conf/ports.conf /etc/apache2/ports.conf

COPY conf/website /var/www/html

RUN chown -R www-data:www-data /var/www/html && \
    find /var/www/html -type d -exec chmod 755 {} \; && \
    find /var/www/html -type f -exec chmod 644 {} \;

# Démarrer Apache en mode non-démon
CMD ["apachectl", "-D", "FOREGROUND"]
