---
title: C++ STL
date: 2019-04-01 22:22:14
categories:
  - 编程语言
  - C++
tags:
  - C++
abbrlink: 5c80f146
---
# stack
栈是 **后进先出** (Last In Fisrt Out)的一种特殊的线性表。
栈的基本操作如下。
```
stack<int>S;     //定义栈
S.push(x);       //入栈
S.pop();         //出栈
S.top();         //取栈顶元素
S.empty();       //判断栈是否为空
S.size();        //获取栈的大小
```
<!--more-->
栈可以存储多种类型数据,包括但不限于`int` `char` `string` `double`以及`pair`等等.
入栈是把元素压入栈底;
出栈是删除栈顶元素;
取栈顶元素只返回元素,不删除;
获取栈的大小返回栈內元素数量;
栈的判空一般都和 while 循环配套使用,比如下面代码输出栈内所有元素,并清空栈.
```
while(!S.empty())
{
    cout<<S.top()<<endl;
    S.pop();
}
```
# queue
```
queue<int>Q;	//定义队列
Q.push();		//入队
Q.font();		//返回队头元素
Q.back();		//返回队尾元素
Q.pop();		//出队
Q.empty();		//队列判空
```
队列是 **先入先出** (Fisrt In Fisrt Out)的一种特殊的线性表.
队列队头删除,队尾插值;
和栈一样,队列在取元素,删除元素前应确保队列不为空;

# map
```
map<key,value>M;	//定义map
M[key]=value;		//map赋值
```
map为key(键)到value(键值)的映射,底部实现为红黑树.
map中的key值不允许重复,且不能改变,按照给定的排序规则对key进行排序.

# set
```
set<int>S;		//定义set
S.insert();		//set插值
```
set是一个有序集合,使用平衡二叉树存储,按照给定的排序规则(默认为less)对set中的数据进行排序.
和map一样,set不允许有重复元素.

# pair
```
pair<int,int>P;		//定义pair
make_pair(a,b);		//以a,b的值创建一个新的pair对象

```
