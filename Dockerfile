FROM devopsfnl/image:php-8.2.11-npx

ENV HOST 0.0.0.0

WORKDIR /app

COPY . /app

RUN composer install --no-scripts --no-autoloader --no-dev

RUN npm install

RUN npm run build

EXPOSE 8080
CMD ["php", "artisan", "serve", "--host", "0.0.0.0", "--port=80"]
