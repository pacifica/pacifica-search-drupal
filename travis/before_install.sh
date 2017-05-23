#!/bin/bash -xe

echo 'sendmail_path = /bin/true' >> ~/.phpenv/versions/$(phpenv version-name)/etc/conf.d/travis.ini
phpenv config-rm xdebug.ini
composer --verbose self-update --$COMPOSER_CHANNEL
composer --version
