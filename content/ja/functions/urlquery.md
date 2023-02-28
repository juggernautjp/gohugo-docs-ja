---
title: urlquery
linktitle: urlquery
description: 引数のテキスト表現を、URL クエリに埋め込むのに適した形式にエスケープした値を返します。
date: 2022-01-18
publishdate: 2022-01-18
lastmod: 2022-01-18
categories: [functions]
menu:
  docs:
    parent: "functions"
keywords: [urls]
signature:
- "urlquery INPUT [INPUT]..."
hugoversion:
deprecated: false
workson: []
relatedfuncs: []
aliases: []
---


以下のテンプレートコードは、

```go-html-template
{{ $u := urlquery "https://" "example.com" | safeURL }}
<a href="https://example.org?url={{ $u }}">Link</a>
```

以下のようにレンダリングされます。

```html
<a href="https://example.org?url=https%3A%2F%2Fexample.com">Link</a>
```
