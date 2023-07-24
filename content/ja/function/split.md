---
categories:
- function
date: "2017-02-01"
description: STRING を DELIM で分割して、文字列のスライスを返します。
draft: false
keywords:
- strings
lastmod: "2022-11-06"
menu:
  docs:
    parent: function
publishdate: "2017-02-01"
relatedfuncs: []
signature:
- split STRING DELIM
title: split
---

例:

```go-html-template
{{ split "tag1,tag2,tag3" "," }} → ["tag1", "tag2", "tag3"]
{{ split "abc" "" }} → ["a", "b", "c"]
```


{{% note %}}
`split` は基本的に、[delimit](/function/delimit) の逆を行います。
`split` が文字列からスライスを作成するのに対して、 `delimit` はスライスから文字列を作成します。
{{% /note %}}
