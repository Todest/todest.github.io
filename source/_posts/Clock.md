---
title: Clock
date: 2020-04-08 16:08:24
categories:
  - 编程语言
  - C++
tags: GUI
abbrlink: 7fba9196
---
> C++编写的Clocl GUI

```cpp
#include <graphics.h>
#include <cstdio>
#include <math.h>
#include <time.h>
int posx = 240, posy = 240, R = 170;
char str[24];
int point(int r, int rad, bool xy)//获取偏移点坐标
{
	double x = posx, y = posy;
	if (xy)return (int)(y - r * cos(rad* PI / 180));
	return (int)(x + r * sin(rad* PI / 180));
}
void loop()//更新
{
	setbkcolor(EGERGB(30, 30, 30));
	setlinewidth(3); setcolor(EGERGB(64, 0, 128));
	circle(posx, posy, R + 16); circle(posx, posy, R + 14); circle(posx, posy, R + 12); circle(posx, posy, R + 10);
	setlinewidth(1); setcolor(EGERGB(128, 128, 128));
	for (int i = 0; i < 60; i++)//刻度
	{
		if (i % 5)line(point(R + 2, i * 6, 0), point(R + 2, i * 6, 1), point(R + 9, i * 6, 0), point(R + 9, i * 6, 1));
		else line(point(R - 4, i * 6, 0), point(R - 4, i * 6, 1), point(R + 9, i * 6, 0), point(R + 9, i * 6, 1));
	}
	setcolor(EGERGB(0xFF, 0xFF, 0xFF)); setfont(18, 0, "宋体");
	for (int i = 1; i <= 12; i++)//读数
	{
		sprintf(str, "%d", i);
		outtextrect(point(R - 8, i * 30, 0) - 5, point(R - 8, i * 30, 1) - 5, point(R - 8, i * 30, 0) + 5, point(R - 8, i * 30, 1) + 5, str);
	}
	time_t t_now; time(&t_now); tm* t = localtime(&t_now);//获取系统时间
	sprintf(str, "%04d/%02d/%02d %02d:%02d:%02d", t->tm_year + 1900, t->tm_mon + 1, t->tm_mday, t->tm_hour, t->tm_min, t->tm_sec);
	setlinewidth(8); setcolor(BLUE);
	line(posx, posy, point(R - 80, t->tm_hour % 12 * 30, 0), point(R - 80, t->tm_hour % 12 * 30 + t->tm_min / 12, 1));//时针
	setlinewidth(4); setcolor(RED);
	line(posx, posy, point(R - 40, t->tm_min * 6, 0), point(R - 40, t->tm_min * 6, 1));//分针
	setlinewidth(2); setcolor(YELLOW);
	line(posx, posy, point(R - 10, t->tm_sec * 6, 0), point(R - 10, t->tm_sec * 6, 1));//秒针
	setfillcolor(YELLOW); fillellipse(posx, posy, 5, 5);
	setcolor(GREEN); setfont(30, 0, "宋体"); outtextxy(95, 500, str);//数字时钟
}
int main()
{
	initgraph(480, 640);//初始化画布
	for (; !kbhit(); delay_fps(60))
	{
		cleardevice();//清除画布
		loop();//更新
	}
	closegraph();//关闭画布
	return 0;
}
```