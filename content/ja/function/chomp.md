---
categories:
- function
date: "2017-02-01"
description: 末尾の改行文字をすべて削除します。
draft: false
keywords:
- trim
lastmod: "2017-02-01"
menu:
  docs:
    parent: function
publishdate: "2017-02-01"
relatedfuncs:
- truncate
signature:
- chomp INPUT
- "strings.Chomp INPUT"
title: chomp
toc: true
---

パイプラインで、他の処理によって追加された改行を削除するのに役立ちます (たとえば、 [`markdownify`](/function/markdownify/))。

```go-html-template
{{ chomp "<p>Blockhead</p>\n" }} → "<p>Blockhead</p>"
```
