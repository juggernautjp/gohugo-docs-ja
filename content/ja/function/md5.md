---
categories:
- function
date: "2017-02-01"
description: 指定された入力をハッシュし、その MD5 チェックサムを返します。
draft: false
keywords: []
lastmod: "2017-02-01"
menu:
  docs:
    parent: function
publishdate: "2017-02-01"
relatedfuncs:
- sha
signature:
- md5 INPUT
title: md5
---

```go-html-template
{{ md5 "Hello world, gophers!" }}
<!-- 文字列 "b3029f756f98f79e7f1b7f1d1f0dd53b" を返します -->
```

これは、[Gravatar](https://en.gravatar.com/) を使用して一意のアバターを生成する場合に役立ちます。

```html
<img src="https://www.gravatar.com/avatar/{{ md5 "your@email.com" }}?s=100&d=identicon">
```
