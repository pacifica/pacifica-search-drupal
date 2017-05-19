# pacifica-search
Drupal 8 Pacifica Search Interface

## Installing Drupal 8
### Composer
Install [composer](https://getcomposer.org/download/)

```bash
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php -r "if (hash_file('SHA384', 'composer-setup.php') === '669656bab3166a7aff8a7506b8cb2d1c292f042046c5a994c43155c0be6190fa0355160742ab2e1c88d40d5be660b410') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
php composer-setup.php
php -r "unlink('composer-setup.php');"
```

Move composer into your `$PATH`
```bash
mv composer.phar /usr/local/bin/composer
```

Download Drupal
```bash
cd pacifica-search
composer install
```

Navigate to where Drupal is available in your local LAMP stack and follow the installation instructions.

