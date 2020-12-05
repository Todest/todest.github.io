---
title: Large Division
date: 2019-03-29 17:11:09
categories:
  - Algorithm
tags:
  - 同余定理
abbrlink: e17037ac
updated:
---

# Descript
{% blockquote %}
Given two integers, a and b, you should check whether a is divisible by b or not. We know that an integer a is divisible by an integer b if and only if there exists an integer c such that a = b * c.
{% endblockquote %}
<!--more-->
# Input
{% blockquote %}
Input starts with an integer T (≤ 525), denoting the number of test cases.

Each case starts with a line containing two integers a (-10200 ≤ a ≤ 10200) and b (|b| > 0, b fits into a 32 bit signed integer). Numbers will not contain leading zeroes.
{% endblockquote %}
# Output
{% blockquote %}
For each case, print the case number first. Then print 'divisible' if a is divisible by b. Otherwise print 'not divisible'.
{% endblockquote %}
# Sample Input
```nohilight
6
101 101
0 67
-101 101
7678123668327637674887634 101
11010000000000000000 256
-202202202202000202202202 -101
```

# Sample Output
```nohilight
Case 1: divisible
Case 2: divisible
Case 3: divisible
Case 4: not divisible
Case 5: divisible
Case 6: divisible
```
# Code
**java暴力代码**
```java
import java.util.Scanner;
import java.math.BigInteger;
public class Main{
	public static void main(String[] args) {
		Scanner sc=new Scanner(System.in);
		BigInteger a,b;
		Integer T = sc.nextInt(),k=1;
		while(T-->0){
			a = sc.nextBigInteger();
			b = sc.nextBigInteger();
			a = a.abs();
			b = b.abs();
			System.out.print("Case " + k++ +": ");
			if(a.mod(b) == BigInteger.valueOf(0))System.out.println("divisible");
			else System.out.println("not divisible");
		}
	}
}
```
