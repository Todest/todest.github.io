---
title: 河南理工大学第九届算法程序设计大赛题解
date: 2019-04-02 18:28:10
categories:
  - Algorithm
tags: 题解
mathjax: true
abbrlink: ab3ec9eb
---
# 热身赛
## A.三玖天下第一
题目链接: https://hpuoj.com/contest/18/problem/A/
思路: 很水的一道题, $map$ 统计出现次数最多的数字,判断一下输出就行了.
代码:
```
#include<bits/stdc++.h>
using namespace std;
int main()
{
	string s;
	map<char,int>M;
	cin>>s;
	int ans=0;
	for(int i=0;i<s.length();i++)
		M[s[i]]++;
	for(int i='0';i<='9';i++)
		if(M[i]>M[ans])ans=i;
	if(ans=='0')cout<<"Five equal parts."<<endl;
	else if(ans=='1')cout<<"One flower gathers people."<<endl;
	else if(ans=='2')cout<<"The second is very color."<<endl;
	else if(ans=='3')cout<<"San Jiu tian xia di yi!"<<endl;
	else if(ans=='4')cout<<"Four leaves kawaii."<<endl;
	else cout<<"May daughter."<<endl;
	return 0;
}
```

<!--more-->
## B.权力的游戏
题目链接: https://hpuoj.com/contest/18/problem/B/
思路: 仍旧是 $map$ 统计每个数字出现次数,出现次数为奇数的输出一下就行了.
代码:
```
#include<bits/stdc++.h>
using namespace std;
int main()
{
	int N,flag=0;
	map<int,int>M;
	while(cin>>N)M[N]++;
	map<int,int>::iterator it;
	for(it=M.begin();it!=M.end();it++)
	{
		if(it->second%2)
		{
			if(flag==0)
			{
				cout<<it->first;
				flag=1;
			}
			else cout<<' '<<it->first;
		}
	}
	cout<<endl;
	return 0;
}
```

# 正式赛
## A.Asia区域赛
题目链接: https://hpuoj.com/contest/16/problem/A/
思路: 大水题一个,计算奖牌个数=29金+59银+87铜+11最快解题+1最佳女队+1顽强拼搏=187个,输出187即可.
代码:
```
#include<bits/stdc++.h>
typedef long long ll;
using namespace std;
int main()
{
	cout<<187<<endl;
	return 0;
}
```

## B.Asia区域制
题目链接: https://hpuoj.com/contest/16/problem/B/
思路: 二进制转十六进制,每四位转化一下输出即可,注意要先转化前面不足四位的.
代码:
```
#include<bits/stdc++.h>
typedef long long ll;
using namespace std;
char x[20]="0123456789abcdef";
string s;
int POW(int a,int b)
{
	int ans=1;
	for(int i=0;i<b;i++)
		ans*=a;
	return ans;
}
int main()
{
	int T,l,ans;
	cin>>T;
	while(T--)
	{
		ans=0;
		cin>>s;
		l=s.length();
		for(int i=l%4-1;i>=0;i--)
			if(s[i]=='1')
			ans+=POW(2,l%4-i-1);
		if(l%4)cout<<x[ans];
		for(int i=l%4;i<l;i++)
		{
			ans=0;
			for(int j=0;j<4;j++)
				if(s[i+j]=='1')
				ans+=POW(2,3-j);
			cout<<x[ans];
			i+=3;
		}
		cout<<endl;
	}
	return 0;
}
```

## C.Asia区域宫
题目链接: https://hpuoj.com/contest/16/problem/C/
思路: 注意加粗字体 **"障碍物在迷宫中不能同行且不能同列"**,说明只有把与副对角线平行的路线堵死之后才输出 No ,其余情况输出皆为 2*$n$-2.
代码:
```
代码暂无
```

## D.Asia区域阵
题目链接: https://hpuoj.com/contest/16/problem/D/
思路: 思路暂无
代码:
```
代码暂无
```

## E.Mo的游戏
题目链接: https://hpuoj.com/contest/16/problem/E/
思路: $map$记录相同字符之间的最短距离,建一个数组记录此字符上次出现的位置.for循环遍历一遍即可.
代码:
```
#include<bits/stdc++.h>
typedef long long ll;
using namespace std;
int a[200];
int M[200];
int main()
{
	string s;
	memset(M,-1,sizeof(M));
	cin>>s;
	for(int i=0;i<s.length();i++)
	{
		if(M[s[i]]==-1)
		{
			M[s[i]]++;
			a[s[i]]=i+1;
		}
		else
		{
			if(M[s[i]]==0)M[s[i]]=i+1-a[s[i]];
			if(i+1-a[s[i]]<M[s[i]])
				M[s[i]]=i+1-a[s[i]];
			a[s[i]]=i+1;
		}
	}
	for(char i='a';i<='z';i++)
		if(M[i]==0)cout<<i<<':'<<0<<endl;
		else if(M[i]!=-1)cout<<i<<':'<<s.length()-M[i]<<endl;
	for(char i='A';i<='Z';i++)
		if(M[i]==0)cout<<i<<':'<<0<<endl;
		else if(M[i]!=-1)cout<<i<<':'<<s.length()-M[i]<<endl;
	return 0;
}
```

## F.Mo的极限
题目链接: https://hpuoj.com/contest/16/problem/F/
思路: 思路暂无
代码:
```
代码暂无
```

## G.Mo的数学
题目链接: https://hpuoj.com/contest/16/problem/G/
思路: 分解质因数,即$M$的因子的倍数都不和$M$互质,其余的都和$M$互质,此为暴力做法.正解为容斥原理,暂无.
代码:
```
#include<bits/stdc++.h>
#define MOD 1000000007
typedef long long ll;
using namespace std;
bool zhi[1000020];
int N,M;
void gcd(int n)
{
	for(int i=2;i*i<=n;i++)
	{
		if(n%i==0)
		{
			for(int j=1;j*i<=N;j++)
				zhi[i*j]=1;
			for(int j=1;j*(n/i)<=N;j++)
				zhi[(n/i)*j]=1;
		}
	}
	for(int j=1;j*n<=N;j++)
		zhi[j*n]=1;
}
int main()
{
	while(cin>>N>>M)
	{
		ll ans=1;
		memset(zhi,0,sizeof(zhi));
		gcd(M);
		for(int i=2;i<=N;i++)
			if(!zhi[i])ans=ans*i%MOD;
		cout<<ans<<endl;
	}
	return 0;
}

```

## H.Mo的面积
题目链接: https://hpuoj.com/contest/16/problem/H/
思路: 两个矩形右边线中$x$值最小的减去两个矩形左边线中$x$值最大的即为重合矩形在$x$轴方向的长度;两个矩形上边线中$y$值最小的减去两个矩形下边线中$y$值最大的即为重合矩形在$y$轴方向的长度.如果其中一个值小于或等于0,则重合面积为0,否则,即为其乘积.求两矩形总面积减去重合部分面积即为答案.
代码:
```
#include<bits/stdc++.h>
typedef long long ll;
using namespace std;
int main()
{
	int a[2][2],b[2][2],x,y;
	for(int i=0;i<2;i++)
		for(int j=0;j<2;j++)
			cin>>a[i][j];
	for(int i=0;i<2;i++)
	
		for(int j=0;j<2;j++)
			cin>>b[i][j];
	x=min(a[1][0],b[1][0])-max(a[0][0],b[0][0]);
	y=min(a[1][1],b[1][1])-max(a[0][1],b[0][1]);
	int s=(a[1][1]-a[0][1])*(a[1][0]-a[0][0])+(b[1][1]-b[0][1])*(b[1][0]-b[0][0]);
	if(x*y>0)s-=x*y;
	cout<<s<<endl;
	return 0;
}
```

## I.安全距离
题目链接: https://hpuoj.com/contest/16/problem/I/
思路: 思路暂无
代码:
```
代码暂无
```

## J.简单递归
题目链接: https://hpuoj.com/contest/16/problem/J/
思路: 讲题目代码递归转化为非递归即可.
代码:
```
#include<bits/stdc++.h>
typedef long long ll;
using namespace std;
const int MOD = (int)1e9 + 7;
int a[1000020];
void init()
{
	a[1]=a[2]=1;
	for(int i=3;i<=1000000;i++)
		a[i]=((a[i-1]<<1)%MOD+(a[i-2]>>1)%MOD)%MOD;
}
int main()
{
	init();
	int T,N;
	cin>>T;
	while(T--)
	{
		cin>>N;
		cout<<a[N]<<endl;
	}
	return 0;
}
```

## K.高度期望
题目链接: https://hpuoj.com/contest/16/problem/K/
思路: 贪心求解,先对树高进行排序,再从低到高遍历即可.
代码:
```
#include<bits/stdc++.h>
typedef long long ll;
using namespace std;
int main()
{
	int N,M,a[100020];
	ll ans=0,res=0;
	cin>>N>>M;
	for(int i=0;i<N;i++)
	{
		cin>>a[i];
		ans+=a[i];
	}
	sort(a,a+N);
	for(int i=0;i<N;i++)
	{
		if(ans>=M*N)break;
		ans+=1000-a[i];
		res++;
	}
	cout<<res<<endl;
	return 0;
}
```

## L.最优规划
题目链接: https://hpuoj.com/contest/16/problem/L/
思路: 思路暂无
代码:
```
代码暂无
```
