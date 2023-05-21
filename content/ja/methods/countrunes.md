---
categories:
- functions
date: "2017-02-01"
deprecated: false
description: 空白を除いた文字列内のルーンの個数を決定します。
draft: false
hugoversion: null
keywords:
- counting
- word count
lastmod: "2017-02-01"
menu:
  docs:
    parent: functions
publishdate: "2017-02-01"
relatedfuncs: []
signature:
- "countrunes INPUT"
- "strings.CountRunes INPUT"
title: countrunes
workson: []
---

文字列中のすべての単語を数える `countwords` 関数とは対照的に、 `countrunes` 関数は、コンテンツ内のルーンの数を決定し、空白を除外します。これは、日中韓 (CJK) のような言語を扱う場合に特に有用です。

```go-html-template
{{ "Hello, 世界" | countrunes }}
<!-- outputs a content length of 8 runes. -->
```

[pagevars]: /variables/page/
