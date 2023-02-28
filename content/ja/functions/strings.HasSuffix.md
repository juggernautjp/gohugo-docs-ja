---
aliases: []
categories:
- functions
date: "2019-08-13"
deprecated: false
description: 指定された文字列が、指定された末尾のサフィックス文字列で終わっているかどうかを判断します。
draft: false
hugoversion: null
keywords:
- strings
lastmod: "2019-08-13"
menu:
  docs:
    parent: functions
publishdate: "2019-08-13"
relatedfuncs:
- hasPrefix
signature:
- strings.HasSuffix STRING SUFFIX
title: strings.HasSuffix
workson: []
---

```go-html-template
    {{ $pdfPath := "/path/to/some.pdf" }}
    {{ strings.HasSuffix $pdfPath "pdf" }} → true
    {{ strings.HasSuffix $pdfPath "txt" }} → false
```