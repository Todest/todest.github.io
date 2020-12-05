---
title: URP教务管理系统爬取成绩
date: 2019-07-06 21:53:46
categories:
  - 编程语言
  - Python
tags: Python
abbrlink: 7c4a6922
---
# 页面
**学期成绩**: `http://218.196.240.97/bxqcjcxAction.do`
**历年成绩**: `http://218.196.240.97/gradeLnAllAction.do?oper=qbinfo`
**方案成绩**: `http://218.196.240.97/gradeLnAllAction.do?oper=fainfo`
**打印成绩**: `http://218.196.240.27/reportFiles/student/cj_zwcjd_all.jsp`
<!--more-->
# 过程
>构建header

```py
headers = {
    'Accept': 'image/gif, image/jpeg, image/pjpeg,'
              'application/x-ms-application, application/xaml+xml, application/x-ms-xbap, */*',
    'Accept-Encoding': 'gzip, deflate',
    'Accept-Language': 'zh-Hans-CN, zh-Hans;q=0.8, en-US;q=0.5,en;q=0.3',
    'Cache-Control': 'no-cache',
    'Connection': 'Keep-Alive',
    'Content-Type': 'application/x-www-form-urlencoded',
    'Referer': 'http://218.196.240.97/loginAction.do',
    'User-Agent': 'Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 10.0; WOW64; Trident/7.0;'
                  '.NET4.0C; .NET4.0E; .NET CLR 2.0.50727; .NET CLR 3.0.30729; .NET CLR 3.5.30729)'
}
```
>构建表单

```py
form = {
    'zjh': '',
    'mm': '',
    'v_yzm': '',
}
```
>获取验证码

```py
session = requests.session()
req = session.get(host + '/validateCodeAction.do')
cookie = req.headers['Set-Cookie']
captcha = open('tmp.jpg', 'wb')
captcha.write(req.content)
captcha.close()
```
>登录

```py
form['zjh'] = form['mm'] = input()
form['v_yzm'] = input()
os.remove('tmp.jpg')
req = session.post(host + '/loginAction.do', data=form, headers=headers)
```
>存为html

```py
req = session.get(host + '/gradeLnAllAction.do?oper=qbinfo')
soup = BeautifulSoup(req.content,'lxml')
soup = soup.decode('utf-8')
soup = soup.replace('/css/newcss/','http://218.196.240.97/css/newcss/')
fb = open('index.html','wb')
fb.write(soup.encode('utf-8'))
fb.close()
```

# 完整代码
```py
import requests,os
from PIL import Image
from bs4 import BeautifulSoup

host = 'http://218.196.240.97'

headers = {
    'Accept': 'image/gif, image/jpeg, image/pjpeg,'
              'application/x-ms-application, application/xaml+xml, application/x-ms-xbap, */*',
    'Accept-Encoding': 'gzip, deflate',
    'Accept-Language': 'zh-Hans-CN, zh-Hans;q=0.8, en-US;q=0.5,en;q=0.3',
    'Cache-Control': 'no-cache',
    'Connection': 'Keep-Alive',
    'Content-Type': 'application/x-www-form-urlencoded',
    'Referer': 'http://218.196.240.97/loginAction.do',
    'User-Agent': 'Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 10.0; WOW64; Trident/7.0;'
                  '.NET4.0C; .NET4.0E; .NET CLR 2.0.50727; .NET CLR 3.0.30729; .NET CLR 3.5.30729)'
}

form = {
    'zjh': '',
    'mm': '',
    'v_yzm': '',
}

session = requests.session()
req = session.get(host + '/validateCodeAction.do')
cookie = req.headers['Set-Cookie']
captcha = open('tmp.jpg', 'wb')
captcha.write(req.content)
captcha.close()

# form['zjh'] = input()
# form['mm'] = input()
form['zjh'] = form['mm'] = input()
form['v_yzm'] = input()
os.remove('tmp.jpg')
req = session.post(host + '/loginAction.do', data=form, headers=headers)

req = session.get(host + '/gradeLnAllAction.do?oper=qbinfo')
soup = BeautifulSoup(req.content,'lxml')
soup = soup.decode('utf-8')
soup = soup.replace('/css/newcss/','http://218.196.240.97/css/newcss/')
fb = open('index.html','wb')
fb.write(soup.encode('utf-8'))
fb.close()
```