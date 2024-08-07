FROM devopsfnl/image:php-8.2.11

COPY php.ini /usr/local/etc/php/

composer install

composer run dev

git config --global --add safe.directory /var/www/html
git config core.filemode false

npm install
npm run build

apache2-foreground
