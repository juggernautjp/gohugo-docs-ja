---
aliases:
- /taxonomies/displaying/
- /templates/terms/
- /indexes/displaying/
- /taxonomies/templates/
- /indexes/ordering/
- /templates/taxonomies/
- /templates/taxonomy/
categories:
- templates
date: "2017-02-01"
description: タクソノミー テンプレートには、タクソノミー リストページ、タクソノミー用語ページ、シングルページ テンプレートでのタクソノミーの使用が含まれます。
draft: false
keywords:
- taxonomies
- metadata
- front matter
- terms
- templates
lastmod: "2017-02-01"
menu:
  docs:
    parent: templates
    weight: 50
publishdate: "2017-02-01"
sections_weight: 50
title: タクソノミー テンプレート
toc: true
weight: 50
---

<!-- NOTE! Check on https://github.com/gohugoio/hugo/issues/2826 for shifting of terms' pages to .Data.Pages AND
https://discourse.gohugo.io/t/how-to-specify-category-slug/4856/15 for original discussion.-->

Hugo では、**タクソノミー** と呼ばれる、ユーザーが定義したコンテンツのグループ化をサポートしています。タクソノミーとは、コンテンツ間の論理的な関係を示す分類のことです。Hugo がこの強力な機能をどのように活用しているか知らない場合は、[コンテンツ管理の下の「タクソノミー」](/content-management/taxonomies) を参照してください。

Hugo では、プロジェクト テンプレート全体でタクソノミを使用する方法が複数用意されています。

* タクソノミーの用語に関連するコンテンツが [タクソノミー リスト テンプレート](#taxonomy-list-templates) で表示される方法を順序付けます
* タクソノミーの用語が [タクソノミー用語テンプレート](#taxonomy-terms-templates) で表示される方法を順序付けます
* [シングルページ テンプレート][single page template] 内で、シングルコンテンツのタクソノミー用語をリストします

## タクソノミー リスト テンプレート {#taxonomy-list-templates}

タクソノミーのリストページのテンプレートはリストなので、[リストページ][lists] で使用できるすべての変数とメソッドを備えています。

### タクソノミー リスト テンプレートの検索順序 {#taxonomy-list-template-lookup-order}

詳細は、[「テンプレートの検索順序」](/templates/lookup-order/) を参照してください。

## タクソノミー用語テンプレート {#taxonomy-terms-templates}

### タクソノミー用語テンプレートの検索順序 {#taxonomy-terms-templates-lookup-order}

詳細は、[「テンプレートの検索順序」](/templates/lookup-order/) を参照してください。

### タクソノミー メソッド {#taxonomy-methods}

タクソノミーは、 `map[string]WeightedPages` です。

.Get(term)
: 用語の WeightedPages を返します。

.Count(term)
: この用語に割り当てられているコンテンツの個数です。

.Alphabetical
: 用語順に並べられた OrderedTaxonomy (スライス) を返します。

.ByCount
: エントリ数順に並べられた OrderedTaxonomy (スライス) を返します。

.Reverse
: OrderedTaxonomy (スライス) を逆順で返します。 OrderedTaxonomy と共に使用する必要があります。

### OrderedTaxonomy

マップは順序付けされないので、OrderedTaxonomy は定義された順序を持つ特別な構造です。

```go
[]struct {
    Name          string
    WeightedPages WeightedPages
}
```

スライスの各要素には、以下のものがあります。

.Term
: 使用される用語です。

.WeightedPages
: 重み付きページのスライスです。

.Count
: この用語に割り当てられているコンテンツの個数です。

.Pages
: この用語に割り当てられているすべてのページです。すべての [リストメソッド][renderlists] がこれに使用できます。

## WeightedPages

WeightedPages は、 WeightedPage の単なるスライスです。

```go
type WeightedPages []WeightedPage
```

.Count(term)
: この用語に割り当てられているコンテンツの個数です。

.Pages
: [リストメソッド][renderlists] のいずれかを使用して並べ替えることができる、ページのスライスを返します。

## タクソノミー用語テンプレートでカスタム メタデータを表示する {#displaying-custom-metadata-in-taxonomy-terms-templates}

各タクソノミー用語のカスタム メタデータを表示する必要がある場合、[「タクソノミー」のドキュメントで説明されているように](/content-management/taxonomies/#add-custom-metadata-to-a-taxonomy-or-term)、その用語のページを `/content/<TAXONOMY>/<TERM>/_index.md` に作成し、そのフロントマターにメタデータを追加する必要があります。 Actors タクソノミーの例に基づき、タクソノミー用語テンプレートの中で、変数 `.Pages` を反復処理することにより、カスタムフィールドにアクセスできます。

```go-html-template
<ul>
    {{ range .Pages }}
        <li>
            <a href="{{ .Permalink }}">{{ .Title }}</a>
            {{ .Params.wikipedia }}
        </li>
    {{ end }}
</ul>
```

<!-- Begin /taxonomies/ordering/ -->

## タクソノミーを順序付けする {#order-taxonomies}

タクソノミーは、アルファベット順のキーまたはそのキーに割り当てられたコンテンツの数によって並べることができます。

### アルファベット順の例 {#order-alphabetically-example}

```go-html-template
<ul>
    {{ range .Data.Terms.Alphabetical }}
            <li><a href="{{ .Page.Permalink }}">{{ .Page.Title }}</a> {{ .Count }}</li>
    {{ end }}
</ul>
```

<!-- [See Also Taxonomy Lists](/templates/list/) -->

## タクソノミー内のコンテンツを順序付けする {#order-content-within-taxonomies}

Hugo では、`date` と `weight` の両方を使用して、タクソノミー内のコンテンツを並べます。

Hugo の各コンテンツには、オプションで日付を割り当てることができます。 また、割り当てられているタクソノミーごとに重みを割り当てることもできます。

タクソノミー内のコンテンツを反復処理する場合、デフォルトの並べ替えは、セクションページとリストページで使用されるものと同じで、最初に重み順、次に日付順です。 これは、2 つのコンテンツの重みが同じであれば、より新しいコンテンツが最初に表示されることを意味します。

コンテンツのデフォルトの重みは 0 です。ゼロは「重みがない」という意味であり、「数値ゼロの重みを持つ」という意味ではありません。

したがって、ゼロの重みは特別に扱われます。2 つのページの重みが等しくなく、そのうちの 1 つがゼロである場合、重みがゼロのページは、他のページの重みに関係なく、常に他のページの後に表示されます。 したがって、ゼロの重みは注意して使用する必要があります。たとえば、正と負の両方の重みを使用して順序を両方向に拡張すると、ゼロの重みのページがリストの中央ではなく最後に表示されます。

### 重みを割り当てる {#assign-weight}

コンテンツは、割り当てられたタクソノミーごとに重み付けをすることができます。

```ini
+++
tags = [ "a", "b", "c" ]
tags_weight = 22
categories = ["d"]
title = "foo"
categories_weight = 44
+++
Front Matter with weighted tags and categories
```

慣例では、 `taxonomyname_weight` とします。

上記の例では、このコンテンツは 22 の重みを持ち、'tag' タクソノミーの "a"、"b"、"c" の値に割り当てられたページをレンダリングする際の並べ替えに適用されます。

また、'd' カテゴリをレンダリングするときに 44 の重みが割り当てられています。

これにより、同じコンテンツが異なるタクソノミーの異なる位置に表示される可能性があります。

現在、タクソノミーは、コンテンツのデフォルトの順序付け (重み -> 日付) のみをサポートしています。

<!-- Begin /taxonomies/templates/ -->

タクソノミーを使用する際に必要となるテンプレートは、 2 種類あります。

どちらのテンプレートも、テンプレート セクションで詳しく説明されています。　

[リストテンプレート](/templates/list/) は、1 つの html ページで複数のコンテンツをレンダリングするために使用される、任意のテンプレートです。このテンプレートは、自動的に作成されるすべてのタクソノミーページを生成するために使用されます。

[タクソノミー用語テンプレート](/templates/terms/) は、指定されたテンプレートの用語のリストを生成するために使用されるテンプレートです。

<!-- Begin /taxonomies/displaying/ -->

[リストテンプレート](/templates/list/) を使用して Hugo によって作成される自動タクソノミーページに加えて、タクソノミーでデータを表示する一般的な方法が以下の 4 つあります。

1. 指定されたコンテンツについて、添付された用語を一覧表示できます
2. 指定されたコンテンツについて、同じ用語を含む他のコンテンツを一覧表示できます。
3. タクソノミーのすべての用語を一覧表示できます
4. すべてのタクソノミーを (用語付きで) 一覧表示できます

## コンテンツのタクソノミーを 1 つだけ表示する {#display-a-single-piece-of-contents-taxonomies}

コンテンツ テンプレート内に、コンテンツの一部が割り当てられているタクソノミーを表示したい場合があります。

フロントマター システムを利用してコンテンツのタクソノミーを定義しているため、各コンテンツに割り当てられたタクソノミーは通常の場所 (つまり、`.Params.<TAXONOMYPLURAL>`) に配置されます。

### 例: シングルページ テンプレートでタグを一覧表示する {#example-list-tags-in-a-single-page-template}

```go-html-template
<ul>
    {{ range (.GetTerms "tags") }}
        <li><a href="{{ .Permalink }}">{{ .LinkTitle }}</a></li>
    {{ end }}
</ul>
```

タクソノミーをインラインで一覧表示する場合、カンマだけでなく、(複数のタクソノミーの場合) オプションでタイトルに複数形の語尾を付けるなどの配慮が必要になります。たとえば、TOML 形式のフロントマターに `directors: [ "Joel Coen", "Ethan Coen" ]` のような "directors" というタクソノミーがあるとします。

このようなタクソノミーを一覧表示するには、以下のような方法を使用します。

### 例: シングルページ テンプレートでカンマ区切りのタグを使用する {#example-commadelimit-tags-in-a-single-page-template}

```go-html-template
{{ $taxo := "directors" }} <!-- Use the plural form here -->
{{ with .Param $taxo }}
    <strong>Director{{ if gt (len .) 1 }}s{{ end }}:</strong>
    {{ range $index, $director := . }}
        {{- if gt $index 0 }}, {{ end -}}
        {{ with $.Site.GetPage (printf "/%s/%s" $taxo $director) -}}
            <a href="{{ .Permalink }}">{{ $director }}</a>
        {{- end -}}
    {{- end -}}
{{ end }}
```

別の方法として、タクソノミーを区切り文字でリストする必要がある場合は、[delimit テンプレート関数][delimit] をショートカットとして使用することもできます。 議論については、GitHub の {{< gh 2143 >}} を参照してください。

## タクソノミー用語が同じコンテンツを一覧表示する {#list-content-with-the-same-taxonomy-term}

一連の投稿のようなものにタクソノミーを使用している場合、同じタクソノミーに関連する個々のページを一覧表示できます。これは、関連するコンテンツを表示するための手っ取り早い方法でもあります。

### 例: 同じシリーズのコンテンツを表示する {#example-showing-content-in-same-series}

```go-html-template
<ul>
    {{ range .Site.Taxonomies.series.golang }}
        <li><a href="{{ .Page.RelPermalink }}">{{ .Page.Title }}</a></li>
    {{ end }}
</ul>
```

## 指定されたタクソノミーの全コンテンツを一覧表示する {#list-all-content-in-a-given-taxonomy}

これは、サイドバーで「注目のコンテンツ」として非常に便利です。コンテンツに異なる用語を割り当てることで、「注目のコンテンツ」の異なるセクションを作成することもできます。

### 例: 注目のコンテンツをグループ化する {#example-grouping-featured-content}

```go-html-template
<section id="menu">
    <ul>
        {{ range $key, $taxonomy := .Site.Taxonomies.featured }}
        <li>{{ $key }}</li>
        <ul>
            {{ range $taxonomy.Pages }}
            <li hugo-nav="{{ .RelPermalink}}"><a href="{{ .Permalink}}">{{ .LinkTitle }}</a></li>
            {{ end }}
        </ul>
        {{ end }}
    </ul>
</section>
```

## サイトのタクソノミーをレンダリングする {#render-a-sites-taxonomies}

サイトのタクソノミーのすべてのキーのリストを表示したい場合は、すべてのページで利用可能な [`.Site` 変数][sitevars] からそれらを取得できます。

これは、タグクラウド、メニュー、または単にリストといった形で表示されます。

以下の例では、サイトのタグ タクソノミーに含まれるすべての用語を表示します。

### 例: すべてのサイトタグを一覧表示する {#example-list-all-site-tags}

```go-html-template
<ul>
    {{ range .Site.Taxonomies.tags }}
            <li><a href="{{ .Page.Permalink }}">{{ .Page.Title }}</a> {{ .Count }}</li>
    {{ end }}
</ul>
```

### 例: すべてのタクソノミー、用語、および割り当てられたコンテンツを一覧表示する {#example-list-all-taxonomies-terms-and-assigned-content}

この例では、すべてのタクソノミーとその用語、および各用語に割り当てられたすべてのコンテンツが一覧表示されます。

{{< code file="layouts/partials/all-taxonomies.html" download="all-taxonomies.html" download="all-taxonomies.html" >}}
<section>
    <ul id="all-taxonomies">
        {{ range $taxonomy_term, $taxonomy := .Site.Taxonomies }}
            {{ with $.Site.GetPage (printf "/%s" $taxonomy_term) }}
                <li><a href="{{ .Permalink }}">{{ $taxonomy_term }}</a>
                    <ul>
                        {{ range $key, $value := $taxonomy }}
                            <li>{{ $key }}</li>
                            <ul>
                                {{ range $value.Pages }}
                                    <li hugo-nav="{{ .RelPermalink}}">
                                        <a href="{{ .Permalink}}">{{ .LinkTitle }}</a>
                                    </li>
                                {{ end }}
                            </ul>
                        {{ end }}
                    </ul>
                </li>
            {{ end }}
        {{ end }}
    </ul>
</section>
{{< /code >}}

## タクソノミーのための `.Site.GetPage` {#sitegetpage-for-taxonomies}

タクソノミーはリストなので、[`.GetPage`関数][getpage] を使って、特定のタクソノミー用語に関連するすべてのページを簡潔な構文で取得できます。以下の例は、あなたのサイトのタグの全リストを網羅し、上記の [「すべてのサイトタグを一覧表示する」の例]({{< relref "#example-list-all-site-tags" >}}) のような脆弱な URL 構造を使用せずに、各用語の個々のタクソノミー ページにリンクしています。

{{< code file="links-to-all-tags.html" >}}
{{ $taxo := "tags" }}
<ul class="{{ $taxo }}">
    {{ with ($.Site.GetPage (printf "/%s" $taxo)) }}
        {{ range .Pages }}
            <li><a href="{{ .Permalink }}">{{ .Title}}</a></li>
        {{ end }}
    {{ end }}
</ul>
{{< /code >}}

<!-- TODO: ### `.Site.GetPage` Taxonomy List Example -->

<!-- TODO: ### `.Site.GetPage` Taxonomy Terms Example -->


[delimit]: /functions/delimit/
[getpage]: /functions/getpage/
[lists]: /templates/lists/
[renderlists]: /templates/lists/
[single page template]: /templates/single-page-templates/
[sitevars]: /variables/site/
