---
aliases:
- /layout/homepage/
- /templates/homepage-template/
categories:
- templates
date: "2017-02-01"
description: 多くの場合、Web サイトのホームページは、他のページとは異なる形式になっています。 このため、Hugo では、新しいサイトのホームページを独自のテンプレートとして簡単に定義できます。
draft: false
keywords:
- homepage
lastmod: "2017-02-01"
linktitle: ホームページ テンプレート
menu:
  docs:
    parent: templates
    weight: 30
publishdate: "2017-02-01"
sections_weight: 30
title: ホームページ テンプレート
toc: true
weight: 30
---

ホームページは `Page` なので、すべての [ページ変数][pagevars] と [サイト変数][sitevars] を使用できます。

{{% note "The Only Required Template" %}}
ホームページ テンプレートは、サイトをビルドするために必要な *唯一の* テンプレートであるため、新しいサイトとテンプレートをブートストラップするときに役立ちます。 また、シングルページの Web サイトを開発している場合にも、このテンプレートが唯一の必須テンプレートとなります。
{{% /note %}}

{{< youtube ut1xtRZ1QOA >}}

## ホームページ テンプレートの検索順序 {#homepage-template-lookup-order}

[テンプレートの検索順序](/templates/lookup-order/) を参照してください。

## ホームページにコンテンツとフロントマターを追加する {#add-content-and-front-matter-to-the-homepage}

ホームページは、他の [Hugo のリストページ][lists] と同様に、`_index.md` ファイルからコンテンツとフロントマターを受け取ります。 このファイルは、`content` フォルダーのルート (つまり、`content/_index.md`) にある必要があります。 その後、他のコンテンツファイルと同様に、ボディコピーとメタデータをホームページに追加できます。

リストページにコンテンツやフロントマターを追加する際の `_index.md` の役割については、下記のホームページ テンプレートか、[コンテンツ構成][contentorg] を参照してください。

## ホームページ テンプレートの例 {#example-homepage-template}

以下は、[パーシャル (部分テンプレート)][partials], [ベース][base] テンプレートと `content/_index.md` のコンテンツファイルを使って、 `{{.Title}}` と `{.Content}}` [ページ変数][pagevars] に値を設定したホームページ テンプレートの例です。

{{< code file="layouts/index.html" download="index.html" >}}
{{ define "main" }}
    <main aria-role="main">
      <header class="homepage-header">
        <h1>{{.Title}}</h1>
        {{ with .Params.subtitle }}
        <span class="subtitle">{{.}}</span>
        {{ end }}
      </header>
      <div class="homepage-content">
        <!-- index.html のコンテンツは、一種のリストページとして、content/_index.md から取得されることに注意してください -->
        {{.Content}}
      </div>
      <div>
        {{ range first 10 .Site.RegularPages }}
            {{ .Render "summary"}}
        {{ end }}
      </div>
    </main>
{{ end }}
{{< /code >}}

[base]: /templates/base/
[contentorg]: /content-management/organization/
[lists]: /templates/lists/
[lookup]: /templates/lookup-order/
[pagevars]: /variables/page/
[partials]: /templates/partials/
[sitevars]: /variables/site/
