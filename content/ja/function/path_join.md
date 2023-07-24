---
categories:
- function
date: "2018-11-28"
description: パス要素を 1 つのパスに結合します。
draft: false
keywords:
- path
- join
lastmod: "2018-11-28"
menu:
  docs:
    parent: function
publishdate: "2018-11-28"
relatedfuncs:
- path.Base
- path.BaseName
- path.Clean
- path.Dir
- path.Ext
- path.Split
signature:
- "path.Join ELEMENT..."
title: path.Join
---

`path.Join` は、必要に応じて区切りのスラッシュを追加して、パス要素を 1 つのパスに結合します。
空文字列はすべて無視されます。

**注意:** Windows のパス要素はす、べてスラッシュ　('/') セパレーターに変換されます。

```go-html-template
{{ path.Join "partial" "news.html" }} → "partial/news.html"
{{ path.Join "partial/" "news.html" }} → "partial/news.html"
{{ path.Join "foo/baz" "bar" }} → "foo/baz/bar"
```
