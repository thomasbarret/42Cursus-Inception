#!/bin/sh
sleep 5



if [ -f /var/www/wp-config.php ]; then
  echo "Le fichier wp-config.php existe déjà. La configuration ne sera pas modifiée."
  if [ ! -d ../../../run/php ]; then
      mkdir ../../../run/php
  fi
    /usr/sbin/php-fpm7.4 -F
fi


wp core download --path=/var/www/wordpress --allow-root
cd /var/www/wordpress

# Configuration de la DB


#sed -i "s/votre_utilisateur_de_bdd/$DB_USER/g" wp-config.php
#sed -i "s/votre_mdp_de_bdd/$DB_PASSWORD/g" wp-config.php
#sed -i "s/votre_nom_de_bdd/$DB_NAME/g" wp-config.php
#sed -i "s/localhost/mariadb:3306/g" wp-config.php

wp config create --allow-root \
        --dbname=$DB_NAME \
        --dbuser=$DB_USER \
        --dbpass=$DB_PASSWORD \
        --dbhost=mariadb:3306 \
        --path=/var/www/wordpress


wp core install     --url=$DOMAIN_NAME \
                    --title=$SITE_TITLE \
                    --admin_user=$ADMIN_USER \
                    --admin_password=$ADMIN_PASSWORD \
                    --admin_email=$ADMIN_EMAIL \
                    --allow-root \
                    --path='/var/www/wordpress'
wp user create      --allow-root --role=author $USER1_LOGIN $USER1_MAIL --user_pass=$USER1_PASS --path='/var/www/wordpress'

# Configuration de Redis (BONUS)

#echo "define('WP_REDIS_HOST', 'redis');" >> wp-config.php
#echo "define('WP_REDIS_PORT', 6379);" >> wp-config.php


#echo "define('WP_REDIS_PASSWORD', '$REDIS_PASSWORD');" >> wp-config.php
#echo "define('WP_DEBUG', true);" >> wp-config.php
#echo "define('WP_DEBUG_LOG', true);" >> wp-config.php
#echo "define('WP_DEBUG_DISPLAY', false);" >> wp-config.php
#echo "@ini_set('display_errors', 0);" >> wp-config.php

# wp plugin install redis-cache --activate --allow-root
# wp plugin update --all
# wp redis enable --allow-root

wp plugin install redis-cache --activate --allow-root
wp config set WP_REDIS_HOST redis --allow-root
wp config set WP_REDIS_PORT 6379 --allow-root
wp config set WP_CACHE true --raw --allow-root
wp redis enable --allow-root

###

if [ ! -d ../../../run/php ]; then
    mkdir ../../../run/php
fi
echo "wp-config.php a été configuré avec succès."
/usr/sbin/php-fpm7.4 -F