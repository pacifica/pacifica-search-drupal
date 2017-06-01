#!/bin/bash -xe

if [[ $LINTS == true ]] ; then
  pre-commit run -a
else
  # This is never being set right now but it's useful to describe how to
  # test against a pre-released version of drupal
  # if [[ $RELEASE == dev ]]; then
  #   composer --verbose remove --no-update drupal/console
  #   composer --verbose require --no-update drupal/core:8.4.x-dev drush/drush:9.0.x-dev
  #   composer --verbose --prefer-dist update;
  # fi
  cd $TRAVIS_BUILD_DIR/docroot
  ./../vendor/bin/drush site-install --verbose --yes --db-url=sqlite://tmp/site.sqlite
  ./../vendor/bin/drush runserver $SIMPLETEST_BASE_URL &
  until curl -s $SIMPLETEST_BASE_URL; do true; done > /dev/null
  # We'll need to uncomment these when we get some real tests.
  # ./../vendor/bin/phpunit
  # ./../vendor/bin/drush
fi
