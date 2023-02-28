---
aliases:
- /templates/partial/
- /layout/chrome/
- /extras/analytics/
categories:
- templates
date: "2017-02-01"
description: 部分テンプレート (パーシャル) は、リストやページのテンプレートに含まれる、文脈を考慮した小さなコンポーネントで、テンプレートを DRY に保つために経済的に使用できます。
draft: false
keywords:
- lists
- sections
- partials
lastmod: "2017-02-01"
linktitle: 部分テンプレート
menu:
  docs:
    parent: templates
    weight: 90
publishdate: "2017-02-01"
sections_weight: 90
title: 部分テンプレート
toc: true
weight: 90
---

{{< youtube pjS4pOLyB7c >}}

## 部分テンプレートの検索順序 {#partial-template-lookup-order}

[シングルページ テンプレート][singletemps] および [リストページ テンプレート][listtemps] のような **部分テンプレート**には、特定の [検索順序][lookup order] があります。 ただし、部分テンプレートは、Hugo が 2 つの場所でのみチェックするという点で単純です。

1. `layouts/partials/*<PARTIALNAME>.html`
2. `themes/<THEME>/layouts/partials/*<PARTIALNAME>.html`

これにより、テーマのエンドユーザーは、[さらなるカスタマイズ][customize] のために、部分テンプレートのコンテンツを同じ名前のファイルにコピーできます。

## テンプレートに部分テンプレートを使用する {#use-partials-in-your-templates}

Hugo プロジェクトのすべての部分テンプレートは、単一の `layouts/partials` ディレクトリに格納されます。 より良い構成のために、以下のように、`partials` 内に複数のサブディレクトリを作成することもできます。

```txt
layouts/
└── partials/
    ├── footer/
    │   ├── scripts.html
    │   └── site-footer.html
    ├── head/
    │   ├── favicons.html
    │   ├── metadata.html
    │   ├── prerender.html
    │   └── twitter.html
    └── header/
        ├── site-header.html
        └── site-nav.html
```

すべての部分テンプレートは、テンプレート内で以下のパターンを使用して呼び出されます。

```go-html-template
{{ partial "<PATH>/<PARTIAL>.html" . }}
```

{{% note %}}
新しい Hugo ユーザーによくある間違いの 1 つは、部分呼び出しにコンテキストを渡さないことです。 上記のパターンでは、部分的なコンテキストを指定するために、 2 番目の引数として「ドット」 (`.`) が必要であることに注意してください。 「ドット」の詳細については、[「Hugo テンプレート入門」](/templates/introduction/) を参照してください。
{{% /note %}}

{{% note %}}
`baseof` を含む `<PARTIAL>` は予約されています。([#5373](https://github.com/gohugoio/hugo/issues/5373))
{{% /note %}}

上記のディレクトリ構造の例で示したように、 ディレクトリを `partials` 内にネストさせることで、より良いソース構成を実現できます。ネストされた部分テンプレートのパスは、以下のように、 `partials` ディレクトリからの相対パスとして呼び出すだけです。

```go-html-template
{{ partial "header/site-header.html" . }}
{{ partial "footer/scripts.html" . }}
```

### 変数のスコープ {#variable-scoping}

部分呼び出しの 2 番目の引数は、渡される変数です。 上記の例では `.` を渡していますが、これは部分テンプレートを受け取るテンプレートに現在の [コンテキスト][context] を適用するように指示します。

これは、部分テンプレートがこれらの変数に *唯一* アクセスできることを意味します。部分テンプレートは分離され、*外部スコープにはアクセスできません*。 部分テンプレート内では、`$.Var` は `.Var` と同等です。

## 部分テンプレートから値を返す {#returning-a-value-from-a-partial}

マークアップの出力に加えて、部分テンプレートを使用して任意の型の値を返すことができます。 値を返すために、部分テンプレートは *部分テンプレートの末尾に*、単一の `return` 文を含める必要があります。

### GetFeatured の例 {#example-getfeatured}

```go-html-template
{{/* layouts/partials/GetFeatured.html */}}
{{ return first . (where site.RegularPages "Params.featured" true) }}
```

```go-html-template
{{/* layouts/index.html */}}
{{ range partial "GetFeatured.html" 5 }}
  [...]
{{ end }}
```

### GetImage の例 {#example-getimage}

```go-html-template
{{/* layouts/partials/GetImage.html */}}
{{ $image := false }}
{{ with .Params.gallery }}
  {{ $image = index . 0 }}
{{ end }}
{{ with .Params.image }}
  {{ $image = . }}
{{ end }}
{{ return $image }}
```

```go-html-template
{{/* layouts/_default/single.html */}}
{{ with partial "GetImage.html" . }}
  [...]
{{ end }}
```

{{% note %}}
1つの 部分テンプレートファイルにつき、`return` 文は 1 つだけ許可されます。
{{% /note %}}

## インライン部分テンプレート {#inline-partials}

テンプレートで部分テンプレートをインラインで定義することもできます。 ただし、テンプレートの名前空間はグローバルであるため、競合を避けるために名前が一意であることを確認する必要があります。

```go-html-template
Value: {{ partial "my-inline-partial.html" . }}

{{ define "partials/my-inline-partial.html" }}
{{ $value := 32 }}
{{ return $value }}
{{ end }}
```

## キャッシュされた部分テンプレート {#cached-partials}

[`partialCached` テンプレート関数][partialcached] は、呼び出しごとに再レンダリングする必要のない複雑なテンプレートのパフォーマンスを大幅に向上させることができます。 最も単純な使用方法は、以下のとおりです。

```go-html-template
{{ partialCached "footer.html" . }}
```

また、 `partialCached` に追加のパラメータを渡すことで、キャッシュされたパーシャルの *バリアント* を作成することができます。

たとえば、以下のコードで、セクションごとに 1 回だけ部分的な `footer.html` をレンダリングするように Hugo に指示できます。

```go-html-template
{{ partialCached "footer.html" . .Section }}
```

一意のバリアントを作成するために追加のパラメータを渡す必要がある場合は、以下のように、必要な数のバリアント パラメータを渡すことができます。

```go-html-template
{{ partialCached "footer.html" . .Params.country .Params.province }}
```

バリアント パラメータは基本的な部分テンプレートでは利用できないことに注意してください。これらは、一意のキャッシュキーを作成するためにのみ使用されます。

### `header.html` の例 {#example-headerhtml}

以下の `header.html` 部分テンプレートは、 [spf13.com](https://spf13.com/) のために使用されています。

{{< code file="layouts/partials/header.html" download="header.html" >}}
<!DOCTYPE html>
<html class="no-js" lang="en-US" prefix="og: http://ogp.me/ns# fb: http://ogp.me/ns/fb#">
<head>
    <meta charset="utf-8">

    {{ partial "meta.html" . }}

    <base href="{{ .Site.BaseURL }}">
    <title> {{ .Title }} : spf13.com </title>
    <link rel="canonical" href="{{ .Permalink }}">
    {{ if .RSSLink }}<link href="{{ .RSSLink }}" rel="alternate" type="application/rss+xml" title="{{ .Title }}" />{{ end }}

    {{ partial "head_includes.html" . }}
</head>
{{< /code >}}

{{% note %}}
`header.html` のサンプルの部分テンプレートは、ブロックテンプレートが Hugo に導入される前に作成されました。 マスターテンプレートの外側のクロムまたはシェル (つまり、サイトのヘッド、ヘッダー、およびフッター) を定義するために、[ベーステンプレートとブロック](/templates/base/) の詳細を参照してください。 柔軟性を高めるために、ブロックと部分テンプレートを組み合わせることもできます。
{{% /note %}}

### `footer.html` の例 {#example-footerhtml}

以下の `footer.html` 部分テンプレートは、 [spf13.com](https://spf13.com/) のために使用されています。

{{< code file="layouts/partials/footer.html" download="footer.html" >}}
<footer>
  <div>
    <p>
    &copy; 2013-14 Steve Francia.
    <a href="https://creativecommons.org/licenses/by/3.0/" title="Creative Commons Attribution">無断転載を禁じます</a>;
    適切に属性を付けてリンクバックしてください。
    </p>
  </div>
</footer>
{{< /code >}}

[context]: /templates/introduction/ "Go テンプレートについて理解する上で最も見落としやすいコンセプトは、ドットが常に現在のコンテキストを参照する方法です。"
[customize]: /themes/customizing/ "Hugo は、ユーザーが Hugo のテンプレート検索順序に慣れている限り、テーマをカスタマイズする簡単な手段を提供します。"
[listtemps]: /templates/lists/ "Hugo のシステムを効果的に活用するには、セクション、タクソノミー、ホームページのコンテンツをリスト化し、順序付けるリストページの処理方法を確認してください。"
[lookup order]: /templates/lookup-order/ "テンプレートをドライに保つには、Hugo の検索順序に関するドキュメントを読んでください。"
[partialcached]: /functions/partialcached/ "Hugo がすべてのページでレンダリングする必要のない部分テンプレートをキャッシュできる場合は、部分テンプレート キャッシュ関数を使用してビルド時間を改善します。"
[singletemps]: /templates/single-page-templates/ "Hugo のテンプレートの最も一般的な形式は、シングルコンテンツ テンプレートです。 個々のページのためのテンプレートを作成する方法については、ドキュメントを参照してください。"
[themes]: /themes/
