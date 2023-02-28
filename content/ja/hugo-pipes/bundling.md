---
categories:
- asset management
date: "2018-07-14"
description: Hugo パイプは、任意の数のアセットをまとめてバンドルできます。
draft: false
keywords: []
lastmod: "2018-07-14"
menu:
  docs:
    parent: pipes
    weight: 60
publishdate: "2018-07-14"
sections_weight: 60
title: アセットバンドル
weight: 60
---

同じ MIME タイプのアセットファイルは、ターゲットパスとリソース オブジェクトのスライスの 2つの引数を取る `resources.Concat` を使用して 1 つのリソースにバンドルできます。

```go-html-template
{{ $plugins := resources.Get "js/plugins.js" }}
{{ $global := resources.Get "js/global.js" }}
{{ $js := slice $plugins $global | resources.Concat "js/bundle.js" }}
```
