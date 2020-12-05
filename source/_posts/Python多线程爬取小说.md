---
title: Python多线程爬取小说
date: 2020-04-08 16:08:24
categories:
  - 编程语言
  - Python
tags:
  - Python
  - 爬虫
  - 多线程
abbrlink: fa40ec29
---
\* 爬取网站已转移

```py
from concurrent.futures import ThreadPoolExecutor
from bs4 import BeautifulSoup
import requests
import random
import time
import os
import re

# Host = 'https://www.biquke.com/bq/37/37868/'
Host = 'https://www.biquke.com/bq/75/75429/'

header = [
    {'User-Agent': 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 '
                   '(KHTML, like Gecko) Chrome/46.0.2490.76 Mobile Safari/537.36'},
    {'User-Agent': 'Mozilla/5.0 (Windows; U; Windows NT 6.1; en-us) AppleWebKit/534.50 '
                   '(KHTML, like Gecko) Version/5.1 Safari/534.50'},
    {'User-Agent': 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0; Trident/4.0)'},
    {'User-Agent': 'Mozilla/5.0 (Windows NT 6.1; rv:2.0.1) Gecko/20100101 Firefox/4.0.1'},
    {'User-Agent': 'Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; 360SE)'}
]
name = ''


def geturl(url, page):
    repeat = 0
    while True:
        try:
            req = requests.get(Host + url, headers=header[random.randint(0, 4)], timeout=200)
            req.close()
            result = req.content
            result = BeautifulSoup(result, "html.parser")
            title = result.find('h1').getText()
            result = result.find('div', {'id': 'content'}).getText()
            title = re.sub('[\\/:*?"<>|\r\n]+', '', title)
            print(title)
            with open('./%s/%03d' % (name, page) + ' - ' + title + '.txt', 'w', encoding='utf-8') as file:
                file.write(result)
            break
        except IOError:
            print('第%d次重连' % repeat)
            repeat += 1
            if repeat > 10:
                print(Host + url + '爬取失败！')
                break
            continue


def get_menu():
    req = requests.get(Host, headers=header[random.randint(0, 4)])
    html = req.content
    html = BeautifulSoup(html, "html.parser")
    global name
    name = str(html.find('h1'))[4:-5]
    if not os.path.exists(name):
        os.makedirs(name)
    html = html.find_all('dd')
    with ThreadPoolExecutor(1024) as pool:
        url = []
        index = []
        for i, j in enumerate(html):
            url.append(j.find('a')['href'])
            index.append(i)
        pool.map(geturl, url, index)


if __name__ == '__main__':
    start = time.time()
    get_menu()
    print("耗时%s" % (time.time() - start))
```