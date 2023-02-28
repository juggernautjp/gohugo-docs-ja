---
aliases: []
categories:
- functions
date: "2017-02-01"
deprecated: false
description: 指定された先頭のプレフィックス文字列なしで、指定された文字列 s を返します。
  s がプレフィックスで始まらない場合、s は変更されずに返されます。
draft: false
hugoversion: null
keywords:
- strings
lastmod: "2017-02-01"
menu:
  docs:
    parent: functions
publishdate: "2017-02-01"
relatedfuncs:
- strings.TrimSuffix
signature:
- strings.TrimPrefix PREFIX STRING
title: strings.TrimPrefix
workson: []
---

文字列 `"aabbaa"` を指定すると、以下のように、指定されたプレフィックスは `"aabbaa"` で始まる場合にのみ削除されます。

```go-html-template
    {{ strings.TrimPrefix "a" "aabbaa" }} → "abbaa"
    {{ strings.TrimPrefix "aa" "aabbaa" }} → "bbaa"
    {{ strings.TrimPrefix "aaa" "aabbaa" }} → "aabbaa"
```