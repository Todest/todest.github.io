---
title: Turtle绘制字体
date: 2020-04-08 16:08:24
categories:
  - 编程语言
  - Python
tags:
  - Python
  - turtle
abbrlink: 50bbd1a0
---
今天闲着没事，就用python的turtle库绘制了一下自己的名字（其实是老师留的作业）。
咳咳，言归正传，我先网上选了个好看又好画的字体，于是保存下载画图打开，这样我们就有了每个笔画的坐标，接下来就开始操作了（嘻嘻）。

<!--more-->
```py
from turtle import *
startx, starty = -300, 300
def locate(x, y):
    penup()
    goto(startx + x, starty - y)
    pendown()

def draw(angle, lenth):
    seth(angle)
    forward(lenth)

def main():
    pensize(6)
    speed(5)
    pencolor("red")
    # G
    locate(222, 77)
    draw(180, 80)
    draw(270, 130)
    draw(0, 60)
    locate(164, 126)
    draw(0, 64)
    locate(214, 126)
    draw(270, 86)
    # Y
    locate(264, 74)
    draw(270, 56)
    locate(340, 74)
    draw(270, 56)
    draw(180, 44)
    draw(270, 84)
    # H
    locate(384, 74)
    draw(270, 140)
    locate(400, 128)
    draw(0, 48)
    locate(460, 74)
    draw(270, 140)
    # 郭
    locate(78, 285)
    draw(270, 20)
    locate(40, 305)
    draw(0, 80)
    locate(50, 325)
    draw(270, 25)
    locate(50, 325)
    draw(0, 60)
    draw(270, 25)
    locate(50, 350)
    draw(0, 60)
    locate(46, 364)
    draw(0, 60)
    draw(270, 20)
    draw(180, 25)
    draw(270, 70)
    draw(180, 30)
    locate(38, 402)
    draw(0, 80)
    locate(130, 304)
    draw(270, 155)
    locate(130, 304)
    draw(0, 42)
    draw(270, 46)
    draw(180, 30)
    draw(0, 30)
    draw(270, 60)
    draw(180, 30)
    # 永
    locate(270, 295)
    draw(0, 46)
    locate(250, 325)
    draw(0, 54)
    draw(270, 128)
    draw(180, 38)
    locate(232, 356)
    draw(0, 38)
    draw(270, 60)
    draw(180, 38)
    locate(370, 356)
    draw(180, 38)
    draw(270, 60)
    draw(0, 38)
    # 航
    locate(438, 286)
    draw(270, 24)
    locate(428, 312)
    draw(270, 140)
    draw(180, 18)
    locate(428, 312)
    draw(0, 42)
    draw(270, 140)
    draw(180, 18)
    locate(446, 328)
    draw(270, 20)
    locate(414, 363)
    draw(0, 56)
    locate(446, 383)
    draw(270, 34)
    locate(515, 286)
    draw(270, 24)
    locate(478, 310)
    draw(0, 80)
    locate(498, 342)
    draw(270, 108)
    draw(180, 20)
    locate(498, 342)
    draw(0, 42)
    draw(270, 106)
    draw(0, 20)
    hideturtle()
    done()

if __name__ == "__main__":
    main()
```
面重点来了，字不重要，看图！！！
![](https://cdn.file.todest.cn/pic/20200511.png)