---
categories:
- asset management
date: "2018-07-14"
description: 文字列からリソースを作成します。
draft: false
keywords: []
linkTitle: 文字列からのリソース
menu:
  docs:
    parent: hugo-pipes
    weight: 110
publishdate: "2018-07-14"
title: FromString
weight: 110
---

## 使用方法 {#usage}

`resources.FromString` を使用して、テンプレートから直接リソースを作成することができます。
これは、作成されたリソースのターゲット パスと指定されたコンテンツ文字列の 2 つの引数を取ります。

結果は、ターゲット パスをキャッシュ キーとして使用してキャッシュされます。

以下の例では、各プロジェクトの言語用にローカライズされた変数を含むリソースファイルを作成します。

```go-html-template
{{ $string := (printf "var rootURL = '%s'; var apiURL = '%s';" (absURL "/") (.Param "API_URL")) }}
{{ $targetPath := "js/vars.js" }}
{{ $vars := $string | resources.FromString $targetPath }}
{{ $global := resources.Get "js/global.js" | resources.Minify }}

<script src="{{ $vars.Permalink }}"></script>
<script src="{{ $global.Permalink }}"></script>
```
