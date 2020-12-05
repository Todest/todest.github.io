---
title: 五子棋
date: 2020-04-08 16:08:24
categories:
  - 编程语言
  - C++
mathjax: true
tags: GUI
abbrlink: fc33752b
---
> C++课程设计作业，包含人工智障$AI$

<!--more-->
```cpp
#include<graphics.h>
int pos[20][20];//	1●		-1○		0×
int black[20][20], white[20][20];
int dir[4][2] = { {-1,-1},{-1,0},{-1,1},{0,-1} };
bool key;
void End(int n)
{
	setfont(80, 0, "宋体");
	if (n == 1)xyprintf(240, 245, "黑方获胜");
	else xyprintf(240, 245, "白方获胜");
	return;
}
bool Checker()
{
	setcolor(EGERGB(255, 0, 0));
	for (int i = 1; i < 12; i++)
	{
		for (int j = 1; j < 12; j++)
		{
			if (pos[i][j])
			{
				bool flag = true;
				for (int p = 0; p < 5; p++)
					if (pos[i][j] != pos[i][j + p])
					{
						flag = false;
						break;
					}
				if (flag)
				{
					line(i * 40 + 80, j * 40, i * 40 + 80, (j + 4) * 40);
					End(pos[i][j]);
					return true;
				}
				flag = true;
				for (int p = 0; p < 5; p++)
					if (pos[i][j] != pos[i + p][j + p])
					{
						flag = false;
						break;
					}
				if (flag)
				{
					line(i * 40 + 80, j * 40, (i + 4) * 40 + 80, (j + 4) * 40);
					End(pos[i][j]);
					return true;
				}
				flag = true;
				for (int p = 0; p < 5; p++)
					if (pos[i][j] != pos[i + p][j])
					{
						flag = false;
						break;
					}
				if (flag)
				{
					line(i * 40 + 80, j * 40, (i + 4) * 40 + 80, j * 40);
					End(pos[i][j]);
					return true;
				}
			}
		}
	}
	for (int i = 5; i <= 15; i++)
	{
		for (int j = 1; j < 12; j++)
		{
			if (pos[i][j])
			{
				bool flag = true;
				for (int p = 0; p < 5; p++)
					if (pos[i][j] != pos[i - p][j + p])
					{
						flag = false;
						break;
					}
				if (flag)
				{
					line(i * 40 + 80, j * 40, (i - 4) * 40 + 80, (j + 4) * 40);
					End(pos[i][j]);
					return true;
				}
			}
		}
	}
	return false;
}
void ChessBoard()
{
	setbkcolor(EGERGB(199, 156, 124));
	setcolor(EGERGB(0, 0, 0));
	for (int i = 120; i <= 680; i += 40)
	{
		line(120, i - 80, 680, i - 80);	//X	120-680
		line(i, 40, i, 600);			//Y	40-600
	}
	setfillcolor(EGERGB(0, 0, 0));
	bar(240 - 4, 160 - 4, 240 + 4, 160 + 4);
	bar(240 - 4, 480 - 4, 240 + 4, 480 + 4);
	bar(560 - 4, 160 - 4, 560 + 4, 160 + 4);
	bar(560 - 4, 480 - 4, 560 + 4, 480 + 4);
	bar(400 - 4, 320 - 4, 400 + 4, 320 + 4);
	setfont(10, 0, "黑体");
	for (int i = 40; i <= 600; i += 40)
	{
		xyprintf(100, i - 3, "%d", (int)(i / 40));
		xyprintf(i + 78, 20, "%c", (char)(i / 40 + 'A' - 1));
	}
	setcolor(EGERGB(255, 0, 0));
	setfont(20, 0, "宋体");
	xyprintf(10, 40, "当前子数");
	setcolor(EGERGB(0, 0, 0));
	xyprintf(10, 70, "黑: 0");
	setcolor(EGERGB(255, 255, 255));
	xyprintf(10, 100, "白: 0");
	return;
}
void Chess(int x, int y, int color)
{
	if (color % 2)
	{
		setcolor(EGERGB(255, 255, 255));
		setfillcolor(EGERGB(255, 255, 255));
		fillellipse(x, y, 15, 15);
	}
	else
	{
		setcolor(EGERGB(0, 0, 0));
		setfillcolor(EGERGB(0, 0, 0));
		fillellipse(x, y, 15, 15);
	}
}
bool Play(int x, int y, int color)//color: 0●  1○
{
	x -= 2;
	if (x >= 1 && x <= 15 && y >= 1 && y <= 15)
	{
		if (!pos[x][y])
		{
			Chess(x * 40 + 80, y * 40, color);
			if (color)pos[x][y] = -1;
			else pos[x][y] = 1;
			return true;
		}
	}
	return false;
}
void Counter(int n)
{
	setfillcolor(EGERGB(199, 156, 124));
	bar(50, 60, 70, 120);
	if (n % 2)
	{
		setcolor(EGERGB(0, 0, 0));
		xyprintf(50, 70, "%d", (n + 1) / 2);
		setcolor(EGERGB(255, 255, 255));
		xyprintf(50, 100, "%d", n / 2);
		bar(0, 140, 100, 180);
		xyprintf(10, 150, "白方执棋");
	}
	else
	{
		setcolor(EGERGB(0, 0, 0));
		xyprintf(50, 70, "%d", n / 2);
		setcolor(EGERGB(255, 255, 255));
		xyprintf(50, 100, "%d", (n + 1) / 2);
		bar(0, 140, 100, 180);
		setcolor(EGERGB(0, 0, 0));
		xyprintf(10, 150, "黑方执棋");
	}
}
bool lian5(int x, int y)
{
	for (int i = 0; i < 4; i++)
	{
		int ans = 0, flag1 = 0, flag2 = 0;
		for (int j = 1; j < 5; j++)
		{
			if (!flag1 && (x + j * dir[i][0] > 0) && (x + j * dir[i][0] < 16) && (y + j * dir[i][1] > 0) && (y + j * dir[i][1] < 16))
			{
				if (pos[x][y] == pos[x + j * dir[i][0]][y + j * dir[i][1]])
					ans++;
				else flag1 = 1;
			}
			if (!flag2 && (x - j * dir[i][0] > 0) && (x - j * dir[i][0] < 16) && (y - j * dir[i][1] > 0) && (y - j * dir[i][1] < 16))
			{
				if (pos[x][y] == pos[x - j * dir[i][0]][y - j * dir[i][1]])
					ans++;
				else flag2 = 1;
			}
		}
		if (ans >= 4)
		{
			if (pos[x][y] == 1)black[x][y] += 100;
			else white[x][y] += 100;
			return true;
		}
	}
	return false;
}
bool live4(int x, int y)
{
	for (int i = 0; i < 4; i++)
	{
		int ans = 0, a = 1, b = 1, flag1 = 0, flag2 = 0;
		for (int j = 1; j < 5; j++)
		{
			if (!flag1 && (x + j * dir[i][0] > 0) && (x + j * dir[i][0] < 16) && (y + j * dir[i][1] > 0) && (y + j * dir[i][1] < 16))
			{
				if (pos[x][y] == pos[x + j * dir[i][0]][y + j * dir[i][1]])
					ans++;
				else if (pos[x + j * dir[i][0]][y + j * dir[i][1]] == 0)
					a = 0, flag1 = 1;
			}
			if (!flag2 && (x - j * dir[i][0] > 0) && (x - j * dir[i][0] < 16) && (y - j * dir[i][1] > 0) && (y - j * dir[i][1] < 16))
			{
				if (pos[x][y] == pos[x - j * dir[i][0]][y - j * dir[i][1]])
					ans++;
				else if (pos[x - j * dir[i][0]][y - j * dir[i][1]] == 0)
					b = 0, flag2 = 1;
			}
		}
		if ((ans >= 3) && !a && !b)
		{
			if (pos[x][y] == 1)black[x][y] += 80;
			else white[x][y] += 80;
			return true;
		}
	}
	return false;
}
bool chong4(int x, int y)
{
	for (int i = 0; i < 4; i++)
	{
		int ans = 0, a = 1, b = 1, flag1 = 0, flag2 = 0;
		for (int j = 1; j < 5; j++)
		{
			if (!flag1 && (x + j * dir[i][0] > 0) && (x + j * dir[i][0] < 16) && (y + j * dir[i][1] > 0) && (y + j * dir[i][1] < 16))
			{
				if (pos[x][y] == pos[x + j * dir[i][0]][y + j * dir[i][1]])
					ans++;
				else if (pos[x + j * dir[i][0]][y + j * dir[i][1]] == 0)
					a = 0, flag1 = 1;
			}
			if (!flag2 && (x - j * dir[i][0] > 0) && (x - j * dir[i][0] < 16) && (y - j * dir[i][1] > 0) && (y - j * dir[i][1] < 16))
			{
				if (pos[x][y] == pos[x - j * dir[i][0]][y - j * dir[i][1]])
					ans++;
				else if (pos[x - j * dir[i][0]][y - j * dir[i][1]] == 0)
					b = 0, flag2 = 1;
			}
		}
		if ((ans >= 3) && (a || b) && (a != b))
		{
			if (pos[x][y] == 1)black[x][y] += 60;
			else white[x][y] += 60;
			return true;
		}
	}
	return false;
}
bool live3(int x, int y)
{
	for (int i = 0; i < 4; i++)
	{
		int ans = 0, a = 1, b = 1, flag1 = 0, flag2 = 0;
		for (int j = 1; j < 4; j++)
		{
			if (!flag1 && (x + j * dir[i][0] > 0) && (x + j * dir[i][0] < 16) && (y + j * dir[i][1] > 0) && (y + j * dir[i][1] < 16))
			{
				if (pos[x][y] == pos[x + j * dir[i][0]][y + j * dir[i][1]])
					ans++;
				else if (pos[x + j * dir[i][0]][y + j * dir[i][1]] == 0)
					a = 0, flag1 = 1;
			}
			if (!flag2 && (x - j * dir[i][0] > 0) && (x - j * dir[i][0] < 16) && (y - j * dir[i][1] > 0) && (y - j * dir[i][1] < 16))
			{
				if (pos[x][y] == pos[x - j * dir[i][0]][y - j * dir[i][1]])
					ans++;
				else if (pos[x - j * dir[i][0]][y - j * dir[i][1]] == 0)
					b = 0, flag2 = 1;
			}
		}
		if ((ans >= 2) && !a && !b)
		{
			if (pos[x][y] == 1)black[x][y] += 70;
			else white[x][y] += 70;
			return true;
		}
	}
	return false;
}
bool death3(int x, int y)
{
	for (int i = 0; i < 4; i++)
	{
		int ans = 0, a = 1, b = 1, flag1 = 0, flag2 = 0;
		for (int j = 1; j < 4; j++)
		{
			if (!flag1 && (x + j * dir[i][0] > 0) && (x + j * dir[i][0] < 16) && (y + j * dir[i][1] > 0) && (y + j * dir[i][1] < 16))
			{
				if (pos[x][y] == pos[x + j * dir[i][0]][y + j * dir[i][1]])
					ans++;
				else if (pos[x + j * dir[i][0]][y + j * dir[i][1]] == 0)
					a = 0, flag1 = 1;
			}
			if (!flag2 && (x - j * dir[i][0] > 0) && (x - j * dir[i][0] < 16) && (y - j * dir[i][1] > 0) && (y - j * dir[i][1] < 16))
			{
				if (pos[x][y] == pos[x - j * dir[i][0]][y - j * dir[i][1]])
					ans++;
				else if (pos[x - j * dir[i][0]][y - j * dir[i][1]] == 0)
					b = 0, flag2 = 1;
			}
		}
		if ((ans >= 2) && (a || b) && (a != b))
		{
			if (pos[x][y] == 1)black[x][y] += 50;
			else white[x][y] += 50;
			return true;
		}
	}
	return false;
}
bool live2(int x, int y)
{
	for (int i = 0; i < 4; i++)
	{
		int ans = 0, a = 1, b = 1, flag1 = 0, flag2 = 0;
		for (int j = 1; j < 3; j++)
		{
			if (!flag1 && (x + j * dir[i][0] > 0) && (x + j * dir[i][0] < 16) && (y + j * dir[i][1] > 0) && (y + j * dir[i][1] < 16))
			{
				if (pos[x][y] == pos[x + j * dir[i][0]][y + j * dir[i][1]])
					ans++;
				else if (pos[x + j * dir[i][0]][y + j * dir[i][1]] == 0)
					a = 0, flag1 = 1;
			}
			if (!flag2 && (x - j * dir[i][0] > 0) && (x - j * dir[i][0] < 16) && (y - j * dir[i][1] > 0) && (y - j * dir[i][1] < 16))
			{
				if (pos[x][y] == pos[x - j * dir[i][0]][y - j * dir[i][1]])
					ans++;
				else if (pos[x - j * dir[i][0]][y - j * dir[i][1]] == 0)
					b = 0, flag2 = 1;
			}
		}
		if ((ans >= 1) && !a && !b)
		{
			if (pos[x][y] == 1)black[x][y] += 40;
			else white[x][y] += 40;
			return true;
		}
	}
	return false;
}
bool death2(int x, int y)
{
	for (int i = 0; i < 4; i++)
	{
		int ans = 0, a = 1, b = 1, flag1 = 0, flag2 = 0;
		for (int j = 1; j < 3; j++)
		{
			if (!flag1 && (x - j * dir[i][0] > 0) && (x - j * dir[i][0] < 16) && (y - j * dir[i][1] > 0) && (y - j * dir[i][1] < 16))
			{
				if (pos[x][y] == pos[x - j * dir[i][0]][y - j * dir[i][1]])
					ans++;
				else if (pos[x - j * dir[i][0]][y - j * dir[i][1]] == 0)
					a = 0, flag1 = 1;
			}
			if (!flag2 && (x - j * dir[i][0] > 0) && (x - j * dir[i][0] < 16) && (y - j * dir[i][1] > 0) && (y - j * dir[i][1] < 16))
			{
				if (pos[x][y] == pos[x - j * dir[i][0]][y - j * dir[i][1]])
					ans++;
				else if (pos[x - j * dir[i][0]][y - j * dir[i][1]] == 0)
					b = 0, flag2 = 1;
			}
		}
		if ((ans >= 1) && (a || b) && (a != b))
		{
			if (pos[x][y] == 1)black[x][y] += 30;
			else white[x][y] += 30;
			return true;
		}
	}
	return false;
}
void AI()
{
	int b_x = 8, b_y = 8, w_x = 8, w_y = 8;
	memset(black, 0, sizeof(black));
	memset(white, 0, sizeof(white));
	for (int i = 1; i <= 15; i++)
	{
		for (int j = 1; j <= 15; j++)
		{
			if (!pos[i][j])
			{
				pos[i][j] = -1;
				while (true)
				{
					if (lian5(i, j))break;
					if (live4(i, j))break;
					if (live3(i, j))break;
					if (chong4(i, j))break;
					if (death3(i, j))break;
					if (live2(i, j))break;
					if (death2(i, j))break;
					break;
				}
				pos[i][j] = 1;
				while (true)
				{
					if (lian5(i, j))break;
					if (live4(i, j))break;
					if (live3(i, j))break;
					if (chong4(i, j))break;
					if (death3(i, j))break;
					if (live2(i, j))break;
					if (death2(i, j))break;
					break;
				}
				pos[i][j] = 0;
				if (black[i][j] > black[b_x][b_y])b_x = i, b_y = j;
				if (white[i][j] > white[w_x][w_y])w_x = i, w_y = j;
			}
		}
	}
	Sleep(1000);
	if (black[b_x][b_y] <= white[w_x][w_y])Play(w_x + 2, w_y, 1);
	else Play(b_x + 2, b_y, 1);
	return;
}
void GameAI()
{
	int turn = 0;
	key = false;
	memset(pos, 0, sizeof(pos));
	/*setfillcolor(EGERGB(0, 0, 0));
	bar(10, 200, 90, 230);
	setcolor(EGERGB(0, 0, 255));
	setfont(20, 0, "宋体");
	xyprintf(10, 205, "玩家先手");*/
	mouse_msg msg;
	bool flag = true;
	for (; is_run();)
	{
		msg = getmouse();
		if (msg.is_up())
		{
			/*if (flag)//flag标记是否开始游戏
			{
				if (msg.x >= 10 && msg.x <= 90 && msg.y >= 200 && msg.y <= 230)
				{
					setfillcolor(EGERGB(0, 0, 0));
					bar(10, 200, 90, 230);
					setcolor(EGERGB(0, 0, 255));
					setfont(20, 0, "宋体");
					xyprintf(10, 205, "电脑先手");
					flag = false;
				}
			}*/
			if (msg.x % 40 < 20)
			{
				if (msg.y % 40 < 20)
				{
					if (Play(msg.x / 40, msg.y / 40, turn % 2))
					{
						turn++;
						Counter(turn);
						if (Checker())break;
						AI();
						turn++;
						Counter(turn);
					}
				}
				else if (msg.y % 40 > 20)
				{
					if (Play(msg.x / 40, msg.y / 40 + 1, turn % 2))
					{
						turn++;
						Counter(turn);
						if (Checker())break;
						AI();
						turn++;
						Counter(turn);
					}
				}
			}
			else if (msg.x % 40 > 20)
			{
				if (msg.y % 40 < 20)
				{
					if (Play(msg.x / 40 + 1, msg.y / 40, turn % 2))
					{
						turn++;
						Counter(turn);
						if (Checker())break;
						AI();
						turn++;
						Counter(turn);
					}
				}
				else if (msg.y % 40 > 20)
				{
					if (Play(msg.x / 40 + 1, msg.y / 40 + 1, turn % 2))
					{
						turn++;
						Counter(turn);
						if (Checker())break;
						AI();
						turn++;
						Counter(turn);
					}
				}
			}
			if (Checker())break;
		}
	}
}
void GamePeople()
{
	key = true;
	memset(pos, 0, sizeof(pos));
	int turn = 0;
	mouse_msg msg;
	for (; is_run();)
	{
		msg = getmouse();
		if (msg.is_up())
		{
			if (msg.x % 40 < 20)
			{
				if (msg.y % 40 < 20)
				{
					if (Play(msg.x / 40, msg.y / 40, turn % 2))
					{
						turn++;
						Counter(turn);
					}
				}
				else if (msg.y % 40 > 20)
				{
					if (Play(msg.x / 40, msg.y / 40 + 1, turn % 2))
					{
						turn++;
						Counter(turn);
					}
				}
			}
			else if (msg.x % 40 > 20)
			{
				if (msg.y % 40 < 20)
				{
					if (Play(msg.x / 40 + 1, msg.y / 40, turn % 2))
					{
						turn++;
						Counter(turn);
					}
				}
				else if (msg.y % 40 > 20)
				{
					if (Play(msg.x / 40 + 1, msg.y / 40 + 1, turn % 2))
					{
						turn++;
						Counter(turn);
					}
				}
			}
			if (Checker())break;
		}
	}
}
bool Menu()
{
	setcolor(EGERGB(255, 45, 50));
	setfont(130, 0, "华文新魏");
	xyprintf(150, 60, "五  子  棋");
	setbkcolor(EGERGB(0, 0, 255));
	setfillcolor(EGERGB(0, 122, 204));
	bar(300, 230, 500, 280);
	bar(300, 300, 500, 350);
	bar(300, 370, 500, 420);
	setbkmode(TRANSPARENT);
	setfont(40, 15, "华文楷体");
	setcolor(EGERGB(255, 255, 255));
	setfontbkcolor(EGERGB(30, 30, 130));
	outtextxy(320, 235, "人机对战");
	outtextxy(320, 305, "好友对战");
	outtextxy(320, 375, "退出游戏");
	setfont(30, 0, "华文楷体");
	outtextxy(230, 480, "制作人：计实验17-1郭永航");
	setfont(20, 0, "方正舒体");
	setcolor(EGERGB(0, 0, 0));
	outtextxy(190, 600, "Copyright (C) 2018 Gomoku. All Rights Reserved.");
	mouse_msg msg;
	for (; is_run();)
	{
		msg = getmouse();
		if (msg.is_up())
		{
			if (msg.x >= 300 && msg.x <= 500 && msg.y >= 230 && msg.y <= 280)
			{
				cleardevice();
				ChessBoard();
				GameAI();
				break;
			}
			else if (msg.x >= 300 && msg.x <= 500 && msg.y >= 300 && msg.y <= 350)
			{
				cleardevice();
				ChessBoard();
				GamePeople();
				break;
			}
			else if (msg.x >= 300 && msg.x <= 500 && msg.y >= 370 && msg.y <= 420)
			{
				closegraph();
				return 1;
			}
		}
	}
	return 0;
}
bool Choice()
{
	setfillcolor(EGERGB(0, 0, 0));
	bar(10, 150, 90, 180);
	bar(10, 200, 90, 230);
	setcolor(EGERGB(255, 255, 255));
	setfont(20, 0, "宋体");
	xyprintf(10, 155, "再来一局");
	xyprintf(10, 205, "返回菜单");
	mouse_msg msg;
	for (; is_run();)
	{
		msg = getmouse();
		if (msg.is_up())
		{
			if (msg.x >= 10 && msg.x <= 90 && msg.y >= 150 && msg.y <= 180)
			{
				cleardevice();
				ChessBoard();
				if (key)GamePeople();
				else GameAI();
				break;
			}
			else if (msg.x >= 10 && msg.x <= 90 && msg.y >= 200 && msg.y <= 230)
			{
				cleardevice();
				if (Menu())return 1;
				else break;
			}
		}
	}
	return 0;
}
int main()
{
	setinitmode(INIT_RENDERMANUAL);
	initgraph(800, 640);
	setcaption("五子棋");
	if (Menu())return 0;
	while (!Choice());
	return 0;
}
```