---
title: A Secret
date: 2019-03-29 17:11:09
categories:
  - Algorithm
tags:
  - KMP
abbrlink: a56468f6
---
# Description
{% blockquote %}
Today is the birthday of SF,so VS gives two strings S1,S2 to SF as a present,which have a big secret.SF is interested in this secret and ask VS how to get it.There are the things that VS tell:
  Suffix(S2,i) = S2[i...len].Ni is the times that Suffix(S2,i) occurs in S1 and Li is the length of Suffix(S2,i).Then the secret is the sum of the product of Ni and Li.
  Now SF wants you to help him find the secret.The answer may be very large, so the answer should mod 1000000007.
{% endblockquote %}
<!--more-->
# Input
{% blockquote %}
Input contains multiple cases.
  The first line contains an integer T,the number of cases.Then following T cases.
  Each test case contains two lines.The first line contains a string S1.The second line contains a string S2.
  1<=T<=10.1<=|S1|,|S2|<=1e6.S1 and S2 only consist of lowercase ,uppercase letter.
{% endblockquote %}
# Output
{% blockquote %}
For each test case,output a single line containing a integer,the answer of test case.
  The answer may be very large, so the answer should mod 1e9+7.
{% endblockquote %}
# Sample Input
```nohilight
2
aaaaa
aa
abababab
aba
```
# Sample Output
```nohilight
13
19
```
# Hint
```nohilight
case 2: 
Suffix(S2,1) = "aba",
Suffix(S2,2) = "ba",
Suffix(S2,3) = "a".
N1 = 3,
N2 = 3,
N3 = 4.
L1 = 3,
L2 = 2,
L3 = 1.
ans = （3*3+3*2+4*1）%1000000007.
```
# Code
```cpp
#include<iostream>
#include<string>
#include<algorithm>
#define mod 1000000007
using namespace std;
string a,b;
int NEXT[1000020];
void get()
{
    int i=0,j=-1;
    NEXT[i]=j;
    while(i<b.length()){
        if(j==-1||b[i]==b[j])
        {
            i++;j++;
            NEXT[i]=j;
        }
        else j=NEXT[j];
    }
}
int kmp()
{
    get();
    int i=0,j=0;
    long long ans=0;
    while(i<a.length())
    {
        if(j==-1||a[i]==b[j])
        {
            ans+=j+1;
            ans%=mod;
            i++;j++;
        }
        else
        {
            if(j==0)i++;
            else
            {
                j=NEXT[j];
                ans+=1ll*j*(j+1)/2;
                ans%=mod;
            }
        }
    }
    return ans;
}
int main()
{
    ios::sync_with_stdio(false);
    int T;
    cin>>T;
    while(T--)
    {
        cin>>a>>b;
        reverse(a.begin(),a.end());
        reverse(b.begin(),b.end());
        a+='X';b+='Y';
        cout<<kmp()<<endl;
    }
    return 0;
}
```

