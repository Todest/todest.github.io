---
title: Nginx反向代理frp缓存加速
date: 2019-07-27 16:51:42
categories:
  - 计算机网络
tags:
  - nginx
  - frp
abbrlink: 37646cf8
---
使用nginx的反向代理缓存，将frp用户的http和https静态资源缓存到服务器本地，从而减少frp网络资源请求，直接加速静态资源访问。
>新建缓存目录

```bash
mkdir -pv /home/nginx/cache
chmod -R 777 /home/nginx/cache
```
>修改 nginx.conf

在 http{} 里添加
```nginx
proxy_cache_path /home/nginx/cache levels=1:2 keys_zone=frp_cache:50m max_size=5g inactive=3d;
```
在 server{} 里添加
```nginx
location / {
    proxy_pass http://127.0.0.1:8080;
    proxy_redirect http://$host/ http://$http_host/;
    proxy_set_header X-Real-IP $remote_addr;
    proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
    proxy_set_header Host $host;
}
location ~* \.(jpg|jpeg|gif|png|svg|css|scss|js|ico|xml|woff|woff2|ttf|otf|eot)$ {
    proxy_pass http://127.0.0.1:8080;
    proxy_redirect http://$host/ http://$http_host/;
    proxy_set_header X-Real-IP $remote_addr;
    proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
    proxy_set_header Host $host;
    proxy_cache frp_cache;
    proxy_cache_key $uri$is_args$args;
    proxy_cache_valid 200 206 301 302 304 3d;
    expires 3d;
}
```
