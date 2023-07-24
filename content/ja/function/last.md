---
categories:
- function
date: "2017-02-01"
description: 配列を最後の <em>N</em> 番目の要素だけにスライスします。
draft: false
keywords: []
lastmod: "2017-02-01"
menu:
  docs:
    parent: function
publishdate: "2017-02-01"
relatedfuncs: []
signature:
- last INDEX COLLECTION
title: last
---

```go-html-template
{{ range last 10 .Pages }}
  {{ .Render "summary" }}
{{ end }}
```
