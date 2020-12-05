---
title: 文档 | HEXO
date: 2019-04-02 18:20:22
categories:
  - Web
  - 博客
tags:
  - Hexo
abbrlink: ffbd0586
updated:
---
# 引用
标签插件和 `Front-matter` 中的标签不同，它们是用于在文章中快速插入特定内容的插件。
<!--more-->

## 引用块
在文章中插入引言，可包含作者、来源和标题。
**别号：** quote

```nohilight
{% blockquote [author[, source]] [link] [source_link_title] %}
content
{% endblockquote %}
```

### 样例

**没有提供参数，则只输出普通的 blockquote**

```nohilight
{% blockquote %}
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque hendrerit lacus ut purus iaculis feugiat. Sed nec tempor elit, quis aliquam neque. Curabitur sed diam eget dolor fermentum semper at eu lorem.
{% endblockquote %}
```

{% blockquote %}
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque hendrerit lacus ut purus iaculis feugiat. Sed nec tempor elit, quis aliquam neque. Curabitur sed diam eget dolor fermentum semper at eu lorem.
{% endblockquote %}

**引用书上的句子**

```nohilight
{% blockquote David Levithan, Wide Awake %}
Do not just seek happiness for yourself. Seek happiness for all. Through kindness. Through mercy.
{% endblockquote %}
```

{% blockquote David Levithan, Wide Awake %}
Do not just seek happiness for yourself. Seek happiness for all. Through kindness. Through mercy.
{% endblockquote %}

**引用 Twitter**

```nohilight
{% blockquote @DevDocs https://twitter.com/devdocs/status/356095192085962752 %}
NEW: DevDocs now comes with syntax highlighting. http://devdocs.io
{% endblockquote %}
```

{% blockquote @DevDocs https://twitter.com/devdocs/status/356095192085962752 %}
NEW: DevDocs now comes with syntax highlighting. http://devdocs.io
{% endblockquote %}

**引用网络上的文章**

```nohilight
{% blockquote Seth Godin http://sethgodin.typepad.com/seths_blog/2009/07/welcome-to-island-marketing.html Welcome to Island Marketing %}
Every interaction is both precious and an opportunity to delight.
{% endblockquote %}
```

{% blockquote Seth Godin http://sethgodin.typepad.com/seths_blog/2009/07/welcome-to-island-marketing.html Welcome to Island Marketing %}
Every interaction is both precious and an opportunity to delight.
{% endblockquote %}

## 代码块

在文章中插入代码。

**别名：** code

```nohilight
{% codeblock [title] [lang:language] [url] [link text] %}
code snippet
{% endcodeblock %}
```

### 样例

**普通的代码块**

```nohilight
{% codeblock %}
alert('Hello World!');
{% endcodeblock %}
```

{% codeblock %}
alert('Hello World!');
{% endcodeblock %}

**指定语言**

```nohilight
{% codeblock lang:objc %}
[rectangle setX: 10 y: 10 width: 20 height: 20];
{% endcodeblock %}
```

{% codeblock lang:objc %}
[rectangle setX: 10 y: 10 width: 20 height: 20];
{% endcodeblock %}

**附加说明**

```nohilight
{% codeblock Array.map %}
array.map(callback[, thisArg])
{% endcodeblock %}
```

{% codeblock Array.map %}
array.map(callback[, thisArg])
{% endcodeblock %}

**附加说明和网址**

```nohilight
{% codeblock _.compact http://underscorejs.org/#compact Underscore.js %}
_.compact([0, 1, false, 2, '', 3]);
=> [1, 2, 3]
{% endcodeblock %}
```

{% codeblock _.compact http://underscorejs.org/#compact Underscore.js %}
_.compact([0, 1, false, 2, '', 3]);
=> [1, 2, 3]
{% endcodeblock %}

## 反引号代码块

另一种形式的代码块，不同的是它使用三个反引号来包裹。

{% raw %}
&#96`` [language] [title] [url] [link text]
code snippet
&#96;``
{% endraw %}

## Pull Quote

在文章中插入 Pull quote。

```
{% pullquote [class] %}
content
{% endpullquote %}
```

## jsFiddle

在文章中嵌入 jsFiddle。

```nohilight
{% jsfiddle shorttag [tabs] [skin] [width] [height] %}
```

## Gist

在文章中嵌入 Gist。

```nohilight
{% gist gist_id [filename] %}
```

## iframe

在文章中插入 iframe。

```nohilight
{% iframe url [width] [height] %}
```

## Image

在文章中插入指定大小的图片。

```nohilight
{% img [class names] /path/to/image [width] [height] [title text [alt text]] %}
```

## Link

在文章中插入链接，并自动给外部链接添加 `target="_blank"` 属性。

```nohilight
{% link text url [external] [title] %}
```

## Include Code

插入 `source` 文件夹内的代码文件。

```nohilight
{% include_code [title] [lang:language] path/to/file %}
```

## Youtube

在文章中插入 Youtube 视频。

```nohilight
{% youtube video_id %}
```

## Vimeo

在文章中插入 Vimeo 视频。

```nohilight
{% vimeo video_id %}
```

## 引用文章

引用其他文章的链接。

```nohilight
{% post_path slug %}
{% post_link slug [title] %}
```

## 引用资源

引用文章的资源。

```nohilight
{% asset_path slug %}
{% asset_img slug [title] %}
{% asset_link slug [title] %}
```

## Raw

如果您想在文章中插入 Swig 标签，可以尝试使用 Raw 标签，以免发生解析异常。

```nohilight
{% raw %}
content
{% endraw %}
```

# 语法
## 标题
```nohilight
# 这是一级标题
## 这是二级标题
### 这是三级标题
#### 这是四级标题
##### 这是五级标题
###### 这是六级标题
```
## 字体
```nohilight
*这是倾斜的文字*
**这是加粗的文字**
***这是斜体加粗的文字***
~~这是加删除线的文字~~
```

## 引用
```nohilight
>这是引用的内容
>>这是引用的内容
>>>这是引用的内容
>>>>这是引用的内容
......
```
## 分割线
```nohilight
---
----
***
*****
然而没什么卵用，效果都一样。
```

## 图片
语法：
```nohilight
![图片ALT](图片URL "图片title")
图片alt就是显示在图片下面的文字，相当于对图片内容的解释。
图片title是图片的标题，当鼠标移到图片上时显示的内容,可不填。
```
效果：
![示例图片](https://s.gravatar.com/avatar/4756cb352ec7f58884fdc0c219ea00dc?s=80 "亦往沧劫")

## 超链接
```nohilight
[显示名称](超链接URL "超链接title")
title可不加。
```

## 列表
示例:
```nohilight
- 无序列表
   1.有序列表
   2.有序列表
- 无序列表
   1.有序列表
   2.有序列表
```
效果:
- 无序列表
   1.有序列表
   2.有序列表
- 无序列表
   1.有序列表
   2.有序列表

## 表格
示例:
```nohilight
表头|表头|表头
---|:--:|---:
内容|内容|内容
内容|内容|内容

第二行分割表头和内容。
- 有一个就行，为了对齐，多加了几个
文字默认居左
-两边加：表示文字居中
-右边加：表示文字居右
注：原生的语法两边都要用 | 包起来。此处省略!
```
效果:

表头|表头|表头
---|:--:|---:
内容|内容|内容
内容|内容|内容
