---
categories:
- function
date: "2017-02-01"
description: 指定された文字列を、HTML エスケープコードをアンエスケープして返します。
draft: false
keywords: []
lastmod: "2017-02-01"
menu:
  docs:
    parent: function
publishdate: "2017-02-01"
relatedfuncs:
- htmlEscape
signature:
- htmlUnescape INPUT
title: htmlUnescape
---

`htmlUnescape` は、指定された文字列の HTML エスケープコードをアンエスケープして返します。

完全にエスケープされていない文字が必要な場合は、この出力を `safeHTML` に渡すことを覚えておいてください。 それ以外の場合、出力は通常通り再びエスケープされます。

```go-html-template
{{ htmlUnescape "Hugo &amp; Caddy &gt; WordPress &amp; Apache" }} → "Hugo & Caddy > WordPress & Apache"
```
