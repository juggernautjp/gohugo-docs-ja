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
    parent: hugo-pipes
    weight: 90
publishdate: "2018-07-14"
title: Concat
linkTitle: アセットの連結
weight: 90
signature: ["resources.Concat TARGET_PATH SLICE_RESOURCES"]
---

## 使用方法 {#usage}

同じ MIME タイプのアセットファイルは、作成されたリソースバンドルのターゲット パスと連結されるリソース オブジェクトのスライスという 2 つの引数を取る `resources.Concat` を使用して 1 つのリソースにバンドルできます。

```go-html-template
{{ $plugins := resources.Get "js/plugins.js" }}
{{ $global := resources.Get "js/global.js" }}
{{ $js := slice $plugins $global | resources.Concat "js/bundle.js" }}
```
