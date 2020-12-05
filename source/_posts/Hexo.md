---
title: Hexo+NexT搭建博客
date: 2020-04-08 15:35:04
categories:
  - Web
  - 博客
tags:
  - Hexo
  - NexT
abbrlink: 277d2a74
---
### 准备工作

#### GitHub
注册一个 GitHub 账号，创建一个新的仓库，仓库名称严格命名为`todest.github.io`，`todest`为用户名，修改成你自己的。
#### Git
从此处 [Git官网](https://git-scm.com/) 下载并安装，右键打开`Git Bash`。
<!--more-->
##### 配置SSH
```bash
ssh-keygen -t rsa -C "邮件地址"		# 连续回车
```
将`"C:\Users\你的用户名\.ssh\id_rsa.pub"`的内容复制下来，打开`GitHub设置->SSH and GPG keys->New SSH key`，粘贴到此处确定。
```bash
ssh -T git@github.com
# 测试SSH是否配置好
# 看到You've successfully authenticated, but GitHub does not provide shell access.
# 则说明配置好了，否则无法使用hexo d
```
#### Node.js
从 [Node.js官网](https://nodejs.org) 下载安装。

#### 安装Hexo
```bash
npm install hexo-cli -g
```
`install`可简写为 `i` 。
#### 初始化Hexo
```bash
hexo init Blog					# Blog可以修改成其他的名字
cd Blog						# 进入Blog文件夹
```
#### 安装Hexo扩展
```bash
npm install hexo-deployer-git --save
npm install
```
### 部署

#### 本地调试
以下`g`是`generate`的缩写，`s`是`start`的缩写，`d`是`deploy`的缩写。
```bash
hexo clean
hexo g						# 生成  此条和后一条可简写为 hexo s -g
hexo s						# 预览
```
`hexo s`是开启本地预览服务，打开浏览器访问 <http://localhost:4000> 即可看到内容。

#### 上传到GitHub Pages
上传之前，打开站点配置文件`_config.yml`，位于站点根目录下，修改最后一部分为如下部分。
```yaml
deploy:
  type: git
  repository: git@github.com:todest/todest.github.io.git    # 修改为你的GitHub用户名
  branch: master
```
上传到`GitHub Pages`。
```bash
hexo clean
hexo g						# 此条和后一条可简写为 hexo d -g
hexo d
```

#### 修改主题
主题位置`themes`目录下，默认为`landscape`主题。可从官网 <https://hexo.io/themes/> 下载，推荐`NexT`主题，以下为安装方法。
安装过程就一行代码，站点根目录下运行。
```bash
git clone https://github.com/theme-next/hexo-theme-next themes/next
```
打开站点配置文件`_config.yml`，找到`theme： landscape`，修改为`next`就可以了。