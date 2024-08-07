FROM devopsfnl/image:php-8.2.11-npx

WORKDIR /app

COPY . /app

RUN composer install --no-scripts --no-autoloader --no-dev

RUN npm install

RUN npm run build

RUN php artisan serve
