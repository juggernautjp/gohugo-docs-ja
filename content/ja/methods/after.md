---
aliases: []
categories:
- functions
date: "2017-02-01"
deprecated: false
description: '`after` は、配列を <em>N</em> 番目のアイテムの後のアイテムのみにスライスします。'
draft: false
hugoversion: null
keywords:
- iteration
lastmod: "2017-02-01"
menu:
  docs:
    parent: functions
publishdate: "2017-02-01"
relatedfuncs:
- last
- first
- seq
signature:
- after INDEX COLLECTION
title: after
workson: []
---

以下は、[`slice` 関数][slice] と組み合わせて使用する `after` を示しています。

```go-html-template
{{ $data := slice "one" "two" "three" "four" }}
{{ range after 2 $data }}
    {{ . }}
{{ end }}
→ ["three", "four"]
```

## `first` と `after` の組み合わせの例: 2 ～ 4 番目の最近の記事 {#example-of-after-with-first-2nd-4th-Most-Recent-articles}

`after` は、[`first` 関数][`first` function] と Hugo の [強力なソートメソッド][lists] と組み合わせて使用できます。 たとえば、`example.com/articles` にリストページがあるとします。 10 個の記事がありますが、 [リスト/セクション ページ][list/section page] のテンプレートでは 2 行しか表示させないようにしたいと思います。

1. 一番上の行は「注目」というタイトルで、最近公開された記事のみを表示します（つまり、コンテンツファイルのフロントマターの `publishdate` によるものです）。
2. 2 行目は「最新の記事」というタイトルで、最近公開された 2 ～ 4 番目の記事のみが表示されます。

{{< code file="layouts/section/articles.html" download="articles.html" >}}
{{ define "main" }}
<section class="row featured-article">
    <h2>注目の記事</h2>
    {{ range first 1 .Pages.ByPublishDate.Reverse }}
     <header>
        <h3><a href="{{.Permalink}}">{{.Title}}</a></h3>
    </header>
    <p>{{.Description}}</p>
    {{ end }}
</section>
<div class="row recent-articles">
    <h2>最新の記事</h2>
    {{ range first 3 (after 1 .Pages.ByPublishDate.Reverse) }}
        <section class="recent-article">
            <header>
                <h3><a href="{{.Permalink}}">{{.Title}}</a></h3>
            </header>
            <p>{{.Description}}</p>
        </section>
    {{ end }}
</div>
{{ end }}
{{< /code >}}

[`first` function]: /functions/first/
[list/section page]: /templates/section-templates/
[lists]: /templates/lists/#order-content
[slice]: /functions/slice/
