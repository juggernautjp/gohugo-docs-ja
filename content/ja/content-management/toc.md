---
aliases:
- /extras/toc/
categories:
- content management
date: "2017-02-01"
description: Hugo は Markdown コンテンツを自動的に解析し、テンプレートで使用できる目次を作成できます。
draft: false
keywords:
- table of contents
- toc
lastmod: "2017-02-01"
linktitle: null
menu:
  docs:
    parent: content-management
    weight: 210
publishdate: "2017-02-01"
title: 目次
toc: true
weight: 210
---

{{% note "TOC Heading Levels are Fixed" %}}

以前は、目次をレンダリングする見出しレベルをすぐに指定する方法はありませんでした。
[関連する GitHub の議論 (#1778) を参照してください](https://github.com/gohugoio/hugo/issues/1778)。 
そのため、結果の `<nav id="TableOfContents"><ul></ul></nav>` は `{{.Content}}` から取得する際に `<h1>` から始まることになっていました。

Hugo [v0.60.0](https://github.com/gohugoio/hugo/releases/tag/v0.60.0) は Markdown のデフォルトライブラリを [Goldmark](https://github.com/yuin/goldmark/) に変更しました。これにより、目次の実装が改善され、設定可能になりました。 Goldmark レンダラーについては、 [「目次の設定方法」](/getting-started/configuration-markup/#table-of-contents) を参照してください。

{{% /note %}}

## 使用方法 {#usage}

適切な見出しを付けて、通常の方法で Markdown を作成します。以下はコンテンツの例です。

```md
<!-- ここにフロントマターを記述します -->

## Introduction

One morning, when Gregor Samsa woke from troubled dreams, he found himself transformed in his bed into a horrible vermin.

## My Heading

He lay on his armour-like back, and if he lifted his head a little he could see his brown belly, slightly domed and divided by arches into stiff sections. The bedding was hardly able to cover it and seemed ready to slide off any moment.

### My Subheading

A collection of textile samples lay spread out on the table - Samsa was a travelling salesman - and above it there hung a picture that he had recently cut out of an illustrated magazine and housed in a nice, gilded frame. It showed a lady fitted out with a fur hat and fur boa who sat upright, raising a heavy fur muff that covered the whole of her lower arm towards the viewer. Gregor then turned to look out the window at the dull weather. Drops
```

Hugo は上記の Markdown を受け取り、`## Introduction`、`## My Heading`、`### My Subheading` から目次を作成し、[ページ変数][pagevars]`.TableOfContents` に格納します。

組み込みの `.TableOfContents` 変数は、 `<nav id="TableOfContents">` 要素とその子 `<ul>` を出力し、その子 `<li>` 要素は適切な HTML 見出しから始まります。 目次にどのレベルの見出しを含めるかを設定するには、[「利用可能な設定」](/getting-started/configuration-markup/#table-of-contents) を参照してください。

## テンプレートの例: 基本的な目次 {#template-example-basic-toc}

以下は、ごく基本的な [シングルページテンプレート][single page template] の例です。

{{< code file="layout/_default/single.html" download="single.html" >}}
{{ define "main" }}
<main>
    <article>
    <header>
        <h1>{{ .Title }}</h1>
    </header>
        {{ .Content }}
    </article>
    <aside>
        {{ .TableOfContents }}
    </aside>
</main>
{{ end }}
{{< /code >}}

## テンプレートの例: TOC パーシャル (部分テンプレート) {#template-example-toc-partial}

以下は、目次をページレベルで制御するためのロジックを少し追加した [部分テンプレート][partials] です。コンテンツの [フロントマター][front matter] で `toc` フィールドを使用していることを前提としています。特に `false` に設定しない限り、`.WordCount` ([ページ変数][pagevars] を参照) が 400 を超えるページには目次が追加されます。この例は、テンプレートで [条件][conditionals] を使用する方法も示しています。

{{< code file="layouts/partials/toc.html" download="toc.html" >}}
{{ if and (gt .WordCount 400 ) (.Params.toc) }}
<aside>
    <header>
    <h2>{{.Title}}</h2>
    </header>
    {{.TableOfContents}}
</aside>
{{ end }}
{{< /code >}}

{{% note %}}
上記の例では、400 語以上のページで、*かつ* `toc` が `false` に設定されていない場合でも、 取得するページ内に `{{.TableOfContents}}` 変数の見出しがなければ、目次は表示されません。
{{% /note %}}

## AsciiDoc での使用方法 {#usage-with-asciidoc}

Hugo は、AsciiDoc コンテンツフォーマットで目次をサポートしています。

コンテンツファイルのヘッダーで、目次を確実に生成するために必要な AsciiDoc TOC ディレクティブを指定します。 Hugo は生成された TOC を使用して、Markdown で説明したのと同じ方法でページ変数 `.TableOfContents` を設定します。 以下の例を参照してください。

```asciidoc
// <!-- ここにフロントマターを記述します -->
:toc:
// toclevels に hugo の [markup.tableOfContents.endLevel] 設定キー以上の値を設定します
:toclevels: 4

== Introduction

One morning, when Gregor Samsa woke from troubled dreams, he found himself transformed in his bed into a horrible vermin.

== My Heading

He lay on his armour-like back, and if he lifted his head a little he could see his brown belly, slightly domed and divided by arches into stiff sections. The bedding was hardly able to cover it and seemed ready to slide off any moment.

=== My Subheading

A collection of textile samples lay spread out on the table - Samsa was a travelling salesman - and above it there hung a picture that he had recently cut out of an illustrated magazine and housed in a nice, gilded frame. It showed a lady fitted out with a fur hat and fur boa who sat upright, raising a heavy fur muff that covered the whole of her lower arm towards the viewer. Gregor then turned to look out the window at the dull weather. Drops
```
Hugo はこの AsciiDoc を受け取って目次を作り、Markdown で説明したのと同じように、ページ変数 `.TableOfContents` に格納します。

[conditionals]: /templates/introduction/#conditionals
[front matter]: /content-management/front-matter/
[pagevars]: /variables/page/
[partials]: /templates/partials/
[single page template]: /templates/single-page-templates/
