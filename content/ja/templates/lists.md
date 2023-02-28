---
aliases:
- /templates/list/
- /layout/indexes/
categories:
- templates
date: "2017-02-01"
description: サイトのホームページ、セクションページ、タクソノミー リスト、またはタクソノミー用語リストのレンダリングに関して、Hugo ではリストに特定の意味と使用法があります。
draft: false
keywords:
- lists
- sections
- rss
- taxonomies
- terms
lastmod: "2017-02-01"
linktitle: リストテンプレート
menu:
  docs:
    parent: templates
    weight: 22
publishdate: "2017-02-01"
sections_weight: 22
title: Hugo のコンテンツリスト
toc: true
weight: 22
---

## リストページ テンプレートとは {#what-is-a-list-page-template}

{{< youtube 8b2YTSMdMps >}}

リストページ テンプレートは、複数のコンテンツを 1 つの HTML ページで表示するために使用するテンプレートです。ただし、ホームページは例外で、やはりリストではありますが、専用の [テンプレート][homepage] を持ちます。

Hugo では、*リスト* という用語を本当の意味で使っています。つまり、特にアルファベット順または数字順で、資料を順番に並べます。 Hugo では、出力される HTML ページの中で、伝統的にリスト化されたコンテンツに以下のリストテンプレートを使用します。

* [タクソノミー用語ページ][taxterms]
* [タクソノミー リストページ][taxlists]
* [セクション リストページ][sectiontemps]
* [RSS][rss]

テンプレートの検索順序については、[「テンプレートの検索順序」](/templates/lookup-order/) を参照してください。

リストページのアイデアは、[Web の階層的メンタルモデル][mentalmodel] に由来し、以下のように視覚的に示すのが最も効果的です。

[![階層的な Web サイトのサイトマップを示す画像](/images/site-hierarchy.svg)](/images/site-hierarchy.svg)

## リストのデフォルト {#list-defaults}

### デフォルトのテンプレート {#default-templates}

セクションリストとタクソノーミリスト ([タクソノミー用語リスト][taxterms] ではないことに注意してください) はどちらもテンプレートに関しては *リスト* であるため、どちらも `_default/list.html` または `themes/<THEME>/layouts/_default/list.html` という同じ終了デフォルトが検索順序に設定されています。さらに、[セクションリスト][sectiontemps] と [タクソノミーリスト][taxlists] は、どちらも `_default` に独自のデフォルトのリストテンプレートを持っています。

完全なリファレンスについては、[テンプレートの検索順序](/templates/lookup-order/) を参照してください。

## リストページにコンテンツとフロントマターを追加する {#add-content-and-front-matter-to-list-pages}

v0.18 以降、[Hugo にある全てのものは `Page` です][bepsays]。 つまり、リストページとホームページは、ページのメタデータ (つまりフロントマター) とコンテンツを含む関連コンテンツファイル (つまり `_index.md`) を持つことができます。

この新しいモデルでは、`.Params` を介してリスト固有のフロントマターを含めることができ、また、リストテンプレート (たとえば、`layouts/_default/list.html`) がすべての [ページ変数][pagevars] にアクセスできることも意味します。

{{% note %}}
すべての `_index.md` コンテンツファイルは、[シングルページ テンプレート](/templates/single-page-templates/) ではなく、*リスト* テンプレートに従ってレンダリングされることに注意してください。
{{% /note %}}

### プロジェクト ディレクトリの例 {#example-project-directory}

以下は、典型的な Hugo のプロジェクト ディレクトリのコンテンツの例です。

```txt
.
...
├── content
|   ├── posts
|   |   ├── _index.md
|   |   ├── post-01.md
|   |   └── post-02.md
|   └── quote
|   |   ├── quote-01.md
|   |   └── quote-02.md
...
```

上記の例で、`content/posts/_index.md` に以下のように記述しているとします。

{{< code file="content/posts/_index.md" >}}
---
title: 私の Go の旅
date: 2017-03-23
publishdate: 2017-03-24
---

2017 年 3 月に Go の学習を開始することにしました。

この新しいブログを通して、私の旅にお付き合いください。
{{< /code >}}

上記により、リストテンプレートでこの `_index.md` のコンテンツにアクセスできます。

{{< code file="layouts/_default/list.html" download="list.html" >}}
{{ define "main" }}
<main>
    <article>
        <header>
            <h1>{{.Title}}</h1>
        </header>
        <!-- "{{.Content}}" は対応する _index.md の Marakdown コンテンツから取得します -->
        {{.Content}}
    </article>
    <ul>
    <!-- content/posts/*.md の範囲指定 -->
    {{ range .Pages }}
        <li>
            <a href="{{.Permalink}}">{{.Date.Format "2006-01-02"}} | {{.Title}}</a>
        </li>
    {{ end }}
    </ul>
</main>
{{ end }}
{{< /code >}}

上記により、以下のような HTML が出力されます。

{{< code file="example.com/posts/index.html" copy="false" >}}
<!-- baseof コードの先頭 -->
<main>
    <article>
        <header>
            <h1>私の Go の旅</h1>
        </header>
        <p>2017 年 3 月に Go の学習を開始することにしました。</p>
        <p>この新しいブログを通して、私の旅にお付き合いください。</p>
    </article>
    <ul>
        <li><a href="/posts/post-01/">投稿 1</a></li>
        <li><a href="/posts/post-02/">投稿 2</a></li>
    </ul>
</main>
<!-- baseof コードの最後 -->
{{< /code >}}

### `index.md` がないページを一覧表示する {#list-pages-without-index.md}

すべてのリストページ (つまり、セクション、タクソノミー、タクソノミー用語など) またはホームページに対して `_index.md` ファイルを作成する必要は *ありません*。 リストテンプレートをレンダリングするときに Hugo がそれぞれのコンテンツセクション内で `_index.md` を見つけられない場合、ページは作成されますが、`{{.Content}}` はなく、`.Title` などのデフォルト値のみが作成されます。

この同じ `layouts/_default/list.html` テンプレートを使用して、上記の `quotes` セクションに適用すると、以下の出力がレンダリングされます。 `quotes` には、プルする `_index.md` ファイルがないことに注意してください。

{{< code file="example.com/quote/index.html" copy="false" >}}
<!-- baseof -->
<main>
    <article>
        <header>
        <!-- Hugo は、.Title がセクションの名前であると仮定します。それは、"title:" フィールドをプルする _index.md コンテンツファイルが存在しないためです -->
            <h1>Quotes</h1>
        </header>
    </article>
    <ul>
        <li><a href="https://example.com/quote/quotes-01/">Quote 1</a></li>
        <li><a href="https://example.com/quote/quotes-02/">Quote 2</a></li>
    </ul>
</main>
<!--baseof-->
{{< /code >}}

{{% note %}}
Hugo のデフォルトの動作は、リストのタイトルを複数形にすることです。 したがって、`.Title` [ページ変数](/variables/page/) で呼び出されると、`quote` セクションが "Quotes" に変換されます。 これは、[サイト設定](/getting-started/configuration/) の `pluralizeListTitles` ディレクティブで変更できます。
{{% /note %}}

## リストテンプレートの例 {#example-list-templates}

### セクション テンプレート {#section-template}

このリストテンプレートは、もともと [spf13.com](https://spf13.com/) で使われていたテンプレートを少し修正したものです。 [ベーステンプレート][base] を使うのではなく、レンダリングされたページのクロムのために [部分テンプレート][partials] を使っています。以下の例では、[コンテンツビュー テンプレート][views] の `li.html` または `summary.html` を使っています。

{{< code file="layouts/section/posts.html" >}}
{{ partial "header.html" . }}
{{ partial "subheader.html" . }}
<main>
  <div>
   <h1>{{ .Title }}</h1>
        <ul>
        <!-- content/posts/*.md ごとに li.html コンテンツビューをレンダリングします -->
            {{ range .Pages }}
                {{ .Render "li"}}
            {{ end }}
        </ul>
  </div>
</main>
{{ partial "footer.html" . }}
{{< /code >}}

### タクソノミー テンプレート {#taxonomy-template}

{{< code file="layouts/_default/taxonomy.html" download="taxonomy.html" >}}
{{ define "main" }}
<main>
  <div>
   <h1>{{ .Title }}</h1>
   <!-- 特定のタクソノミー用語に関連する各コンテンツファイルを範囲指定し、summary.html コンテンツビューをレンダリングします -->
    {{ range .Pages }}
        {{ .Render "summary"}}
    {{ end }}
  </div>
</main>
{{ end }}
{{< /code >}}

## コンテンツを並べる {#order-content}

Hugo のリストは、[フロントマター][front matter] で指定したメタデータに基づいてコンテンツをレンダリングします。まともなデフォルトに加えて、Hugo にはリストテンプレート内のコンテンツを素早く並べるための複数のメソッドが同梱されています。

### デフォルト: Weight > Date > LinkTitle > FilePath {#default-weight-date-linktitle-filepath}

{{< code file="layouts/partials/default-order.html" >}}
<ul>
    {{ range .Pages }}
        <li>
            <h1><a href="{{ .Permalink }}">{{ .Title }}</a></h1>
            <time>{{ .Date.Format "Mon, Jan 2, 2006" }}</time>
        </li>
    {{ end }}
</ul>
{{< /code >}}

### 重み (Weight) 順で並べる {#by-weight}

重み (weight) が小さいほど優先度が高くなります。 そのため、重みの低いコンテンツが最初に表示されます。

{{< code file="layouts/partials/by-weight.html" >}}
<ul>
    {{ range .Pages.ByWeight }}
        <li>
            <h1><a href="{{ .Permalink }}">{{ .Title }}</a></h1>
            <time>{{ .Date.Format "Mon, Jan 2, 2006" }}</time>
        </li>
    {{ end }}
</ul>
{{< /code >}}

### 日付 (Date) 順で並べる {#by-date}

{{< code file="layouts/partials/by-date.html" >}}
<ul>
    <!-- フロントマターの "date" フィールドにしたがってコンテンツを並べます -->
    {{ range .Pages.ByDate }}
        <li>
            <h1><a href="{{ .Permalink }}">{{ .Title }}</a></h1>
            <time>{{ .Date.Format "Mon, Jan 2, 2006" }}</time>
        </li>
    {{ end }}
</ul>
{{< /code >}}

### 公開日 (Publish Date) 順で並べる {#by-publish-date}

{{< code file="layouts/partials/by-publish-date.html" >}}
<ul>
    <!-- フロントマターの "date" (日付) フィールドにしたがってコンテンツを並べます -->
    {{ range .Pages.ByPublishDate }}
        <li>
            <h1><a href="{{ .Permalink }}">{{ .Title }}</a></h1>
            <time>{{ .Date.Format "Mon, Jan 2, 2006" }}</time>
        </li>
    {{ end }}
</ul>
{{< /code >}}

### 有効期限 (Expiration Date) 順で並べる {#by-expiration-date}

{{< code file="layouts/partials/by-expiry-date.html" >}}
<ul>
    {{ range .Pages.ByExpiryDate }}
        <li>
            <h1><a href="{{ .Permalink }}">{{ .Title }}</a></h1>
            <time>{{ .Date.Format "Mon, Jan 2, 2006" }}</time>
        </li>
    {{ end }}
</ul>
{{< /code >}}

### 最終更新日 (Last Modified Date) 順で並べる {#by-last-modified-date}

{{< code file="layouts/partials/by-last-mod.html" >}}
<ul>
    <!-- フロントマターの "lastmod" フィールドに従ってコンテンツを並べます -->
    {{ range .Pages.ByLastmod }}
        <li>
            <h1><a href="{{ .Permalink }}">{{ .Title }}</a></h1>
            <time>{{ .Date.Format "Mon, Jan 2, 2006" }}</time>
        </li>
    {{ end }}
</ul>
{{< /code >}}

### 長さ (Length) 順で並べる {#by-length}

{{< code file="layouts/partials/by-length.html" >}}
<ul>
    <!-- コンテンツの長さに従ってコンテンツを昇順に並べます (つまり、最も短いコンテンツが最初にリストされます) -->
    {{ range .Pages.ByLength }}
        <li>
            <h1><a href="{{ .Permalink }}">{{ .Title }}</a></h1>
            <time>{{ .Date.Format "Mon, Jan 2, 2006" }}</time>
        </li>
    {{ end }}
</ul>
{{< /code >}}

### タイトル (Title) 順で並べる {#by-title}

{{< code file="layouts/partials/by-title.html" >}}
<ul>
    <!-- フロントマターに設定された "title" フィールドに従って、昇順でコンテンツの範囲を指定します -->
    {{ range .Pages.ByTitle }}
        <li>
            <h1><a href="{{ .Permalink }}">{{ .Title }}</a></h1>
            <time>{{ .Date.Format "Mon, Jan 2, 2006" }}</time>
        </li>
    {{ end }}
</ul>
{{< /code >}}

### リンクタイトル (Link Title) 順で並べる {#by-link-title}

{{< code file="layouts/partials/by-link-title.html" >}}
<ul>
    <!-- フロントマターの "linktitle" フィールドに従って、コンテンツを昇順に並べます。 "linktitle" フィールドが設定されていない場合、範囲は "title" フィールドのみを持つコンテンツから始まり、その値を .LinkTitle に使用します -->
    {{ range .Pages.ByLinkTitle }}
        <li>
            <h1><a href="{{ .Permalink }}">{{ .LinkTitle }}</a></h1>
            <time>{{ .Date.Format "Mon, Jan 2, 2006" }}</time>
        </li>
    {{ end }}
</ul>
{{< /code >}}

### パラメータ (Parameter) 順で並べる {#by-parameter}

指定されたフロントマター パラメータに基づいて並べます。 指定されたフロントマター フィールドを持たないコンテンツは、サイトの `.Site.Params` デフォルトを使用します。 一部のエントリでパラメータがまったく見つからない場合、それらのエントリは順序付けの最後に一緒に表示されます。

{{< code file="layouts/partials/by-rating.html" >}}
<!-- フロントマターに設定された "rating" フィールドにしたがって、コンテンツの範囲を設定します -->
{{ range (.Pages.ByParam "rating") }}
  <!-- ... -->
{{ end }}
{{< /code >}}

対象となるフロントマター フィールドが他のフィールドの下にネストされている場合、ドット記法を使ってフィールドにアクセスできます。

{{< code file="layouts/partials/by-nested-param.html" >}}
{{ range (.Pages.ByParam "author.last_name") }}
  <!-- ... -->
{{ end }}
{{< /code >}}

### 逆順 {#reverse-order}

逆順は、上記のいずれのメソッドにも適用できます。 以下では、例として `ByDate` を使用します。

{{< code file="layouts/partials/by-date-reverse.html" >}}
<ul>
    {{ range .Pages.ByDate.Reverse }}
        <li>
            <h1><a href="{{ .Permalink }}">{{ .Title }}</a></h1>
            <time>{{ .Date.Format "Mon, Jan 2, 2006" }}</time>
        </li>
    {{ end }}
</ul>
{{< /code >}}

## グループコンテンツ {#group-content}

Hugo には、セクション、タイプ、日付などでページをグループ化する関数があります。

### ページフィールド (Page Field) による {#by-page-field}

{{< code file="layouts/partials/by-page-field.html" >}}
<!-- コンテンツセクションに従ってコンテンツをグループ化します。このインスタンスの ".Key" は、セクションのタイトルになります。 -->
{{ range .Pages.GroupBy "Section" }}
<h3>{{ .Key }}</h3>
<ul>
    {{ range .Pages }}
    <li>
    <a href="{{ .Permalink }}">{{ .Title }}</a>
    <div class="meta">{{ .Date.Format "Mon, Jan 2, 2006" }}</div>
    </li>
    {{ end }}
</ul>
{{ end }}
{{< /code >}}

上記の例では、代わりに `_index.md` ファイルに追加した `title` フィールドを `{{.Title}}` で指定したい場合があります。 以下のように、[`.GetPage` 関数][getpage] を使用して、この値にアクセスできます。

{{< code file="layouts/partials/by-page-field.html" >}}
<!-- コンテンツ セクションに従ってコンテンツをグループ化します。 -->
{{ range .Pages.GroupBy "Section" }}
<!-- セクションの _index.md があるかどうか確認し、あればフロントマターの "title" から取得します。 -->
{{ with $.Site.GetPage "section" .Key }}
<h3>{{.Title}}</h3>
{{ else }}
<!-- _index.md がない場合、".Key が デフォルトでセクションのタイトルとなり、タイトルケーシング (タイトルの大文字表記) にフィルタリングされます -->
<h3>{{ .Key | title }}</h3>
{{ end }}
<ul>
    {{ range .Pages }}
    <li>
    <a href="{{ .Permalink }}">{{ .Title }}</a>
    <div class="meta">{{ .Date.Format "Mon, Jan 2, 2006" }}</div>
    </li>
    {{ end }}
</ul>
{{ end }}
{{< /code >}}

### 日付 (Date) による {#by-date}

{{< code file="layouts/partials/by-page-date.html" >}}
<!-- フロントマターの "date" フィールドに従って、月ごとにコンテンツをグループ化します -->
{{ range .Pages.GroupByDate "2006-01" }}
<h3>{{ .Key }}</h3>
<ul>
    {{ range .Pages }}
    <li>
    <a href="{{ .Permalink }}">{{ .Title }}</a>
    <div class="meta">{{ .Date.Format "Mon, Jan 2, 2006" }}</div>
    </li>
    {{ end }}
</ul>
{{ end }}
{{< /code >}}

{{< new-in "0.97.0" >}} `GroupByDate` は [time.Format](/functions/dateformat/) と同じ時間レイアウトを受け入れ、結果の `.Key` は現在の言語にローカライズされます。

### 公開日 (Publish Date) による {#by-publish-date}

{{< code file="layouts/partials/by-page-publish-date.html" >}}
<!-- フロントマターの "publishDate" フィールドに従って、コンテンツを月別にグループ化します -->
{{ range .Pages.GroupByPublishDate "2006-01" }}
<h3>{{ .Key }}</h3>
<ul>
    {{ range .Pages }}
    <li>
    <a href="{{ .Permalink }}">{{ .Title }}</a>
    <div class="meta">{{ .PublishDate.Format "Mon, Jan 2, 2006" }}</div>
    </li>
    {{ end }}
</ul>
{{ end }}
{{< /code >}}

{{< new-in "0.97.0" >}} `GroupByDate` は [time.Format](/functions/dateformat/) と同じ時間レイアウトを受け入れ、結果の `.Key` は現在の言語にローカライズされます。

### 最終更新日 (Lastmod) による {#by-lastmod}

{{< code file="layouts/partials/by-page-lastmod.html" >}}
<!-- フロントマターの "lastMod" フィールドに従って、コンテンツを月別にグループ化します -->
{{ range .Pages.GroupByLastmod "2006-01" }}
<h3>{{ .Key }}</h3>
<ul>
    {{ range .Pages }}
    <li>
    <a href="{{ .Permalink }}">{{ .Title }}</a>
    <div class="meta">{{ .Lastmod.Format "Mon, Jan 2, 2006" }}</div>
    </li>
    {{ end }}
</ul>
{{ end }}
{{< /code >}}

{{< new-in "0.97.0" >}} `GroupByDate` は [time.Format](/functions/dateformat/) と同じ時間レイアウトを受け入れ、結果の `.Key` は現在の言語にローカライズされます。

### 有効期限 (Expiry Date) による {#by-expiry-date}

{{< code file="layouts/partials/by-page-expiry-date.html" >}}
<!-- フロントマターの "expiryDate "フィールドに従って、コンテンツを月別にグループ化します -->
{{ range .Pages.GroupByExpiryDate "2006-01" }}
<h3>{{ .Key }}</h3>
<ul>
    {{ range .Pages }}
    <li>
    <a href="{{ .Permalink }}">{{ .Title }}</a>
    <div class="meta">{{ .ExpiryDate.Format "Mon, Jan 2, 2006" }}</div>
    </li>
    {{ end }}
</ul>
{{ end }}
{{< /code >}}

{{< new-in "0.97.0" >}} `GroupByDate` は [time.Format](/functions/dateformat/) と同じ時間レイアウトを受け入れ、結果の `.Key` は現在の言語にローカライズされます。

### ページパラメータによる {#by-page-parameter}

{{< code file="layouts/partials/by-page-param.html" >}}
<!-- フロントマターの "param_key" フィールドに従って、コンテンツをグループ化します -->
{{ range .Pages.GroupByParam "param_key" }}
<h3>{{ .Key }}</h3>
<ul>
    {{ range .Pages }}
    <li>
    <a href="{{ .Permalink }}">{{ .Title }}</a>
    <div class="meta">{{ .Date.Format "Mon, Jan 2, 2006" }}</div>
    </li>
    {{ end }}
</ul>
{{ end }}
{{< /code >}}

### 日付形式のページパラメータによる {#by-page-parameter-in-date-format}

以下のテンプレートでは `date` によるグループ化をさらに一歩進めて、Go のレイアウト文字列を使用しています。Go のレイアウト文字列を使って、 Hugo で日付をフォーマットする方法については、[`Format`関数][`Format` function] を参照してください。

{{< code file="layouts/partials/by-page-param-as-date.html" >}}
<!-- フロントマターの "param_key" フィールドに従って、コンテンツを月別にグループ化します -->
{{ range .Pages.GroupByParamDate "param_key" "2006-01" }}
<h3>{{ .Key }}</h3>
<ul>
    {{ range .Pages }}
    <li>
    <a href="{{ .Permalink }}">{{ .Title }}</a>
    <div class="meta">{{ .Date.Format "Mon, Jan 2, 2006" }}</div>
    </li>
    {{ end }}
</ul>
{{ end }}
{{< /code >}}

### キー順を逆にする {#reverse-key-order}

グループの並び順は、キーが英数字順 (A-Z、1-100)、日付は逆の年代順 (つまり、新しいものが最初) になっています。

これらは論理的なデフォルトですが、常に望ましい順序とは限りません。Hugo のグループのデフォルトの並び順を変更するには、2 つの異なる構文があります。

#### 1. リバースメソッドの追加 {#1-adding-the-reverse-method}

```go-html-template
{{ range (.Pages.GroupBy "Section").Reverse }}
```

```go-html-template
{{ range (.Pages.GroupByDate "2006-01").Reverse }}
```

#### 2. 代替方向の提供 {#2-providing-the-alternate-direction}

```go-html-template
{{ range .Pages.GroupByDate "2006-01" "asc" }}
```

```go-html-template
{{ range .Pages.GroupBy "Section" "desc" }}
```

### グループ内の順序 {#order-within-groups}

グループ化は `{{.Key}}` とページのスライスを返すので、上記のすべての順序付け方法が利用可能です。

ここでは、以下のような順序付けの例を示します。

1. コンテンツは、フロントマターの `date` フィールドに従って、月ごとにグループ化されます。
2. グループは昇順で表示されます (つまり、最も古いグループが最初になります)。
3. 各グループ内のページは、`title` に従ってアルファベット順に並んでいます。

{{< code file="layouts/partials/by-group-by-page.html" >}}
{{ range .Pages.GroupByDate "2006-01" "asc" }}
<h3>{{ .Key }}</h3>
<ul>
    {{ range .Pages.ByTitle }}
    <li>
    <a href="{{ .Permalink }}">{{ .Title }}</a>
    <div class="meta">{{ .Date.Format "Mon, Jan 2, 2006" }}</div>
    </li>
    {{ end }}
</ul>
{{ end }}
{{< /code >}}

## リストのフィルタリングと制限 {#filtering-and-limiting-lists}

時には、利用可能なコンテンツのサブセットのみをリストしたい場合があります。よくあるのは、[**メインセクション**][mainsections] からの投稿のみをブログのホームページに表示することです。

詳細については、[`where` 関数][wherefunction] および [`first` 関数][firstfunction] のドキュメントを参照してください。

[base]: /templates/base/
[bepsays]: https://bepsays.com/en/2016/12/19/hugo-018/
[directorystructure]: /getting-started/directory-structure/
[`Format` function]: /functions/format/
[front matter]: /content-management/front-matter/
[getpage]: /functions/getpage/
[homepage]: /templates/homepage/
[homepage]: /templates/homepage/
[mentalmodel]: https://webstyleguide.com/wsg3/3-information-architecture/3-site-structure.html
[pagevars]: /variables/page/
[partials]: /templates/partials/
[RSS 2.0]: https://cyber.harvard.edu/rss/rss.html "RSS 2.0 仕様書"
[rss]: /templates/rss/
[sections]: /content-management/sections/
[sectiontemps]: /templates/section-templates/
[sitevars]: /variables/site/
[taxlists]: /templates/taxonomy-templates/#taxonomy-list-templates
[taxterms]: /templates/taxonomy-templates/#taxonomy-terms-templates
[taxvars]: /variables/taxonomy/
[views]: /templates/views/
[wherefunction]: /functions/where/
[firstfunction]: /functions/first/
[mainsections]: /functions/where/#mainsections
