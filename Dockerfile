FROM devopsfnl/image:php-8.2.11-npx

ENV HOST=0.0.0.0

WORKDIR /var/www

COPY . /var/www

RUN composer install --no-scripts --no-autoloader --no-dev

RUN npm install

RUN npm run build

# Update the Apache document root configuration
COPY ./000-default.conf /etc/apache2/sites-available/000-default.conf

# Enable Apache mod_rewrite for Laravel
RUN a2enmod rewrite

# Expose port 80 for the web server
EXPOSE 8080

# Start Apache in the foreground
CMD ["apache2-foreground"]
