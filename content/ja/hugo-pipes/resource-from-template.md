---
categories:
- asset management
date: "2018-07-14"
description: Hugo パイプでは、Go テンプレートを使用してアセットファイルからリソースを作成できます。
draft: false
keywords: []
linkTitle: テンプレートからのリソース
menu:
  docs:
    parent: pipes
    weight: 80
publishdate: "2018-07-14"
sections_weight: 80
title: テンプレートからリソースを作成する
weight: 80
---

Go テンプレートマジックを含むアセットファイルで Hugo パイプの関数を使用するには、 `resources.ExecuteAsTemplate` 関数を使用する必要があります。

この関数は、リソースターゲットのパス、テンプレート コンテキスト、およびリソースオブジェクトの 3 つの引数を取ります。

```go-html-template
// assets/sass/template.scss
$backgroundColor: {{ .Param "backgroundColor" }};
$textColor: {{ .Param "textColor" }};
body{
  background-color:$backgroundColor;
  color: $textColor;
}
// [...]
```

```go-html-template
{{ $sassTemplate := resources.Get "sass/template.scss" }}
{{ $style := $sassTemplate | resources.ExecuteAsTemplate "main.scss" . | resources.ToCSS }}
```
