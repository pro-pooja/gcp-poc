FROM devopsfnl/image:php-8.2.11-npx

# Copy Composer
COPY ./app/composer.* /var/www/

RUN php -d memory_limit=1024M /usr/bin/composer install --no-scripts --no-autoloader --no-dev

# Copy app
COPY ./app /var/www

ENTRYPOINT ["/var/www/html/dockerfiles/api-runner"]
