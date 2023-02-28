---
categories:
- functions
date: "2017-02-01"
deprecated: false
description: 末尾の改行文字をすべて削除します。
draft: false
hugoversion: null
keywords:
- trim
lastmod: "2017-02-01"
menu:
  docs:
    parent: functions
publishdate: "2017-02-01"
relatedfuncs:
- truncate
signature:
- chomp INPUT
- "strings.Chomp INPUT"
title: chomp
toc: true
workson: []
---

パイプラインで、他の処理によって追加された改行を削除するのに役立ちます (たとえば、 [`markdownify`](/functions/markdownify/))。

```go-html-template
{{chomp "<p>Blockhead</p>\n"}} → "<p>Blockhead</p>"
```
