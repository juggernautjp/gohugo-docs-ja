---
aliases: []
categories:
- functions
date: "2017-02-01"
deprecated: false
description: 指定された文字の位置から文字列の一部を抽出し、指定された文字数を返します。
draft: false
hugoversion: null
keywords:
- strings
lastmod: "2017-02-01"
menu:
  docs:
    parent: functions
publishdate: "2017-02-01"
relatedfuncs: []
signature:
- "substr STRING START [LENGTH]"
- "strings.Substr STRING START [LENGTH]"
title: substr
workson: []
---

通常、`start` と `length` の 2 つのパラメータを取ります。 また、`start` という 1 つのパラメータを取ることもできます。つまり、 `length` が省略された場合は、文字列の先頭から末尾までの部分文字列が返されます。

文字列の末尾から文字を抽出する場合は、負の開始番号を使用します。

`length` が与えられ、それが負の場合、その文字数は文字列の末尾から省略されます。

```go-html-template
{{ substr "abcdef" 0 }} → "abcdef"
{{ substr "abcdef" 1 }} → "bcdef"

{{ substr "abcdef" 0 1 }} → "a"
{{ substr "abcdef" 1 1 }} → "b"

{{ substr "abcdef" 0 -1 }} → "abcde"
{{ substr "abcdef" 1 -1 }} → "bcde"

{{ substr "abcdef" -1 }} → "f"
{{ substr "abcdef" -2 }} → "ef"

{{ substr "abcdef" -1 1 }} → "f"
{{ substr "abcdef" -2 1 }} → "e"

{{ substr "abcdef" -3 -1 }} → "de"
{{ substr "abcdef" -3 -2 }} → "d"
```
