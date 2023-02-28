---
aliases: []
categories:
- variables and params
date: "2017-02-01"
description: タクソノミー ページは `Page` というタイプで、ページレベル、サイトレベル、リストレベルのすべての変数が利用可能です。ただし、タクソノミー用語テンプレートは、そのテンプレートで利用可能な追加の変数を持っています。
draft: false
keywords:
- taxonomies
- terms
lastmod: "2017-02-01"
linktitle: null
menu:
  docs:
    parent: variables
    weight: 30
publishdate: "2017-02-01"
sections_weight: 30
title: タクソノミー変数
toc: true
weight: 30
---

## タクソノミー用語ページの変数 {#taxonomy-terms-page-variables}

[タクソノミー用語ページ][taxonomytemplates] は `Page` タイプで、以下の追加変数を持っています。

たとえば、[タクソノミー テンプレート][taxonomytemplates] の編成方法に応じて、以下のフィールドが `layouts/_defaults/terms.html` で使用できます。

.Data.Singular
: タクソノミーの単数形の名前です (たとえば、 `tags => tag`)。

.Data.Plural
: タクソノミーの複数形の名前です (たとえば、 `tags => tags`)。

.Data.Pages
: タクソノミーに登録されているページのリストです。

.Data.Terms
: タクソノミーそのものです。

.Data.Terms.Alphabetical
: タクソノミー用語のアルファベット表記です

.Data.Terms.ByCount
: 人気順の用語です。

`.Data.Terms.Alphabetical` と `.Data.Terms.ByCount` は、以下のように逆にもできることに注意してください。

* `.Data.Terms.Alphabetical.Reverse`
* `.Data.Terms.ByCount.Reverse`

## タクソノミー テンプレートの外で `.Site.Taxonomies` を使用する {#use-sitetaxonomies-outside-of-taxonomy-templates}

`.Site.Taxonomies` 変数は、サイト全体で定義されたすべてのタクソノミーを保持します。 `.Site.Taxonomies` は、タクソノミー名からその値のリストへのマップです (たとえば、 `"tags" -> ["tag1", "tag2", "tag3"]`)。 ただし、各値は文字列ではなく、*タクソノミー変数* です。

## `.Taxonomy` 変数 {#the-taxonomy-variable}

`.Taxonomy` 変数は、たとえば `.Site.Taxonomies.tags` のように利用でき、タグ (値) のリストと、それぞれのタグに対応するコンテンツページが含まれます。

### `.Site.Taxonomies` の使用例 {#example-usage-of-sitetaxonomies}

以下の [部分テンプレート][partials] は、サイトのすべてのタクソノミー、それぞれのキー、およびそれぞれのキーに割り当てられたすべてのコンテンツを一覧表示します。タクソノミーの順序とレンダリング方法のその他の例については、[「タクソノミー テンプレート」][taxonomytemplates] を参照してください。

{{< code file="all-taxonomies-keys-and-pages.html" download="all-taxonomies-keys-and-pages.html" >}}
<section>
  <ul>
    {{ range $taxonomyname, $taxonomy := .Site.Taxonomies }}
      <li><a href="{{ "/" | relLangURL}}{{ $taxonomyname | urlize }}">{{ $taxonomyname }}</a>
        <ul>
          {{ range $key, $value := $taxonomy }}
          <li> {{ $key }} </li>
                <ul>
                {{ range $value.Pages }}
                    <li><a href="{{ .Permalink}}"> {{ .LinkTitle }} </a> </li>
                {{ end }}
                </ul>
          {{ end }}
        </ul>
      </li>
    {{ end }}
  </ul>
</section>
{{< /code >}}

[partials]: /templates/partials/
[taxonomytemplates]: /templates/taxonomy-templates/
