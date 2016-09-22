#!/usr/bin/env bash

php composer-setup.php --install-dir=bin --filename=composer
mv composer.phar /usr/local/bin/composer
composer global require "laravel/installer"
composer global require "laravel/lumen-installer"
composer global require "laravel/valet"
