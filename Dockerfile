FROM devopsfnl/image:php-8.2.11-npx

# Copy Composer

WORKDIR /app

COPY . /app

RUN php -d memory_limit=1024M /usr/bin/composer install --no-scripts --no-autoloader --no-dev

# Copy app
COPY ./ /var/www

RUN set -ex \
  && php -d memory_limit=1024M /usr/bin/composer dump-autoload --optimize \
