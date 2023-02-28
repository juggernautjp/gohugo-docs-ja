---
aliases:
- sha1
- sha256
categories:
- functions
date: "2017-02-01"
deprecated: false
description: 指定された入力をハッシュし、SHA1 または SHA256 チェックサムを返します。
draft: false
hugoversion: null
keywords:
- sha
- checksum
lastmod: "2017-02-01"
menu:
  docs:
    parent: functions
publishdate: "2017-02-01"
relatedfuncs:
- md5
signature:
- sha1 INPUT
- sha256 INPUT
title: sha
workson: []
---

`sha1` は、指定された入力をハッシュし、その SHA1 チェックサムを返します。

```go-html-template
{{ sha1 "Hello world, gophers!" }}
<!-- 文字列 "c8b5b0e33d408246e30f53e32b8f7627a7a649d4" を返します -->
```

`sha256` は、指定された入力をハッシュし、その SHA256 チェックサムを返します。

```go-html-template
{{ sha256 "Hello world, gophers!" }}
<!-- 文字列 "6ec43b78da9669f50e4e422575c54bf87536954ccd58280219c393f2ce352b46" を返します -->
```
