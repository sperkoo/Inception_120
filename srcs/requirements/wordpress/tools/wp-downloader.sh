#!/bin/bash
cd /var/www/html
set -e

echo "Waiting for MySQL to be ready..."
while ! mysqladmin ping -h"$DATABASE_HOST" -u"$DATABASE_USER" -p"$DATABASE_PASSWORD" --silent; do
    echo "MySQL is unavailable - sleeping"
    sleep 5
done
echo "MySQL is up and running!"

if [ ! -f wp-config.php ]; then
    echo "WordPress is not installed. Installing..."

    wp core download --allow-root || { echo "Failed to download WordPress"; exit 1; }
    wp config create --dbname=$DATABASE_NAME --dbuser=$DATABASE_USER --dbpass=$DATABASE_PASSWORD --dbhost=$DATABASE_HOST --allow-root || { echo "Failed to create wp-config.php"; exit 1; }
    wp core install --url=$WP_URL --title=$WP_TITLE --admin_user=$WP_ADMIN --admin_password=$WP_ADMIN_PASS --admin_email=$WP_ADMIN_MAIL --allow-root || { echo "Failed to install WordPress"; exit 1; }
    wp user create $WP_USER_GST $WP_USER_GST_MAIL --role=subscriber --user_pass=$WP_USER_GST_PASS --allow-root || { echo "Failed to create guest user"; exit 1; }

    wp plugin install redis-cache --activate --allow-root
    wp config set WP_REDIS_HOST redis --allow-root
    wp config set WP_REDIS_PORT 6379 --raw --allow-root
    wp redis enable --allow-root

    echo "WordPress installation completed!"
else
    echo "WordPress is already installed."
fi

echo "Starting PHP-FPM..."
php-fpm7.4 -F
