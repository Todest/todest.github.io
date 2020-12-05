---
title: 注册表相关操作
date: 2019-03-29 17:11:09
catogories:
  - 操作系统
  - 注册表
tags:
  - cmd
  - powershell
abbrlink: 11bb3efa
---
# 在此处打开命令窗口（管理员）
## cmd
```nohilight
Windows Registry Editor Version 5.00

[HKEY_CLASSES_ROOT\Directory\Background\shell\runas]
@="@shell32.dll,-8506"
"NoWorkingDirectory"=""
"ShowBasedOnVelocityId"=dword:00639bc8
"HasLUAShield"=""

[HKEY_CLASSES_ROOT\Directory\Background\shell\runas\command]
@="cmd.exe /s /k pushd \"%V\""
```
<!--more-->
## powershell
```nohilight
Windows Registry Editor Version 5.00

[HKEY_CLASSES_ROOT\Directory\Background\shell\runas]
@="@shell32.dll,-8508"
"NoWorkingDirectory"=""
"ShowBasedOnVelocityId"=dword:00639bc8
"HasLUAShield"=""

[HKEY_CLASSES_ROOT\Directory\Background\shell\runas\command]
@="\"C:\\Windows\\System32\\WindowsPowerShell\\v1.0\\powershell.exe\" -windowstyle hidden -Command $stpath = pwd; Start-Process PowerShell -ArgumentList \\\"-NoExit\\\", \\\"-Command Set-Location -literalPath '%V'\\\" -verb RunAs"
```
# 相关解释
## 项(K)
`runas` 管理员运行
`command` 运行时执行的命令
## 字符串值(S) （REG_SZ）
`(默认)` 显示的名称
`Extended` 是否 shift 扩展
`HasLUAShield` 是否显示用户账户控制图标
`NoWorkingDirectory` 暂时未知
## DWORD(32位)值 （D）
`ShowBasedOnVelocityId` 暂时未知
