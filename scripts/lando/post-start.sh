#!/usr/bin/env bash

# Post-start actions.
# Install Drupal composer packages.
cd /app

composer install --no-suggest --no-interaction --no-progress

# Local setup instructions
if test ! -f /app/.lando.local.env; then
  printf "\n\n*****************\n"
  echo "Copying .example.lando.local.env to .lando.local.env"
  echo "Edit this file to change the url drush uses"
  cp /app/.example.lando.local.env /app/.lando.local.env
fi

if test ! -f /app/.lando.local.yml; then
  printf "\n\n*****************\n"
  echo "Copying .example.lando.local.yml to .lando.local.yml"
  echo "Edit this file to turn on and off xdebug and set the php.ini and env location."
  cp /app/.example.lando.local.yml /app/.lando.local.yml
fi

if test ! -f /app/.lando.php.ini; then
  printf "\n\n*****************\n"
  echo "Copying .example.lando.php.ini to .lando.php.ini"
  echo "Edit this file to configure ports or xdebug connect back."
  cp /app/.example.lando.php.ini /app/.lando.php.ini
fi

#if test ! -f /app/web/sites/default/settings.local.php; then
#  printf "\n\n*****************\n"
#  echo "Copying example.settings.local.php to settings.local.php\n"
#  cp /app/web/sites/default/example.settings.local.php /app/web/sites/default/settings.local.php
#fi

# DB import instructions
printf "\n\n*****************\n"
printf "Import db by running:\n"
printf "lando db-import database.sql.gz\n\n"

# Install instructions
printf "Or install using:\n"
printf "lando drush site-install standard --db-url='mysql://[db_user]:[db_pass]@localhost/[db_name]' --site-name=Example\n\n"
printf "Get the lando details from: lando info\nShould be:\n"
printf "lando drush site-install standard --db-url='mysql://drupal8:drupal8@database/drupal8' --site-name=Example\n\n"
