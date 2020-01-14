# XDebug Example using Lando and Drupal 8

## Lando Local Development

### First Time Setup

- Prepare the repository:

  ```
  git clone git@github.com:YesCT/xdebug-lando.git
  cd xdebug-lando
  ```

- [Install Lando](https://docs.devwithlando.io/started.html)

  - If you need to be on an older version of Lando for some other project, use that. If you don't need to be on an older version, get the latest version.

  - Let Lando control your version of Docker. If you don't already have Docker installed, let Lando install it. If you do, check that your version of Docker is supported by the version of Lando that you install. Once you have the right version of Docker installed, turn off the option to update it automatically. You'll update Docker by installing a later version of Lando to keep them in sync.

### Local Development

- Start Lando:

  ```
  lando start
  ```

- Composer install in lando to remove variations caused by different php versions.

  ```
  lando composer install
  ```

- In a browser, view the site. Local urls will be listed after running `lando start`, such as:

  ```
  http://d88.lndo.site
  ```

  If you miss the display of the urls as additional information scrolls past, you can see them any time with:

  ```
  lando info
  ```

- If you want to work offline, you may need to update your hosts file:

  ```
  127.0.0.1 http://d88.lndo.site
  ```

- Or, if your lando is on a remote server, replace ip with server ip:

  ```
  10.201.1.101 http://d88.lndo.site
  ```

- You can use `lando drush` and `lando composer` from the host machine.

### Local Lando Settings

Copy `.example.lando.local.yml` to `.lando.local.yml`

#### Xdebug

After copying the example file,
to turn xdebug on, change xdebug from false to true in `.lando.local.yml`

Rebuild the appserver: `lando rebuild -s appserver`.

If need custom php.ini settings,
copy `.example.lando.php.ini` to `.lando.php.ini` and comment, uncomment, or
add lines in `.lando.php.ini`.

If need env variables,
copy `.example.lando.local.env` to `.lando.local.env` and comment, uncomment, or
add lines in `.lando.local.env`
