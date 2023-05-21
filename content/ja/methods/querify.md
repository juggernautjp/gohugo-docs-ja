---
aliases: []
categories:
- functions
date: "2017-02-01"
deprecated: false
description: キーと値のペアのセットまたはスライスを受け取り、URL に追加するクエリ文字列を返します。
draft: false
hugoversion: null
keywords:
- urls
lastmod: "2017-02-01"
linktitle: querify
menu:
  docs:
    parent: functions
publishdate: "2017-02-01"
relatedfuncs: []
signature:
- querify KEY VALUE [KEY VALUE]...
- querify COLLECTION
title: querify
workson: []
---

`querify` は、キーと値のペアのセットまたはスライスを受け取り、URL に追加できる [クエリ文字列](https://en.wikipedia.org/wiki/Query_string) を返します。

以下の例では、Google の検索結果ページへのリンクを作成しています。

```go-html-template
<a href="https://www.google.com?{{ (querify "q" "test" "page" 3) | safeURL }}">検索</a>

{{ $qs := slice "q" "test" "page" 3 }}
<a href="https://www.google.com?{{ (querify $qs) | safeURL }}">検索</a>
```

上記の例は両方とも、以下の HTML をレンダリングします。

```html
<a href="https://www.google.com?page=3&q=test">検索</a>
```
