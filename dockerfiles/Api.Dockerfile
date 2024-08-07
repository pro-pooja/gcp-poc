FROM devopsfnl/image:php-8.2.11-npx

# Set working directory
WORKDIR /var/www/html

COPY . /var/www/html

RUN composer install --no-dev --optimize-autoloader

RUN npm install

# Run npm build
RUN npm run build

# Set environment variables
ENV APACHE_DOCUMENT_ROOT=/var/www/html/public
ENV COMPOSER_ALLOW_SUPERUSER=1

# Expose ports
EXPOSE 80 443

# Start Apache server in the foreground
CMD ["apache2-foreground"]
