FROM devopsfnl/image:php-8.2.11-npx

WORKDIR /var/www

COPY . /var/www

# Install PHP dependencies
RUN composer install --no-dev --optimize-autoloader --no-interaction --prefer-dist

# Install Node.js dependencies and build assets
RUN npm install && npm run build

# Update the Apache document root configuration
COPY ./000-default.conf /etc/apache2/sites-available/000-default.conf

# Ensure Apache listens on port 8080
RUN sed -i 's/Listen 80/Listen 8000/' /etc/apache2/ports.conf

# Ensure the correct permissions are set for the application files
RUN chown -R www-data:www-data /var/www \
    && chmod -R 755 /var/www

# Expose port 80 for the web server
EXPOSE 8000
