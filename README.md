# Getting started with Wordpress

This project conatins [Wordpress](https://wordpress.org/) and is a template for running wordpress within Codesphere.

### Setup wordpress

1. Setup a [MySQL Database](https://www.mysql.com/). Wordpress needs a MySQL to run.<br>
   Possible options where to get a MySQL database:
   - Managed:
     - AWS RDS: https://aws.amazon.com/rds/mysql/
     - GCP CloudSQL for MYSQL: https://cloud.google.com/sql/docs/mysql
     - Azure Database for MySQL: https://azure.microsoft.com/en-us/services/mysql/
   - Self-Hosted
     - Docker: https://hub.docker.com/_/mysql
2. Configure wordpress.<br>
   This project contains wordpress in [./html](./html).
   1. Open the wordpress config file in [./wp-config.php](./wp-config.php)
   2. Set the Database specific values like database name, username, password, etc..
3. Start webserver (nginx) by running `./start.sh`

### Operations

Stop Webserver: `./stop.sh`
Restart Webserver: `./restart.sh`

Restart PHP FPM Service: `killall php-fpm7.4 && rm /tmp/run/php7.4-fpm.pid && ./restart.sh`

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
