---
title: 批处理备份
date: 2020-04-08 15:34:26
categories:
  - 操作系统
  - Shell
tags:
  - 批处理
abbrlink: 2e9e806c
data:
updata:
---
# 以当前时间备份文件
`sample`是待备份文件夹

windows
```bat
@echo off
if "%time:~0,1%" EQU " " (
```

linux
```bash
time=$(date '+%Y%m%d%H%M%S' )
tar -cvf ./backup/$time.tar ./sample/
```
