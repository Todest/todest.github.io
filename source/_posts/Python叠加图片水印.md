---
title: Python叠加图片水印
date: 2019-03-29 17:11:09
categories:
  - 编程语言
  - Python
tags:
  - PIL
abbrlink: 902d70b2
---
# 代码
```py
from PIL import Image, ImageFont, ImageDraw
import os


def fun(img, factor=1):
    img = img.convert('RGBA')
    img_blender = Image.new('RGBA', img.size, (0, 0, 0, 0))
    img = Image.blend(img_blender, img, factor)
    img = img.resize((700, 700))
    return img


rootdir = 'logo'
savedir = 'save'
lists = os.listdir(rootdir)
for i in range(0, len(lists)):
    path = os.path.join(rootdir, lists[i])
    im = Image.open('logo.jpg')
    im1 = Image.open(path)
    im1 = fun(im1)
    xy = im1.size
    im.paste(im1, (960-xy[0]/2, 400-xy[1]/2), mask=im1)
    draw = ImageDraw.Draw(im)
    textsize = 24
    font = ImageFont.truetype("C:\Windows\Fonts\Arial.ttf", textsize)
    length = draw.textsize(lists[i].split('.')[0], font)
    while True:
        font = ImageFont.truetype("C:\Windows\Fonts\Arial.ttf", textsize)
        length = draw.textsize(lists[i].split('.')[0], font)
        if (length[0] <= 1536) and (textsize <= 96):
            textsize += 1
        else:
            textsize -= 1
            font = ImageFont.truetype("C:\Windows\Fonts\Arial.ttf", textsize)
            length = draw.textsize(lists[i].split('.')[0], font)
            break
    draw.text((960-length[0]/2, 860-length[1]/2), lists[i].split('.')[0], (255, 255, 255), font=font)
    im.save(os.path.join(savedir, lists[i]), 'jpeg')
    print(i)
```