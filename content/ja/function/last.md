---
aliases: []
categories:
- functions
date: "2017-02-01"
deprecated: false
description: 配列を最後の <em>N</em> 番目の要素だけにスライスします。
draft: false
hugoversion: null
keywords: []
lastmod: "2017-02-01"
linktitle: last
menu:
  docs:
    parent: functions
publishdate: "2017-02-01"
relatedfuncs: []
signature:
- last INDEX COLLECTION
title: last
toc: null
workson:
- lists
- taxonomies
- terms
- groups
---

```go-html-template
{{ range last 10 .Pages }}
    {{ .Render "summary" }}
{{ end }}
```
