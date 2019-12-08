## php 7.1 -> 7.3 / CentOS 7
```bash
sudo yum install epel-release yum-utils
sudo yum install http://rpms.remirepo.net/enterprise/remi-release-7.rpm
sudo yum-config-manager --enable remi-php73
sudo yum remove php71*
sudo yum install php php-common php-opcache php-mcrypt php-cli php-gd php-curl php-mysqlnd
sudo yum install php-intl php-bcmath php-mbstring php-apcu php-igbinary php-imagick php-memcached 
sudo yum install php-soap php-xml php-gmp php-zip
sudo yum install composer
```

### php.ini: 
```
short_open_tag = On
session.save_path {path}
```

#### session path & restart
```bash
sudo chmod 777 {path}
sudo systemctl restart httpd
```

### bootstrap.php
```php
<?php
error_reporting(E_ALL ^ E_DEPRECATED);
ini_set('short_open_tag', 'On');
```
