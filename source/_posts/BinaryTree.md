---
title: 二叉树的遍历
date: 2019-03-29 17:11:09
categories:
  - 数据结构
tags:
  - 树
  - 二叉树
abbrlink: ea4681d0
updated:
---
# 二叉树的遍历
**以下为数据结构作业**
如有错误，请指出，谢谢！
<!--more-->
```cpp
#include<stdio.h>
#include<malloc.h>
#include<stdlib.h>
#define MAX 20
int NodeSum=0,LeafNode=0,Rank=0;
typedef struct BTNode{       /*节点结构声明*/
	char data ;               /*节点数据*/
	struct BTNode *lchild;
	struct BTNode *rchild ;  /*指针*/
}*BiTree;

void createBiTree(BiTree *t){ /* 先序遍历创建二叉树*/
	char s;
	BiTree q;
	printf("\nplease input data:(exit for #)");
	s=getchar();
	if(s=='#'){*t=NULL; return;}
	q=(BiTree)malloc(sizeof(struct BTNode));
	if(q==NULL){printf("Memory alloc failure!"); exit(0);}
	q->data=s;
	*t=q;
	createBiTree(&q->lchild); /*递归建立左子树*/
	createBiTree(&q->rchild); /*递归建立右子树*/
}

void PreOrder(BiTree p){  /* 先序遍历二叉树*/
    if ( p!= NULL ) {
       	printf("%c", p->data);
		NodeSum++;
       	PreOrder( p->lchild ) ;
       	PreOrder( p->rchild) ;
		if(p->lchild==NULL&&p->rchild==NULL)
			LeafNode++;
    }
}
int GetRank(BiTree p)
{
	if (p==NULL)
		return 0;
	else
	{
		int LRank=GetRank(p->lchild);
		int RRank=GetRank(p->rchild);
		int max=LRank;
		if (max<RRank)
			max=RRank;
		return max + 1;
	}
}
void InOrder(BiTree p){  /* 中序遍历二叉树*/
    if( p!= NULL ) {
 	 InOrder( p->lchild ) ;
   	 printf("%c", p->data);
   	 InOrder( p->rchild) ;
    }
}
void PostOrder(BiTree p){  /* 后序遍历二叉树*/
   if ( p!= NULL ) {
    	PostOrder( p->lchild ) ;
       	PostOrder( p->rchild) ;
       	printf("%c", p->data);
    }
}

void Preorder_n(BiTree p){ /*先序遍历的非递归算法*/
    BiTree stack[MAX],q;
    int top=0,i;
    for(i=0;i<MAX;i++) stack[i]=NULL;/*初始化栈*/
    q=p;
    while(q!=NULL){
        printf("%c",q->data);
        if(q->rchild!=NULL) stack[top++]=q->rchild;
        if(q->lchild!=NULL) q=q->lchild;
        else
            if(top>0) q=stack[--top];
            else q=NULL;
    }
}

void release(BiTree t){ /*释放二叉树空间*/
  	if(t!=NULL){
    	release(t->lchild);
    	release(t->rchild);
    	free(t);
  	}
}
int main(){
    BiTree t=NULL;
    createBiTree(&t);
    printf("\n\nPreOrder the tree is:");
    PreOrder(t);
    printf("\n\nInOrder the tree is:");
    InOrder(t);
    printf("\n\nPostOrder the tree is:");
    PostOrder(t);
    printf("\n\nPreOrder(Not Recursive):");
    Preorder_n(t);
	printf("\nThe Sum Of Node is %d\n",NodeSum);
	printf("The Sum Of LeafNode is %d\n",LeafNode);
	printf("The Height Of The Tree is %d\n",GetRank(t));
    release(t);
    return 0;
}
```