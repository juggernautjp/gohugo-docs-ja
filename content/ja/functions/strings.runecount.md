---
aliases: []
categories:
- functions
date: "2018-06-01"
deprecated: false
description: 文字列に含まれるルーンの数を決定します。
draft: false
hugoversion: null
keywords:
- counting
- character count
- length
- rune length
- rune count
lastmod: "2018-06-01"
menu:
  docs:
    parent: functions
publishdate: "2018-06-01"
relatedfuncs:
- len
- countrunes
signature:
- strings.RuneCount INPUT
title: strings.RuneCount
workson: []
---

ルーンを数える前に HTML や空白文字を取り除く `strings.CountRunes` 関数とは対照的に、 `strings.RuneCount` は単純に文字列内のすべてのルーンを数えます。 これは、 Go の [`utf8.RuneCountInString`] 関数に依存しています。

```go-html-template
{{ "Hello, 世界" | strings.RuneCount }}
<!-- コンテンツ長として 9 個のルーンを出力します -->
```

[`utf8.RuneCount`]: https://golang.org/pkg/unicode/utf8/#RuneCount
