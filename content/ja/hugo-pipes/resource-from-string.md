---
categories:
- asset management
date: "2018-07-14"
description: Hugo パイプでは、文字列からリソースを作成できます。
draft: false
keywords: []
linkTitle: 文字列からのリソース
menu:
  docs:
    parent: pipes
    weight: 90
publishdate: "2018-07-14"
sections_weight: 90
title: 文字列からリソースを作成する
weight: 90
---

指定された文字列とリソースのターゲットパスの 2 つの引数を取る `resources.FromString` を使用して、テンプレートから直接リソースを作成できます。

以下の例では、各プロジェクトの言語用にローカライズされた変数を含むリソースファイルを作成します。

```go-html-template
{{ $string := (printf "var rootURL = '%s'; var apiURL = '%s';" (absURL "/") (.Param "API_URL")) }}
{{ $targetPath := "js/vars.js" }}
{{ $vars := $string | resources.FromString $targetPath }}
{{ $global := resources.Get "js/global.js" | resources.Minify }}

<script src="{{ $vars.Permalink }}"></script>
<script src="{{ $global.Permalink }}"></script>
```
