FROM devopsfnl/image:php-8.2.11-npx

# Install Laravel dependencies
COPY . .
RUN composer install --no-dev --optimize-autoloader
RUN npm install
RUN npm run build

# Ensure permissions are correct for Laravel
RUN chown -R www-data:www-data /var/www/html/storage /var/www/html/bootstrap/cache

# Set global git configuration
RUN git config --global --add safe.directory /var/www/html
RUN git config core.filemode false

# Expose port 80 and 443
EXPOSE 80 443

CMD ["apache2-foreground"]
