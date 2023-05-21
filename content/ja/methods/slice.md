---
aliases: []
categories:
- functions
date: "2017-02-01"
deprecated: false
description: 渡されたすべての引数のスライス (配列) を作成します。
draft: false
hugoversion: null
keywords:
- slice
- array
- interface
lastmod: "2017-02-01"
menu:
  docs:
    parent: functions
publishdate: "2017-02-01"
relatedfuncs: []
signature:
- slice ITEM...
title: slice
toc: false
workson: []
---

1 つの使用例は、以下のような、[`delimit` 関数][`delimit` function] と組み合わせた要素の連結です。

{{< code file="slice.html" >}}
{{ $sliceOfStrings := slice "foo" "bar" "buzz" }}
<!-- スライス [ "foo", "bar", "buzz"] を返します -->
{{ delimit ($sliceOfStrings) ", " }}
<!-- 文字列 "foo, bar, buzz" を返します -->
{{< /code >}}


[`delimit` function]: /functions/delimit/
