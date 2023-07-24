---
aliases: []
categories:
- function
date: "2017-02-01"
description: カットセットに含まれるすべての先頭文字を削除した、指定された文字列のスライスを返します。
draft: false
keywords:
- strings
lastmod: "2017-02-01"
menu:
  docs:
    parent: function
publishdate: "2017-02-01"
relatedfuncs:
- strings.TrimRight
signature:
- strings.TrimLeft CUTSET STRING
title: strings.TrimLeft
---

文字列 `"abba"` が与えられたとき、先頭の `"a"` は以下のように削除できます。

```go-html-template
    {{ strings.TrimLeft "a" "abba" }} → "bba"
```

以下のように、数値も同様に処理できます。

```go-html-template
    {{ strings.TrimLeft 12 1221341221 }} → "341221"
```
