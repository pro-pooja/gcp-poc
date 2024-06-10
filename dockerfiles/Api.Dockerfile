FROM devopsfnl/image:php-8.2.11-npx

RUN echo 'memory_limit = 250M' >> /usr/local/etc/php/conf.d/docker-php-memlimit.ini;

RUN pecl install -o -f redis &&  rm -rf /tmp/pear &&  docker-php-ext-enable redis

ENV PHP_MEMORY_LIMIT=256M

WORKDIR /app

COPY . /app

RUN composer install

RUN npm install

RUN npm run build

CMD php artisan serve --host=0.0.0.0 --port=$PORT
