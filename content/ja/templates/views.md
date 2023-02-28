---
aliases: []
categories:
- templates
date: "2017-02-01"
description: Hugo は、コンテンツの代替ビューをレンダリングできます。これは、リストビューとサマリービューで特に役立ちます。
draft: false
keywords:
- views
lastmod: "2017-02-01"
menu:
  docs:
    parent: templates
    weight: 70
publishdate: "2017-02-01"
sections_weight: 70
title: コンテンツビュー テンプレート
toc: true
weight: 70
---

これらの代替 **コンテンツビュー** は、[リストテンプレート][lists] で特に役立ちます。

コンテンツビューの一般的な使用例としては、以下のようなものがあります。

* あらゆる種類のコンテンツをホームページに表示したいが、[サマリービュー][summaries] の表示を制限したい。
* [タクソノミー リストページ][taxonomylists] には、コンテンツの箇条書きのリストだけを表示したいですよね。ビューは、異なるタイプのコンテンツのレンダリングをコンテンツ自体に委ねることで、これを非常に簡単にします。

## コンテンツビューを作成する {#create-a-content-view}

新しいビューを作成するには、異なるコンテンツタイプのディレクトリに、ビュー名を指定してテンプレートを作成します。以下の例では、コンテンツタイプの `posts` と `project` に対して、"li" ビューと "summary" ビューを作成しています。見ての通り、これらは [シングルコンテンツビュー][single] テンプレートである `single.html` の隣に配置されています。指定されたタイプに特定のビューを提供し、プライマリビューには `_default/single.html` を使用し続けることもできます。

```txt
  ▾ layouts/
    ▾ posts/
        li.html
        single.html
        summary.html
    ▾ project/
        li.html
        single.html
        summary.html
```

Hugo は、特定のコンテンツビュー テンプレートがそのタイプに提供されていない場合に使用されるデフォルトのコンテンツ テンプレートもサポートしています。 コンテンツビューは `_default` ディレクトリでも定義でき、検索順序の問題として最終的に `_default` ディレクトリにたどり着くリストテンプレートおよびシングルテンプレートと同じように動作します。

```txt
▾ layouts/
  ▾ _default/
      li.html
      single.html
      summary.html
```

## どのテンプレートがレンダリングされるのか? {#which-template-will-be-rendered}

コンテンツビューの [検索順序][lookup] は、以下のとおりです。

1. `/layouts/<TYPE>/<VIEW>.html`
2. `/layouts/_default/<VIEW>.html`
3. `/themes/<THEME>/layouts/<TYPE>/<VIEW>.html`
4. `/themes/<THEME>/layouts/_default/<VIEW>.html`

## 例: リスト内のコンテンツビュー {#example-content-view-inside-a-list}

以下の例は、[リストテンプレート][lists] 内でコンテンツビューを使用する方法を示しています。

### `list.html`

この例では、`.Render` がテンプレートに渡され、[.Render (レンダー) 関数][render] を呼び出しています。`.Render` は特殊な関数で、最初の引数として与えられたビューテンプレートでコンテンツ自身をレンダリングするように指示します。この場合、テンプレートは以下の `summary.html` ビューをレンダリングします。

{{< code file="layouts/_default/list.html" download="list.html" >}}
<main id="main">
  <div>
  <h1 id="title">{{ .Title }}</h1>
  {{ range .Pages }}
    {{ .Render "summary"}}
  {{ end }}
  </div>
</main>
{{< /code >}}

### `summary.html`

Hugo は、以下の `summary.html` ビュー テンプレートにページオブジェクト全体を渡します。 (完全なリストは、 [「ページ変数」][pagevars] を参照してください)。

{{< code file="layouts/_default/summary.html" download="summary.html" >}}
<article class="post">
  <header>
    <h2><a href='{{ .Permalink }}'> {{ .Title }}</a> </h2>
    <div class="post-meta">{{ .Date.Format "Mon, Jan 2, 2006" }} - {{ .FuzzyWordCount }} Words </div>
  </header>
  {{ .Summary }}
  <footer>
  <a href='{{ .Permalink }}'><nobr>Read more →</nobr></a>
  </footer>
</article>
{{< /code >}}

### `li.html`

前の例の続きで、`.Render` 関数の呼び出しの引数を変更することで、より小さな `li.html` ビューを使用するようにレンダー関数を変更できます (つまり、 `{{ .Render "li" }}`)。

{{< code file="layouts/_default/li.html" download="li.html" >}}
<li>
  <a href="{{ .Permalink }}">{{ .Title }}</a>
  <div class="meta">{{ .Date.Format "Mon, Jan 2, 2006" }}</div>
</li>
{{< /code >}}

[lists]: /templates/lists/
[lookup]: /templates/lookup-order/
[pagevars]: /variables/page/
[render]: /functions/render/
[single]: /templates/single-page-templates/
[spf]: https://spf13.com
[spfsourceli]: https://github.com/spf13/spf13.com/blob/master/layouts/_default/li.html
[spfsourcesection]: https://github.com/spf13/spf13.com/blob/master/layouts/_default/section.html
[spfsourcesummary]: https://github.com/spf13/spf13.com/blob/master/layouts/_default/summary.html
[summaries]: /content-management/summaries/
[taxonomylists]: /templates/taxonomy-templates/
