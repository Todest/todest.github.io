---
title: Excel函数用法
date: 2019-06-27 14:18:41
categories:
  - 软件
  - Excel
abbrlink: bd210d73
---
# VLOOKUP
**用途**：搜索表区域首列满足条件的元素，确定待检索单元格在区域中的行序号，再进一步返回选定单元格的值。默认情况下，表是以升序排序的。

**用法**：

| 参数 | 含义 |
|:-|:-|
|lookup_value|搜索条件|
|table_array|搜索区域|
|col_index_num|待返回单元格在搜索区域中的列序号|
|range_lookup|匹配模式【可选】|

**示例**：
```
=VLOOKUP(A2,sheet1!$B2:$O50,3,FALSE)
```
