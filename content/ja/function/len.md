---
categories:
- function
date: "2017-02-01"
description: 変数の型に応じた長さを返します。
draft: false
hugoversion: null
keywords: []
lastmod: "2017-04-18"
menu:
  docs:
    parent: function
publishdate: "2017-02-01"
relatedfuncs: []
signature:
- len INPUT
title: len
---

文字列の場合は、以下のようになります。

```go-html-template
{{ "ab" | len }} → 2
{{ "" | len }} → 0
```

スライスの場合は、以下のようになります。

```go-html-template
{{ slice "a" "b" | len }} → 2
{{ slice | len }} → 0
```

マップの場合は、以下のようになります。

```go-html-template
{{ dict "a" 1 "b" 2  | len }} → 2
{{ dict | len }} → 0
```

コレクションの場合は、以下のようになります。

```go-html-template
{{ site.RegularPages | len }} → 42
```

以下の方法でコレクション内のページ数を決定することもできます。

```go-html-template
{{ site.RegularPages.Len }} → 42
```
