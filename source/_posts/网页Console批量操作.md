---
title: 网页Console操作
date: 2019-03-29 17:11:09
categories:
  - Web
  - Console
tags:
  - 脚本
abbrlink: d97143a2
---
# 按钮点击事件模拟
根据 `class` 属性
```javascript
var e = document.createEvent("MouseEvents");
e.initEvent("click", true, true);
document.getElementsByClassName("class_id")[0].dispatchEvent(e);
```
根据 `id` 属性
```javascript
document.getElementById(id).click();
```

# 批量勾选选框
最直接的方法是抓取所有的输入，只过滤复选框，并设置checked属性。
```javascript
var allInputs = document.getElementsByTagName("input");
for (var i = 0, max = allInputs.length; i < max; i++){
    if (allInputs[i].type === 'checkbox')
        allInputs[i].checked = true;
}
```
或以下两种方法进行全选。
```javascript
$("input[type='checkbox']").prop("checked", true);
$(":checkbox").prop("checked", true);
```