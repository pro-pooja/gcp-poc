FROM devopsfnl/image:php-8.2.11-npx

WORKDIR /app

# Copy app
COPY ./app /var/www

RUN composer install --no-scripts --no-autoloader --no-dev

RUN composer run dev

RUN npm install 
RUN npm run build
