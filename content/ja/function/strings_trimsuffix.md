---
aliases: []
categories:
- function
date: "2017-02-01"
description: 指定された末尾のサフィックス文字列なしで、指定された文字列 s を返します。
  s がサフィックスで終わらない場合、s は変更されずに返されます。
draft: false
keywords:
- strings
lastmod: "2017-02-01"
menu:
  docs:
    parent: function
publishdate: "2017-02-01"
relatedfuncs:
- strings.TrimPrefix
signature:
- strings.TrimSuffix SUFFIX STRING
title: strings.TrimSuffix
---

文字列 `"aabbaa"` を指定すると、以下のように、指定されたサフィックスは `"aabbaa"` で終わる場合にのみ削除されます。

```go-html-template
    {{ strings.TrimSuffix "a" "aabbaa" }} → "aabba"
    {{ strings.TrimSuffix "aa" "aabbaa" }} → "aabb"
    {{ strings.TrimSuffix "aaa" "aabbaa" }} → "aabbaa"
```