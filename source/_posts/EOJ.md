---
title: EOJ 搭建教程
date: 2019-06-18 10:53:33
categories:
  - Web
  - OJ
tags:
  - EOJ
abbrlink: f29422fd
---
# EOJ
## 克隆EOJ
```bash
git clone https://github.com/ultmaster/eoj3.git
cd eoj3
```
然后执行
```bash
sh install.sh
```
## 安装依赖
```bash
pip3 install -r requirements.txt
```
如果出现以下情况
`Command "python setup.py egg_info" failed with error code 1 in /tmp/pip-build-twvou5gt/msqlclient/`
执行以下命令
```bash
sudo apt-get install libmysqld-dev
```
<!--more-->
## 安装npm
```bash
sudo apt-get install npm
cd static
npm install
cd ..
```
## 创建超级用户
```bash
pip install django
python3 manage.py createsuperuser
```
## 迁移
```bash
python3 manage.py collectstatic
python3 manage.py makemigrations
python3 manage.py migrate
```
## 运行前端
运行前先安装一下`redis-server`。
```bash
sudo apt-get install redis-server
```
此时，可以运行server了。
```bash
python3 manage.py runserver 0.0.0.0:80
```
此时访问前端，发现页面布局有问题，是因为缺少一个 css 文件，执行下面命令即可。
```bash
wget --no-check-certificate -P ./static/css https://acm.ecnu.edu.cn/static/css/app.min.css
```
# Ejudge
## 克隆Ejudge
随便找个目录，进行以下操作。
```bash
git clone https://github.com/ultmaster/ejudge.git
```
## 初始化
```bash
cd ejudge
sh init.sh
```
## 安装docker
```bash
sudo apt-get install -y docker.io
sudo apt-get install systemctl
systemctl start docker
systemctl enable docker
```
## 搭建镜像
修改`ejudge/run/defaultspj/LANG`,将`LANG`文件的回车去掉。
```bash
sudo docker build .
```
## 运行容器
```bash
sudo docker run -d -p 5000:5000 -v /path/to/your/run/:/ejudge/run <imageName>
```
`/path/to/your/run/:/ejudge/run`要修改成自己的`ejudge/run`的路径。
<imageName>可以运行`docker images`进行查看，也可以是`<image ID>`。
此时登录EOJ，进入后台->Servers，点击Add Server。
```nohighlight
名字: 随便
IP：Address: 127.0.0.1
端口号: 5000
秘钥: naive
```
点击确定，并把这个Server设为Enable。
# 判题
```bash
python3 manage.py runserver 0.0.0.0:80 & python3 manage.py qcluster
```
# 其他
发现非superuser查看题目显示`EOJ is closed`,此时打开`utils/site_settings.py`，找到` is_site_closed`函数,把`return True`改为`return False`即可。
发现一个问题,服务器重启后题目要重新发布，否则无法判题。
# 后记
**以上，EOJ搭建完毕，后续可能有一些其他的小问题，欢迎留言。**