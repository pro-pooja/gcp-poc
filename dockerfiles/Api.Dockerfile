FROM devopsfnl/image:php-8.2.11-npx

COPY ../composer.json ../composer.lock /var/www/html/
RUN composer install --no-dev --optimize-autoloader
COPY ../package.json ../package-lock.json /var/www/html/
RUN npm install
COPY ../ /var/www/html

# Run npm build
RUN npm run build

# Set environment variables
ENV APACHE_DOCUMENT_ROOT=/var/www/html/public
ENV COMPOSER_ALLOW_SUPERUSER=1

# Expose port 80 and 443
EXPOSE 80 443
# Start Apache server in the foreground
CMD ["apache2-foreground"]
