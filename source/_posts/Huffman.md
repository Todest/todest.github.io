---
title: 哈夫曼编码
date: 2019-03-29 17:11:09
categories:
  - 数据结构
tags:
  - 哈夫曼编码
abbrlink: '49558830'
updated:
---
# 哈夫曼编码
**以下为数据结构作业**
如有错误，请指出，谢谢！
<!--more-->
```cpp
#include<stdio.h>
#include<stdlib.h>
#include<string.h>
char key[200];
typedef struct
{
	unsigned int weight;
	unsigned int parent,LChild,RChild;
}HTNode,*HuffmanTree;
typedef char *HuffmanCode;
void Select(HuffmanTree *ht,int n,int *s1,int *s2)
{
	int i,min;
	for(i=1;i<=n;i++)
	{
		if((*ht)[i].parent==0)
		{
			min=i;
			break;
		}
	}
	for(i=1;i<=n;i++)
	{
		if((*ht)[i].parent==0)
		{
			if((*ht)[i].weight<(*ht)[min].weight)
				min=i;
		}
	}
	*s1=min;

	for(i=1;i<=n;i++)
	{
		if((*ht)[i].parent==0&&i!=(*s1))
		{
			min=i;
			break;
		}
	}
	for(i=1;i<=n;i++)
	{
		if((*ht)[i].parent==0&&i!=*s1)
		{
			if((*ht)[i].weight<(*ht)[min].weight)
				min=i;
		}
	}
	*s2=min;
}
void CrtHuffmanTree(HuffmanTree *ht,int *w,int n)
{
	int m=2*n-1,i,s1,s2;
	*ht	=(HuffmanTree) malloc((m+1)*sizeof(HTNode));
	for(i=1;i<=n;i++)
	{
		(*ht)[i].weight=w[i];
		(*ht)[i].LChild=0;
		(*ht)[i].parent=0;
		(*ht)[i].RChild=0;
	}
	for(i=n+1;i<=m;i++)
	{
		(*ht)[i].weight=0;
		(*ht)[i].LChild=0;
		(*ht)[i].parent=0;
		(*ht)[i].RChild=0;
	}
	FILE *fp;
	fp=fopen("Code.txt","w");
	fprintf(fp,"哈夫曼树为: \n");
	for(i=n+1;i<=m;i++)
	{
		Select(ht,i-1,&s1,&s2);
		(*ht)[s1].parent=i;
		(*ht)[s2].parent=i;
		(*ht)[i].LChild=s1;
		(*ht)[i].RChild=s2;
		(*ht)[i].weight=(*ht)[s1].weight +(*ht)[s2].weight;
		fprintf(fp,"%d(%d,%d)\n",(*ht)[i].weight,(*ht)[s1].weight,(*ht)[s2].weight);
	}
	fprintf(fp,"\n");
	fclose(fp);
}
void CrtHuffmanCode(HuffmanTree *ht,HuffmanCode *hc,int n)
{
	char *cd;
	int a[100];
	int i,start,p,w=0;
	unsigned int c;
	hc=(HuffmanCode *)malloc((n+1)*sizeof(char *));
	cd=(char *) malloc(n*sizeof(char));
	cd[n-1]='\0';
	for(i=1;i<=n;i++)
	{
		a[i]=0;
		start=n - 1;
		for(c=i,p=(*ht)[i].parent;p != 0;c=p,p=(*ht)[p].parent)
		{
			if((*ht)[p].LChild==c)
			{
				cd[--start]='0';
				a[i]++;
			}
			else
			{
				cd[--start]='1';
				a[i]++;
			}
		}
		hc[i]=(char *) malloc((n - start)*sizeof(char));
		strcpy(hc[i],&cd[start]);
	}
	free(cd);
	FILE *fp,*sf,*rf;
	char ch;
	fp=fopen("Code.txt","a+");
	for(i=1;i<=n;i++)
		fprintf(fp,"权值为%d的字母%c的哈夫曼编码为：%s\n",(*ht)[i].weight,key[i],hc[i]);
	for(i=1;i<=n;i++)
		w+=(*ht)[i].weight*a[i];
	fprintf(fp,"带权路径为：%d\n",w);
	fclose(fp);
	sf=fopen("SourceFile.txt","r");
	rf=fopen("ResultFile.txt","w");
	while(fscanf(sf,"%c",&ch)!=EOF)
	{
		for(int i=1;i<=n;i++)
		{
			if(key[i]==ch)
			{
				fprintf(rf,"%s",hc[i]);
				break;
			}
		}
	}
	fclose(sf);
	fclose(rf);
}
int main()
{
	HuffmanTree	HT;
	HuffmanCode	HC;
	int *w,i,N=0,S[200],k=0;
	char ch;
	memset(S,0,sizeof(S));
	FILE *fp;
	fp=fopen("SourceFile.txt","r");
	while(fscanf(fp,"%c",&ch)!=EOF)S[ch]++;
	for(int i='A';i<='Z';i++)if(S[i])N++;
	fclose(fp);
	w=(int *)malloc((N+1)*sizeof(int));
	for(int i='A';i<='Z';i++)
	{
		if(S[i])
		{
			key[++k]=i;
			w[k]=S[i];
		}
	}
	CrtHuffmanTree(&HT,w,N);
	CrtHuffmanCode(&HT,&HC,N);
	return(0);
}
```
<br/>
**SourceFile.txt**
```nohilight
AAAAABBBBBBBBBBBBBBBBBBBBBBBBBCCCCCCCDDDDDDDDEEEEEEEEEEEEEEFFFFFFFFFFFFFFFFFFFFFGGGHHHHHHHHHHH
```
<br/>
**Code.txt**
```nohilight
哈夫曼树为: 
8(3,5)
15(7,8)
19(8,11)
29(14,15)
40(19,21)
54(25,29)
94(40,54)

权值为5的字母A的哈夫曼编码为：0001
权值为25的字母B的哈夫曼编码为：10
权值为7的字母C的哈夫曼编码为：1110
权值为8的字母D的哈夫曼编码为：1111
权值为14的字母E的哈夫曼编码为：110
权值为21的字母F的哈夫曼编码为：01
权值为3的字母G的哈夫曼编码为：0000
权值为11的字母H的哈夫曼编码为：001
带权路径为：259

```
<br/>
**ResultFile.txt**
```nohilight
0001000100010001000110101010101010101010101010101010101010101010101010111011101110111011101110111011111111111111111111111111111111110110110110110110110110110110110110110110010101010101010101010101010101010101010101000000000000001001001001001001001001001001001
```