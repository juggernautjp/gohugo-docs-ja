---
categories:
- function
date: "2017-02-01"
description: 引数の最初の文字を大文字にして、人間化したバージョンを返します。
draft: false
keywords:
- strings
- casing
lastmod: "2017-02-01"
menu:
  docs:
    parent: function
publishdate: "2017-02-01"
relatedfuncs:
- anchorize
signature:
- humanize INPUT
title: humanize
---

入力が int64 値または整数の文字列表現である場合、humanize は適切な序数を付加した数値を返します。


```go-html-template
{{ humanize "my-first-post" }} → "My first post"
{{ humanize "myCamelPost" }} → "My camel post"
{{ humanize "52" }} → "52nd"
{{ humanize 103 }} → "103rd"
```
