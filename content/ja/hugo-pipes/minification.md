---
categories:
- asset management
date: "2018-07-14"
description: 指定されたリソースを最小化します。
draft: false
keywords: []
menu:
  docs:
    parent: hugo-pipes
    weight: 80
publishdate: "2018-07-14"
title: ミニファイ
linkTitle: アセットのミニファイ
weight: 80
---

## 使用方法 {#usage}

CSS、JS、JSON、HTML、SVG、または XML リソースは `resources.Minify` を使って最小化することができます。

```go-html-template
{{ $css := resources.Get "css/main.css" }}
{{ $style := $css | resources.Minify }}
```

なお、`hugo --minify` を実行することでも、最終的な HTML 出力を `/public` にミニファイできることに注意してください。
