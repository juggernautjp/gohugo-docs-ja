---
categories:
- functions
date: "2018-11-28"
deprecated: false
description: Dir は、パスの最後の要素を除くすべてを返します。
draft: false
hugoversion: "0.40"
keywords:
- path
- dir
lastmod: "2018-11-28"
menu:
  docs:
    parent: functions
publishdate: "2018-11-28"
relatedfuncs:
- path.Base
- path.BaseName
- path.Clean
- path.Ext
- path.Join
- path.Split
signature:
- path.Dir PATH
title: path.Dir
workson: []
---

`path.Dir` は、 `PATH` の最後の要素を除くすべての要素、通常は `PATH` のディレクトリを返します。

返されるパスは、決してスラッシュで終わることはありません。
`PATH` が空の場合、`.` が返されます。

**注意:** Windows では、`PATH` はスラッシュ (`/`) セパレーターに変換されます。

```go-html-template
{{ path.Dir "a/news.html" }} → "a"
{{ path.Dir "news.html" }} → "."
{{ path.Dir "a/b/c" }} → "a/b"
{{ path.Dir "/x/y/z" }} → "/x/y"
```
