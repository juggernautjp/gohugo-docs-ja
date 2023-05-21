---
aliases: []
categories:
- functions
date: "2017-02-01"
deprecated: false
description: スライスまたは配列を受け取り、後続の重複要素を削除したスライスを返します。
draft: false
hugoversion: null
keywords:
- multilingual
- i18n
- urls
lastmod: "2017-02-01"
linktitle: uniq
menu:
  docs:
    parent: functions
publishdate: "2017-02-01"
relatedfuncs: []
signature:
- uniq SET
title: uniq
workson: []
---

```go-html-template
{{ uniq (slice 1 2 3 2) }}
{{ slice 1 2 3 2 | uniq }}
<!-- 上記は、どちらも [1 2 3] を返します -->
```
