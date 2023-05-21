---
categories:
- functions
date: "2022-06-04"
deprecated: false
description: BaseName はパスの最後の要素を返し、拡張子がある場合は拡張子を削除します。
draft: false
keywords:
- path
- base
menu:
  docs:
    parent: functions
relatedfuncs:
- path.Base
- path.Clean
- path.Dir
- path.Ext
- path.Join
- path.Split
signature:
- path.BaseName PATH
title: path.BaseName
---

`PATH` が空の場合、`.` が返されます。

**注意:** Windows では、`PATH` はスラッシュ (`/`) セパレーターに変換されます。

```go-html-template
{{ path.BaseName "a/news.html" }} → "news"
{{ path.BaseName "news.html" }} → "news"
{{ path.BaseName "a/b/c" }} → "c"
{{ path.BaseName "/x/y/z/" }} → "z"
```
