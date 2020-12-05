---
title: ExGCD
date: 2019-03-29 17:11:09
categories:
  - Algorithm
tags:
  - ExGCD
abbrlink: 278aaa5d
updated:
---
# 原理
未完待续
# 题目
未完待续
<!--more-->
# 代码
```cpp
ll exgcd(ll a,ll b,ll &x,ll &y)
{
    if(b==0)
    {
        x=1,y=0;
        return a;
    }
    else
    {
        ll res=exgcd(b,a%b,y,x);
        y-=x*(a/b);
        return res;
    }
}
```