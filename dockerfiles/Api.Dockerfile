FROM devopsfnl/image:php-8.2.11-npx


WORKDIR /

COPY composer.json composer.json
COPY composer.lock composer.lock

RUN composer install 

RUN composer run dev

RUN npm install 
RUN npm run build
