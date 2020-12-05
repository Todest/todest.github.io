---
title: 搭建WordPress服务器
date: 2020-04-08 16:08:24
categories:
  - Web
  - 博客
tags:
  - Linux
  - WordPress
abbrlink: 34b16289
---
&emsp;&emsp;WordPress是一个开源的博客平台，可以很方便的进行博客写作，搭建WordPress首先需要你有一个属于自己的服务器，服务器空间则更加方便（因为不需要自己安装各种前置软件），当然还是推荐买一个阿里云或腾讯云的学生机服务器。
<!--more-->
**安装 Apache**
```bash
sudo apt update # 首先还是先更新下软件包源
sudo apt install apache2
sudo apt install # 当然再顺便安装下强大的vim编辑器
```
**安装 MySQL**
```bash
sudo apt install mysql-server mysql-client
```
**安装 PHP**
```bash
sudo apt install php7.0 
sudo apt install php7.0-mysql
```
**重启服务**
```bash
sudo service apache2 restart 
sudo service mysql restart
```
**安装 phpmyadmin**
非必须安装，不过安装下方便直接操作数据库，安装时记得选择apache。
```bash
sudo apt-get install phpmyadmin
ln -s /etc/phpmyadmin/apache.conf /etc/apache2/conf-available/phpmyadmin.conf
sudo service apache2 restart
sudo a2enconf phpmyadmin
```
启用Apache mod_rewrite模块。
```bash
sudo a2enmod rewrite
sudo service apache2 restart
```
**初始化数据库**
```bash
sudo mysql -u root -p 
Enter Password: 密码（密码输入不可见)
mysql>CREATE DATABASE wordpress;
mysql>GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost';
mysql>FLUSH PRIVILEGES;
mysql>exit
sudo service mysql restart
```
**配置WordPress**
下载并解压后将wordpress目录下所有文件复制到/var/www/html
```bash
wget https://cn.wordpress.org/latest-zh_CN.tar.gz
tar zxvf latest-zh_CN.tar.gz
cp -r wordpress/* /var/www/html
```
接下来就可以访问服务器ip进行最后的配置了。
另外，访问 http://ip/phpmyadmin 可以访问 phpmyadmin。