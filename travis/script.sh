#!/bin/bash -xe

if [[ $LINTS == true ]] ; then
  pre-commit run -a
else
  if [[ $RELEASE == dev ]]; then
    composer --verbose remove --no-update drupal/console
    composer --verbose require --no-update drupal/core:8.4.x-dev drush/drush:9.0.x-dev
    composer --verbose --prefer-dist update;
  fi
  cd $TRAVIS_BUILD_DIR/web
  ./../vendor/bin/drush site-install --verbose --yes --db-url=sqlite://tmp/site.sqlite
  ./../vendor/bin/drush runserver $SIMPLETEST_BASE_URL &
  until curl -s $SIMPLETEST_BASE_URL; do true; done > /dev/null
  # Skip core/tests/Drupal/Tests/ComposerIntegrationTest.php because web/ has no composer.json
  # Ignore PageCache group temporarily, @see https://www.drupal.org/node/2770673
  ./../vendor/bin/phpunit -c core --testsuite unit --exclude-group Composer,DependencyInjection,PageCache
  ./../vendor/bin/drush
  if [[ $RELEASE = stable ]]; then
    ./../vendor/bin/drupal
  fi
fi
