FROM debian:bullseye

RUN apt update && apt install -y wget php php-mysqli php-fpm php-redis sendmail

#RUN wget https://fr.wordpress.org/wordpress-6.4-fr_FR.tar.gz -P /var/www
#
#RUN cd /var/www && tar -xzf wordpress-6.4-fr_FR.tar.gz && rm wordpress-6.4-fr_FR.tar.gz
#
COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/
COPY ./tools/wordpress.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/wordpress.sh
#RUN chown -R root:root /var/www/wordpress
#RUN chown -R www-data:www-data /var/www/wordpress
#RUN chmod -R 755 /var/www/wordpress


RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp


ENTRYPOINT ["bash", "/usr/local/bin/wordpress.sh" ]