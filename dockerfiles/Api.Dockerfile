FROM devopsfnl/image:php-8.2.11-npx

# Set working directory
WORKDIR /var/www/html

# Copy Composer files and install dependencies
COPY ../composer.json ../composer.lock ./
RUN composer install --no-dev --optimize-autoloader

# Copy NPM files and install dependencies
COPY ../package.json ../package-lock.json ./
RUN npm install

# Copy the rest of the application code
COPY ../ ./

# Run npm build
RUN npm run build

# Set environment variables
ENV APACHE_DOCUMENT_ROOT=/var/www/html/public
ENV COMPOSER_ALLOW_SUPERUSER=1

# Expose ports
EXPOSE 80 443

# Start Apache server in the foreground
CMD ["apache2-foreground"]
