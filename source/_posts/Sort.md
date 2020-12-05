---
title: 各种排序时间复杂度比较
date: 2019-03-29 17:11:09
categories:
  - 数据结构
tags:
  - 排序
abbrlink: '52089862'
updated:
---
# 各种排序时间复杂度比较
**以下为数据结构作业**
如有错误，请指出，谢谢！
<!--more-->
```cpp
#include<iostream>
#include<time.h>
#include<windows.h>
#include<cstdlib>
const int Decimal=1000;
using namespace std;
typedef struct
{
	int *elem;
	int length;
}SqList;
void InsertSort(SqList L)
{
	int i,j;
	for(i=2;i<L.length;i++)
	{
		if(L.elem[i]<L.elem[i-1])
		{
			L.elem[0]=L.elem[i];
			L.elem[i]=L.elem[i-1];
		}
		for(j=i-2;L.elem[0]<L.elem[j];j--)
			L.elem[j+1]=L.elem[j];
		L.elem[j+1]=L.elem[0];
	}
}
void BInsertSort(SqList L)
{
	int i,j,high,low,m;
	for(i=2;i<L.length;i++)
	{
		L.elem[0]=L.elem[i];
		low=1;high=i-1;
		while(low<=high)
		{
			m=(low+high)/2;
			if(L.elem[0]<L.elem[m])high=m-1;
			else low=m+1;
		}
		for(j=i-1;j>=high+1;j--)
			L.elem[j+1]=L.elem[j];
		L.elem[high+1]=L.elem[0];
	}
}
void ShellInsert(SqList &L,int dk)
{
	int i,j;
	for(i=dk+1;i<L.length;i++)
	{
		if(L.elem[i]<L.elem[i-dk])
		{
			L.elem[0]=L.elem[i];
			for(j=i-dk;j>0&&L.elem[0]<L.elem[j];j-=dk)
				L.elem[j+dk]=L.elem[j];
			L.elem[j+dk]=L.elem[0];
		}
	}
}
void ShellSort(SqList &L,int dt[],int t)
{
	int k;
	for(k=0;k<t;k++)
	ShellInsert(L,dt[k]);
}
void BubbleSort(SqList &L)
{
	int m=L.length-1,flag=1,t;
	while((m>0)&&(flag==1))
	{
		flag=0;
		for(int j=1;j<=m;j++)
		{
			if(L.elem[j]>L.elem[j+1])
			{
				flag=1;
				t=L.elem[j];
				L.elem[j]=L.elem[j+1];
				L.elem[j+1]=t;
			}
		}
		--m;
	}
}
int Partition(SqList &L,int low,int high)
{
	L.elem[0]=L.elem[low];
	int privotkey=L.elem[low];
	while(low<high)
	{
		while(low<high&&L.elem[high]>=privotkey)--high;
			L.elem[low]=L.elem[high];
		while(low<high&&L.elem[low]<=privotkey)++low;
			L.elem[high]=L.elem[low];
	}
	L.elem[low]=L.elem[0];
	return low;
}
void QSort(SqList &L,int low,int high)
{
	int  pivotloc;
	if(low<high)
	{
		pivotloc=Partition(L,low,high);
		QSort(L,low,pivotloc-1);
		QSort(L,pivotloc+1,high);
	}
}
void QuickSort(SqList &L)
{
	QSort(L,1,L.length);
}
void Test(SqList &L)
{
	for(int i=1;i<L.length;i++)
	cout<<L.elem[i]<<" ";
	cout<<endl;
}
int main()
{
	int k=1,MAXN=1;
	SqList L;
	double run_time,dpFreq;
	_LARGE_INTEGER time_start; //开始时间
	_LARGE_INTEGER time_over; //结束时间
	LARGE_INTEGER f;
	QueryPerformanceFrequency(&f);
	dpFreq=(double)f.QuadPart; //计时器频率
	while(true)
	{
		MAXN*=10;
		L.elem=new int[MAXN+1];
		L.length=MAXN;
		cout<<"第"<<k++<<"次测试, 数量级:"<<MAXN<<endl<<endl;
		srand((unsigned)time(NULL));
		for(int i=1;i<L.length;i++)
			L.elem[i]=rand();
		QueryPerformanceCounter(&time_start);  //计时开始
		InsertSort(L);
		QueryPerformanceCounter(&time_over);  //计时结束
		run_time=Decimal*(time_over.QuadPart-time_start.QuadPart)/dpFreq;
		cout<<"插入排序:"<<run_time<<"ms"<<endl;
		for(int i=1;i<L.length;i++)
			L.elem[i]=rand();
		QueryPerformanceCounter(&time_start);
		InsertSort(L);
		QueryPerformanceCounter(&time_over);
		run_time=Decimal*(time_over.QuadPart-time_start.QuadPart)/dpFreq;
		cout<<"二分排序:"<<run_time<<"ms"<<endl;
		int dt[100001],t=100;
		QueryPerformanceCounter(&time_start);
		ShellSort(L,dt,t);
		QueryPerformanceCounter(&time_over);
		run_time=Decimal*(time_over.QuadPart-time_start.QuadPart)/dpFreq;
		cout<<"希尔排序:"<<run_time<<"ms"<<endl;
		for(int i=1;i<L.length;i++)
			L.elem[i]=rand();
		QueryPerformanceCounter(&time_start);
		BubbleSort(L);
		QueryPerformanceCounter(&time_over);
		run_time=Decimal*(time_over.QuadPart-time_start.QuadPart)/dpFreq;
		cout<<"冒泡排序:"<<run_time<<"ms"<<endl;
		for(int i=1;i<L.length;i++)
			L.elem[i]=rand();
		QueryPerformanceCounter(&time_start);
		QuickSort(L);
		QueryPerformanceCounter(&time_over);
		run_time=Decimal*(time_over.QuadPart-time_start.QuadPart)/dpFreq;
		cout<<"快速排序:"<<run_time<<"ms"<<endl;
		cout<<endl<<endl<<endl;
		if(MAXN>=10000)break;
	}
	return 0;
}
```
## Output
```nohilight
第1次测试, 数量级:10

插入排序:0.00037758ms
二分排序:0.00037758ms
希尔排序:0.00302064ms
冒泡排序:0.00037758ms
快速排序:0.000755161ms



第2次测试, 数量级:100

插入排序:0.00717403ms
二分排序:0.00830677ms
希尔排序:0.0256755ms
冒泡排序:0.027941ms
快速排序:0.00717403ms



第3次测试, 数量级:1000

插入排序:0.65548ms
二分排序:0.746099ms
希尔排序:0.288849ms
冒泡排序:2.10841ms
快速排序:0.0887314ms



第4次测试, 数量级:10000

插入排序:81.4585ms
二分排序:73.2691ms
希尔排序:4.76695ms
冒泡排序:357.605ms
快速排序:1.55676ms
```