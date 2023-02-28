---
aliases:
- /extras/robots-txt/
categories:
- templates
date: "2017-02-01"
description: Hugo は、他のテンプレートと同じ方法で、カスタマイズされた robots.txt を生成できます。
draft: false
keywords:
- robots
- search engines
lastmod: "2017-02-01"
linktitle: Robots.txt
menu:
  docs:
    parent: templates
    weight: 165
publishdate: "2017-02-01"
sections_weight: 165
title: Robots.txt ファイル
toc: false
weight: 165
---

テンプレートから robots.txt ファイルを生成するには、以下のように [サイト設定][config] を変更します。

{{< code-toggle file="config">}}
enableRobotsTXT = true
{{< /code-toggle >}}

デフォルトでは、Hugo は [内部テンプレート][internal] を使用して robots.txt を生成します。

```text
User-agent: *
```

ロボット排除プロトコル (Robots Exclusion Protocol) を尊重する検索エンジンは、これをサイト内のすべてをクロールする許可を得たと解釈します。

## Robots.txt テンプレートの検索順序 {#robotstxt-template-lookup-order}

内部テンプレートは、カスタムテンプレートで上書きできます。Hugo は、この検索順序を使用してテンプレートを選択します。

1. `/layouts/robots.txt`
2. `/themes/<THEME>/layouts/robots.txt`

## Robots.txt テンプレートの例 {#robotstxt-template-example}

{{< code file="layouts/robots.txt" download="robots.txt" >}}
User-agent: *
{{ range .Pages }}
Disallow: {{ .RelPermalink }}
{{ end }}
{{< /code >}}

このテンプレートは、サイトの各ページに `Disallow` ディレクティブを含む robots.txt ファイルを作成します。 ロボット排除プロトコル (Robots Exclusion Protocol) を尊重する検索エンジンは、サイト上のどのページもクロールしないようにします。

{{% note %}}
テンプレートを使用せずに robots.txt ファイルを作成するには、以下を実行します。

1. [サイト設定][config] で `enableRobotsTXT` を `false` に設定します。
2. `static` ディレクトリに robots.txt ファイルを作成します。

Hugo は、サイトをビルドするときに、[static ディレクトリ][static] にあるすべてのものを `publishDir` のルート (通常は `public`) にコピーすることを覚えておいてください。

[config]: /getting-started/configuration/
[static]: /getting-started/directory-structure/
{{% /note %}}

[config]: /getting-started/configuration/
[internal]: https://github.com/gohugoio/hugo/blob/master/tpl/tplimpl/embedded/templates/_default/robots.txt
