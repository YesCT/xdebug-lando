#!/usr/bin/env bash

# Post-start actions.
# Install Drupal composer packages.
cd /app

composer install --no-suggest --no-interaction --no-progress

# DB import instructions
printf "\n\n*****************\n"
printf "Import db by running:\n"
printf "lando db-import database.sql.gz\n\n"

# Install instructions
printf "\n\n*****************\n"
printf "Or install using:\n"
printf "lando drush site-install standard --db-url='mysql://[db_user]:[db_pass]@localhost/[db_name]' --site-name=Example\n\n"
