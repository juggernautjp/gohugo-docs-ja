---
categories:
- function
date: "2017-02-01"
description: 渡されたすべての引数のスライス (配列) を作成します。
draft: false
keywords:
- slice
- array
- interface
lastmod: "2017-02-01"
menu:
  docs:
    parent: function
publishdate: "2017-02-01"
relatedfuncs: []
signature:
- slice ITEM...
title: slice
toc: false
---

1 つの使用例は、以下のような、[`delimit` 関数][`delimit` function] と組み合わせた要素の連結です。

{{< code file="slice.html" >}}
{{ $sliceOfStrings := slice "foo" "bar" "buzz" }}
<!-- スライス [ "foo", "bar", "buzz"] を返します -->
{{ delimit ($sliceOfStrings) ", " }}
<!-- 文字列 "foo, bar, buzz" を返します -->
{{< /code >}}


[`delimit` function]: /function/delimit/
