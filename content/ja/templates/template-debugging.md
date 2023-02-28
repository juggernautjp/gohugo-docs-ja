---
aliases: []
categories:
- templates
date: "2017-02-01"
description: Go テンプレートの `printf` 関数を使用すると、Hugo テンプレートをデバッグできます。
  これらのスニペットは、さまざまなコンテキストで利用可能な変数をすばやく簡単に視覚化できます。
draft: false
keywords:
- debugging
- troubleshooting
menu:
  docs:
    parent: templates
    weight: 180
publishdate: "2017-02-01"
sections_weight: 180
title: テンプレートのデバッグ
toc: false
weight: 180
---

ここでは、よくある質問に答えるために、テンプレートに追加できるスニペットをいくつか紹介します。

これらのスニペットは、すべての Go テンプレートで利用可能な `printf` 関数を使用します。 この関数は Go 関数 [fmt.Printf](https://pkg.go.dev/fmt) のエイリアスです。 

## このコンテキストで使用できる変数は? {#what-variables-are-available-in-this-context}

テンプレート構文 `$.` を使用すると、テンプレート内の任意の場所からトップレベルのテンプレート コンテキストを取得できます。これは、`.Site` の下にあるすべての値を出力します。

```go-html-template
{{ printf "%#v" $.Site }}
```

以下のコードにより、`.Permalink` の値が出力されます。

```go-html-template
{{ printf "%#v" .Permalink }}
```

以下のコードは、現在のコンテキスト (`.`、別名 [「ドット」][tempintro]) にスコープされたすべての変数のリストを出力します。

```go-html-template
{{ printf "%#v" . }}
```

[ホームページ][homepage] を開発する際、ループしているページの 1 つはどのようなものでしょうか。

```go-html-template
{{ range .Pages }}
    {{/* The context, ".", is now each one of the pages as it goes through the loop */}}
    {{ printf "%#v" . }}
{{ end }}
```

## 定義済みの変数が表示されないのはなぜですか? {#why-am-i-showing-no-defined-variables}

以下のコードにより、`partial` 関数で変数を渡していることを確認します。

```go-html-template
{{ partial "header.html" }}
```

この例ではヘッダー部分テンプレートをレンダリングしますが、ヘッダー部分テンプレートはコンテキスト変数にアクセスできません。 変数を明示的に渡す必要があります。 たとえば、[「ドット」][tempintro] が追加されていることに注意してください。

```go-html-template
{{ partial "header.html" . }}
```

ドット (`.`) は、Hugo テンプレートを理解するための基本とみなされています。 詳細については、[Hugo テンプレート入門][tempintro] を参照してください。

[homepage]: /templates/homepage/
[tempintro]: /templates/introduction/
