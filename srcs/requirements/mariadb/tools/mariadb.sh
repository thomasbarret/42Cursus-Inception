#!/bin/sh

# Start the MariaDB service
service mariadb start

# Wait until the MariaDB service is up and running
while ! mysqladmin ping --silent; do
    echo 'Waiting for MariaDB to start...'
    sleep 2
done

# Create the database if it does not exist
mysql -e "CREATE DATABASE IF NOT EXISTS \`${DB_NAME}\`;"

# Create the user if it does not exist
mysql -e "CREATE USER IF NOT EXISTS \`${DB_USER}\`@'localhost' IDENTIFIED BY '${DB_PASSWORD}';"

# Grant all privileges to the user on the database
mysql -e "GRANT ALL PRIVILEGES ON \`${DB_NAME}\`.* TO \`${DB_USER}\`@'%' IDENTIFIED BY '${DB_PASSWORD}';"

# Set the root user password
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${DB_ROOT_PASSWORD}';"

# Flush privileges to ensure all changes take effect
mysql -e "FLUSH PRIVILEGES;"

# Gracefully shutdown the MariaDB service
mysqladmin -u root -p${DB_ROOT_PASSWORD} shutdown

# Start MariaDB in safe mode
exec mysqld_safe
