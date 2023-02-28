---
categories:
- asset management
date: "2018-07-14"
description: Hugo パイプでは、あらゆる CSS、JS、JSON、HTML、SVG、XML リソースをミニファイ (minify) できます。
draft: false
keywords: []
menu:
  docs:
    parent: pipes
    weight: 50
publishdate: "2018-07-14"
sections_weight: 50
title: アセットのミニファイ
weight: 50
---

前述のタイプのリソースはすべて、リソースオブジェクトを引数に取る `resources.Minify` を使用してミニファイできます。

```go-html-template
{{ $css := resources.Get "css/main.css" }}
{{ $style := $css | resources.Minify }}
```

なお、`hugo --minify` を実行することでも、最終的な HTML 出力を `/public` にミニファイできることに注意してください。
