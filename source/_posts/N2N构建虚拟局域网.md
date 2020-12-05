---
title: N2N构建虚拟局域网
categories:
  - 计算机网络
tags:
  - 虚拟局域网
  - N2N
abbrlink: 81bd05cb
date: 2020-05-10 14:02:50
---
# 介绍
N2N是一款开源的P2P软件，可以用来构建虚拟局域网，也就是说，每个N2N虚拟网络內的用户都可以通过N2N网络访问其他用户主机，即相互ping通。

# 架构
**Supernode 超级节点：**它在Edge节点间建立握手，或为Edge节点中转数据。能够直通的节点间通讯是P2P的，则由超级节点注册网络路径，超级节点一旦帮助双方完成首次握手，剩余的数据流就会在两个Edge节点间传送，而无需超级节点介入。如果有一方Edge节点的NAT属于对称型（symmetrical），超级节点还需继续为双方提供数据转发服务。
**Edge 节点：**用户主机上用以与建立N2N网络的软件。几乎每个Edge节点都需建立一个tun/tap虚拟网卡设备，作为接入N2N网络的入口。
<!--more-->

# 安装
**地址**
+ v1: https://github.com/meyerd/n2n/tree/master/n2n_v1
+ v2: https://github.com/ntop/n2n
+ v2.1(v2s): https://github.com/meyerd/n2n/tree/master/n2n_v2 非官方版本，与官方的 v2 不兼容
+ 安卓版本: https://github.com/switch-iot/hin2n (最新版本支持v1、v2、v2s)
+ 网友编译的主程序：https://github.com/lucktu/n2n

由于v2s版本直连概率比较高，所以本文只介绍v2s版本。同时服务端使用 ubuntu，客户端使用 windows。

**安装方法**
先从服务端开始，在ubuntu上从github下载源码进行编译安装，由此获得两个可执行文件，supernode和edge。
```bash
git clone https://github.com/meyerd/n2n
cd n2n/n2n_v2
mkdir build
cd build
cmake ..
make
make install
```
然后服务端运行supernode，服务端防火墙记得开放UDP监听端口，这里假设UDP监听端口为1234。
```bash
supernode -l 1234
```
接下来创建DHCP服务器。
```bash
sudo apt-get install isc-dhcp-server
```bash

配置 `/etc/dhcp/dhcpd.conf`，写入以下内容，也可以找到相应位置，取消注释，然后修改内容.
```bash
ddns-update-style interim;
ignore client-updates;
default-lease-time 604800;
max-lease-time 1209600;

subnet 10.0.0.0 netmask 255.255.255.0 {
    option subnet-mask 255.255.255.0;
    range dynamic-bootp 10.0.0.10 10.0.0.100;
}
```
编辑` /etc/default/isc-dhcp-server`，添加一行。假设虚拟网卡名为tun0。
```bash
INTERFACES="tun0"
```
然后启动DHCP服务，可以使用`dhclient tun0`测试是否从DHCP服务器获取到IP。
```bash
service isc-dhcp-server start
```
接下来配置服务端Edge节点，创建DHCP服务器用得着，否则也可以不用配置。
假设设定的n2n网络IP为10.0.0.1，如果需要可以加上`-k 自定义加密key值`。
```bash
edge -d tun0 -a 10.0.0.1 -l 127.0.0.1:1234
```
上面步骤会创建名为tun0的虚拟网卡，如果创建失败，可以按照下面方法手动创建。
```bash
sudo apt-get install uml-utilities
tunctl -t tun0
```
这样，其他Edge节点启动后就可以由10.0.0.1分配IP地址。
windows客户端直接下载编译好的EXE文件，或是自行从github仓库下载源码编译。
同时，windows需先安装tap-window虚拟网卡软件。
然后在命令行（管理员模式）运行，注意中文路径及特殊符号路径。
以下为DHCP获取IP地址的指令。（不知道为什么，我每次DHCP启动或关闭都会断网一瞬间）
```bash
edge -r -a dhcp:10.0.0.1 -l 服务端IP:1234
```
以下为以指定IP（10.0.0.2）启动，各个Edge节点指定IP启动的IP需各不相同。
```bash
edge -a 10.0.0.2 -l 服务端IP:1234
```