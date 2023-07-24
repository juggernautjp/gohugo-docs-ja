---
categories:
- function
date: "2018-11-28"
description: Base は、パスの最後の要素を返します。
draft: false
keywords:
- path
- base
lastmod: "2018-11-28"
menu:
  docs:
    parent: function
publishdate: "2018-11-28"
relatedfuncs:
- path.BaseName
- path.Clean
- path.Dir
- path.Ext
- path.Join
- path.Split
signature:
- path.Base PATH
title: path.Base
---

`path.Base` は、 `PATH` の最後の要素を返します。

`PATH` が空の場合、`.` が返されます。

**注意:** Windows では、`PATH` はスラッシュ (`/`) セパレーターに変換されます。

```go-html-template
{{ path.Base "a/news.html" }} → "news.html"
{{ path.Base "news.html" }} → "news.html"
{{ path.Base "a/b/c" }} → "c"
{{ path.Base "/x/y/z/" }} → "z"
```
