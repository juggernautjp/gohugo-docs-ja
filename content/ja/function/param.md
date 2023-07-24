---
aliases: []
categories:
- function
date: "2017-02-01"
description: ページ パラメータを返し、サイト パラメータが存在する場合はフォールバックします。
draft: false
keywords:
- front matter
- params
lastmod: "2017-04-30"
menu:
  docs:
    parent: function
publishdate: "2017-02-01"
signature:
- .Param KEY
title: .Param
---

`.Page` の `.Param` メソッドは、ページ パラメータで指定された `KEY` を検索し、対応する値を返します。
ページパラメータで `KEY` が見つからない場合は、サイトパラメータで `KEY` を探します。
どちらの場所でも `KEY` が見つからない場合、`.Param` メソッドは `nil` を返します。

サイトおよびテーマの開発者は通常、サイトレベルでパラメータを設定し、コンテンツ作成者がページレベルでそれらのパラメータをオーバーライドできるようにします。

たとえば、すべてのページに目次を表示し、必要に応じて作成者が目次を非表示にできるようにするには、以下のようにします。

**設定ファイル (Configuration)**

{{< code-toggle file="hugo" copy=false >}}
[params]
display_toc = true
{{< /code-toggle >}}

**コンテンツ (Content)**

{{< code-toggle file="content/example.md" fm=true copy=false >}}
title = 'Example'
date = 2023-01-01
draft = false
display_toc = false
{{< /code-toggle >}}

**テンプレート (Template)**

{{< code file="layouts/_default/single.html" copy=false >}}
{{ if .Param "display_toc" }}
  {{ .TableOfContents }}
{{ end }}
{{< /code >}}

`.Param` メソッドは、値が真か偽かに関係なく、指定された `KEY` に関連付けられた値を返します。 
偽の値を無視する必要がある場合は、代わりに以下の構成を使用します。

{{< code file="layouts/_default/single.html" copy=false >}}
{{ or .Params.foo site.Params.foo }}
{{< /code >}}
