---
aliases: []
categories:
- function
date: "2017-02-01"
description: カットセットに含まれる末尾の文字をすべて削除した、文字列のスライスを返します。
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
- strings.TrimRight CUTSET STRING
title: strings.TrimRight
---

文字列 `"abba"` を指定すると、末尾の `"a"` を以下のように削除できます。

```go-html-template
    {{ strings.TrimRight "a" "abba" }} → "abb"
```

以下のように、数値も同様に処理できます。

```go-html-template
    {{ strings.TrimRight 12 1221341221 }} → "122134"
```
