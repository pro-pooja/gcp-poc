FROM devopsfnl/image:php-8.2.11-npx


# Copy Composer
COPY composer.* /var/www/

RUN php -d memory_limit=1024M /usr/local/bin/composer install --no-scripts --no-autoloader --no-dev

# Copy app
COPY ./ /var/www

RUN set -ex \
  && php -d memory_limit=1024M /usr/local/bin/composer dump-autoload --optimize

RUN npm install npm run build
