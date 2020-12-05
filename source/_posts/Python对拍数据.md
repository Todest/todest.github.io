---
title: Python对拍数据
date: 2020-04-08 16:08:24
categories:
  - 编程语言
  - Python
tags:
  - Python
  - 算法
abbrlink: e6c29894
---
> Version1.0使用文件操作不断将随机测试数据写入code/0.in，通过管道输入到两个可执行文件，然后获取输出进行比较，直到找到不同的输出时停止，此时0.in内的内容即为结果。

<!--more-->
```py
import os
import platform


def generate():
    f = open('./code/0.in', 'w')
    """此处写生成测试数据函数，注释内容为示例
    T = randint(1, 1000)
    f.writelines('%d\n' % T)
    lists = []
        for i in range(T):
        while True:
            x = randint(1, 1e4)
            y = randint(1, 1e4)
            if [x, y] not in lists:
                lists.append([x, y])
                f.writelines('%d %d\n' % (x, y))
                break
            else:
                continue
    """
    f.close()


if platform.system() == 'Windows':
    os.system('CHCP 65001')  # Windows先更换CodePage为UTF-8,以防乱码
counts = 1
if not os.path.exists('./code'):
    os.makedirs('code')
while True:
    if os.path.exists('./code/0.in'):
        os.remove('./code/0.in')
    generate()
    if platform.system() == 'Windows':  # Windows系统可执行文件预先放置
        ans1 = os.popen('type .\\code\\0.in|.\\code\\1.exe')
        ans2 = os.popen('type .\\code\\0.in|.\\code\\2.exe')
    else:   # Linux系统可执行文件预先放置
        ans1 = os.popen('cat code/0.in | code/1')
        ans2 = os.popen('cat code/0.in | code/2')
    out1 = ans1.read()
    out2 = ans2.read()
    if out1 == out2:
        print('第', counts, '次尝试: ', end='')
        print(out1)
    else:
        break
    counts = counts + 1
```