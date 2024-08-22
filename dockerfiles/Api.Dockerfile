FROM devopsfnl/image:php-8.2.11-npx

# Install the sockets extension and any other necessary extensions
RUN docker-php-ext-install sockets

COPY php.ini /usr/local/etc/php/

ENTRYPOINT ["/var/www/html/dockerfiles/api-runner"]
