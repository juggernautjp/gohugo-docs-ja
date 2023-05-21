---
aliases: []
categories:
- functions
date: "2017-02-01"
deprecated: false
description: 指定された文字列を、予約された HTML コードにエスケープして返します。
draft: false
hugoversion: null
keywords:
- strings
- html
lastmod: "2017-02-01"
linktitle: null
menu:
  docs:
    parent: functions
publishdate: "2017-02-01"
relatedfuncs:
- htmlUnescape
signature:
- htmlEscape INPUT
title: htmlEscape
workson: []
---

結果では、`&` は `&amp;` となり、以下同様となります。 これは、`<`、`>`、`&`、`'`、`"` のみをエスケープします。

```go-html-template
{{ htmlEscape "Hugo & Caddy > WordPress & Apache" }} → "Hugo &amp; Caddy &gt; WordPress &amp; Apache"
```
