---
aliases: []
categories:
- functions
date: "2017-02-01"
deprecated: false
description: 指定された文字列を Markdown プロセッサーを介して実行します。
draft: false
hugoversion: null
keywords:
- markdown
- content
lastmod: "2017-02-01"
linktitle: markdownify
menu:
  docs:
    parent: functions
publishdate: "2017-02-01"
relatedfuncs: []
signature:
- markdownify INPUT
title: markdownify
workson: []
---


```go-html-template
{{ .Title | markdownify }}
```

{{< new-in "0.93.0" >}} **注意**: `markdownify` は [.RenderString](/functions/renderstring/) と同様に [レンダーフック][Render Hooks] をサポートするようになりました。

[Render Hooks]: /templates/render-hooks/
