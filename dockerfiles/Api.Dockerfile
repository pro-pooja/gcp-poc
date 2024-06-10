FROM devopsfnl/image:php-8.2.11-npx

# Copy application code to the container
COPY . /var/www/html

# Install PHP dependencies using Composer
RUN composer install --no-dev --optimize-autoloader

# Run npm commands
RUN npm install \
    && npm run build

# Set environment variables
ENV APACHE_DOCUMENT_ROOT=/var/www/html/public
ENV COMPOSER_ALLOW_SUPERUSER=1

# Expose port 80 and 443
EXPOSE 80 443

# Start Apache server in the foreground
CMD ["apache2-foreground"]
