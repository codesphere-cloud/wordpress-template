# Getting started with Wordpress

This project conatins [Wordpress](https://wordpress.org/) and is a template for running wordpress within Codesphere.

### Setup wordpress

1. Setup a [MySQL Database](https://www.mysql.com/) in [Codesphere](https://docs.codesphere.com/tutorials/setting-up-woocommerce#create-a-new-database-skip-if-a-hosted-database-is-already-available) <br>
    Wordpress needs a MySQL to run.
2. Configure wordpress.<br>
   This project contains wordpress in [./html](./html).
   1. Open the wordpress config file in [./wp-config.php](./wp-config.php)
   2. Set the Database specific values like database name, username, password, etc..
3. Start webserver by starting the run stage of the pipline in codesphere. [See](https://docs.codesphere.com/tutorials/setting-up-woocommerce#run-your-application).

### Troubleshooting

#### Another instance of FPM is already running
```
[11-Aug-2022 07:26:32] ERROR: Another FPM instance seems to already listen on /tmp/run/php-fpm.sock
[11-Aug-2022 07:26:32] ERROR: FPM initialization failed
```

Another instance is already running and is not properly killed by the start script.
The process can be manually killed by running `killall php-fpm7.4`. 



#### Disclaimer

Everything in [./html](./html) is downloaded from [https://wordpress.org/download/](https://wordpress.org/download/).
See the [Lincense](./html/license.txt) for detailed information about the copyright and license for Wordpress files.
