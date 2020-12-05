---
title: GCD
date: 2019-03-29 17:11:09
categories:
  - Algorithm
tags:
  - GCD
abbrlink: 2071db18
updated:
---
# 原理
欧几里得算法据说是最早的算法，用于计算最大公约数，也是数论的基础算法之一。
# 题目
51Nod 1011：https://www.51nod.com/onlineJudge/questionCode.html#!problemId=1011
<!--more-->
# 代码
```cpp
int gcd(int a,int b)
{
    if(b==0)return a;
    return gcd(b,a%b);
}
```
```cpp
int gcd(int a,int b)
{
    return b==0?b:(a%b);
}
```

# 延伸
扩展欧几里得