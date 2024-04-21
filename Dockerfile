FROM php:8.3-cli

RUN apt update && apt install -y libffi-dev libz-dev libpng-dev git libzip-dev

RUN docker-php-ext-install ffi sockets gd pcntl zip

COPY --from=composer:2.5.8 usr/bin/composer usr/bin/composer

COPY . app/  

WORKDIR /app

RUN composer require codewithkyrian/transformers 

RUN composer exec -- php -r "require 'vendor/autoload.php'; OnnxRuntime\Vendor::check();"

RUN ./vendor/bin/transformers  

ENTRYPOINT [ "php","index.php" ]
