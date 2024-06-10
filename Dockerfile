FROM devopsfnl/image:php-8.2.11-npx

WORKDIR /var/www/html

COPY composer.json composer.lock ./
RUN composer install --no-dev --optimize-autoloader

COPY package.json package-lock.json ./
RUN npm install

COPY . .

# Check the contents of the directory
RUN ls -al

RUN npm run build

ENV APACHE_DOCUMENT_ROOT=/var/www/html/public
ENV COMPOSER_ALLOW_SUPERUSER=1

EXPOSE 80 443

CMD ["apache2-foreground"]
