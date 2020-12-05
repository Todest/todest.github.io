---
title: Minecraft Python绘图
date: 2020-04-08 16:08:24
categories:
  - 编程语言
  - Python
tags:
  - Python
  - Minecraft
abbrlink: 566b0d1e
---
<font color="red">前置条件：</font>
> 模组: RaspberryJamMod 
> Python库: mcpi
> 游戏版本: 1.8 ~ 1.12.2

<!--more-->
```py
from mcpi import minecraft, block
from colorsys import rgb_to_hsv
from PIL import Image
import numpy

colors = dict((
    ((255, 255, 255), "0"), # white 白色
    ((249, 255, 254), "0"),  # white 白色
    ((249, 128, 29), "1"),  # orange 橙色
    ((199, 78, 189), "2"),  # magenta 品红色
    ((58, 179, 218), "3"),  # light_blue 淡蓝色
    ((254, 216, 61), "4"),  # yellow 黄色
    ((128, 199, 31), "5"),  # lime 黄绿色
    ((243, 139, 170), "6"),  # pink 粉红色
    ((71, 79, 82), "7"),  # gray 灰色
    ((157, 157, 151), "8"),  # light_gray 淡灰色
    ((22, 156, 156), "9"),  # cyan 青色
    ((137, 50, 184), "10"),  # purple 紫色
    ((60, 68, 170), "11"),  # blue 蓝色
    ((131, 84, 50), "12"),  # brown 棕色
    ((94, 124, 22), "13"),  # green 绿色
    ((176, 46, 38), "14"),  # red 红色
    ((29, 29, 33), "15"),  # black 黑色
    ((0, 0, 0), "15"),  # black 黑色

))


def to_hsv(color):
    return rgb_to_hsv(*[x / 255.0 for x in color])


def color_dist(c1, c2):
    return sum((a - b) ** 2 for a, b in zip(to_hsv(c1), to_hsv(c2)))


def min_color_diff(color_to_match, colors):
    return min((color_dist(color_to_match, test), colors[test]) for test in colors)


# 此函数暂时无用
def get_player_direction(rotation):
    rec = [-90, 0, 90, 180]  # +x, +z, -x, -z
    if abs(rotation) < 45:
        return '+z'
    elif abs(rotation) > 145:
        return '-z'
    elif rotation < 0:
        return '+x'
    else:
        return '-x'


mc = minecraft.Minecraft.create()
im = Image.open('6.jpg')
im = im.convert('RGB')
list = numpy.array(im)
size = list.shape
start = mc.player.getTilePos()
for i in range(size[0]):
    for j in range(size[1]):
        item = min_color_diff(list[i][j], colors)
        mc.setBlock(start.x + size[0] - i, start.y, start.z + j, 251, int(item[1]))
```
<font color="red">效果如下:</font>
![皮卡丘](https://cdn.file.todest.cn/pic/2019093001.png)
![晚安](https://cdn.file.todest.cn/pic/2019093002.png)