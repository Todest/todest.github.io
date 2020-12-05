---
title: Python绘制校庆宣传画
date: 2020-04-08 16:08:24
categories:
  - 编程语言
  - Python
tags:
  - Python
  - turtle
abbrlink: 9ae2a58f
---
> Python作业，用turtle绘制校庆宣传画。

```py
import turtle


def draw_line(angle, length):
    turtle.pendown()
    turtle.seth(angle)
    turtle.forward(length)


def locate(x, y, extend=None):
    startx, starty = -100, 200
    if extend:
        extend.penup()
        extend.goto(startx + x, starty - y)
        extend.pendown()
    else:
        turtle.penup()
        turtle.goto(startx + x, starty - y)
        turtle.pendown()


def draw_xq():
    turtle.pencolor('white')
    turtle.pensize(1)
    turtle.penup()
    locate(96, 1)
    draw_line(270, 15)
    locate(120, 28)
    turtle.fillcolor('white')
    turtle.begin_fill()
    turtle.seth(120)
    turtle.circle(27, 120)
    draw_line(180, 53)
    draw_line(270, 155)
    draw_line(0, 150)
    draw_line(90, 155)
    draw_line(180, 53)
    turtle.end_fill()
    locate(10, 53)
    turtle.pensize(6)
    turtle.pencolor('red')
    draw_line(0, 170)
    locate(20, 82)
    turtle.pensize(8)
    draw_line(0, 30)
    locate(170, 82)
    draw_line(180, 30)
    locate(96, 185)
    turtle.pensize(50)
    draw_line(90, 70)
    turtle.pensize(12)
    turtle.pencolor('white')
    locate(60, 125)
    draw_line(0, 70)
    locate(60, 178)
    draw_line(0, 70)
    turtle.pensize(1)
    locate(10, 188)
    turtle.begin_fill()
    draw_line(270, 18)
    draw_line(240, 24)
    draw_line(0, 56)
    draw_line(240, 9)
    draw_line(0, 88)
    draw_line(120, 9)
    draw_line(0, 56)
    draw_line(120, 24)
    draw_line(90, 18)
    draw_line(180, 169)
    turtle.end_fill()
    turtle.pensize(4)
    turtle.pencolor('red')
    locate(8, 208)
    draw_line(0, 58)
    draw_line(60, 9)
    draw_line(0, 53)
    draw_line(300, 9)
    draw_line(0, 58)
    turtle.hideturtle()
    font = turtle.Turtle()
    locate(43, 265, font)
    font.pencolor('white')
    font.write('1909-2019', font=('Aria', 16, 'bold'))
    font.hideturtle()


def draw_word():
    font = turtle.Turtle()
    locate(-186, 350, font)
    font.pencolor('white')
    font.write('河南理工大学建校110周年', font=('Aria', 36, 'bold'))
    locate(-180, 380, font)
    font.write('HENAN POLYTECHNIC UNIVERSITY 110TH ANNIVERSARY', font=('Aria', 16, 'bold'))
    font.color(200/255, 166/255, 92/255)
    locate(300, 100, font)
    font.write('好学力行', font=('楷体', 24, 'bold'))
    locate(-250, 200, font)
    font.write('明德任责', font=('楷体', 24, 'bold'))
    font.hideturtle()


def main():
    width, height = 800, 600
    turtle.screensize(bg='red')
    turtle.setup(width, height, 400, 100)
    turtle.speed(10)
    draw_xq()
    draw_word()
    turtle.hideturtle()
    turtle.done()


if __name__ == '__main__':
    main()
```

**效果如下：**
![](https://cdn.file.todest.cn/pic/2019101401.jpg)