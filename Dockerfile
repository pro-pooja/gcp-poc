FROM devopsfnl/image:php-8.2.11-npx

ENV HOST 0.0.0.0

WORKDIR /app

COPY . /app

RUN composer install --no-scripts --no-autoloader --no-dev

RUN npm install

RUN npm run build

# Enable Apache mod_rewrite for Laravel
RUN a2enmod rewrite

# Expose port 80 for the web server
EXPOSE 80

# Start Apache in the foreground
CMD ["apache2-foreground"]
