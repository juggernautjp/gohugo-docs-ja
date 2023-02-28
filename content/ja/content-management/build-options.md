---
aliases:
- /content/build-options/
categories:
- content management
date: "2020-03-02"
description: ビルドオプションは、サイトをビルドするときに Hugo が特定のページをどのように処理する必要があるかを定義するのに役立ちます。
draft: false
keywords:
- build
- content
- front matter
- page resources
linktitle: ビルドオプション
menu:
  docs:
    parent: content-management
    weight: 70
publishdate: "2020-03-02"
title: ビルドオプション
toc: true
weight: 70
---

これらは、`_build` という名前の予約されたフロントマター オブジェクトに格納され、以下のようなデフォルトが設定されています。

{{< code-toggle >}}
_build:
  render: always
  list: always
  publishResources: true
{{< /code-toggle >}}

#### render

値が `always` の場合、そのページは公開ページとして扱われ、専用の出力ファイル (`index.html` など) とパーマリンクが保持されます。

{{< new-in "0.76.0" >}} Hugo 0.76.0 で、このプロパティをブール値から列挙型に拡張しました。 有効な値は以下のとおりです。

never
: ページは、どのページコレクションにも含まれません。

always (デフォルト)
: ページはディスクにレンダリングされ、`RelPermalink` などを取得します。

link
: ページはディスクにレンダリングされませんが、`RelPermalink` を取得します。

#### list

Hugo 0.68.0 で、このプロパティをブール値から列挙型に拡張したことに注意してください。

有効な値は以下のとおりです。

never
: ページは、どのページコレクションにも含まれません。

always (デフォルト)
: ページはすべてのページコレクション、たとえば、 `site.RegularPages`、 `$page.Pages` などに含まれます。

local
: ページは、任意の _local_ ページコレクション、たとえば `$page.RegularPages` や `$page.Pages` に含まれます。この使用例の 1 つは、完全にナビゲート可能で、かつ、ヘッドレスのコンテンツ セクションを作成することです。 {{< new-in "0.68.0" >}}

true の場合、ページはプロジェクトのコレクションの一部として扱われ、必要に応じて Hugo のリストメソッド (`.Pages`、`.RegularPages` など) で返されるようになります。

#### publishResources

true に設定すると、[バンドル内のリソース]({{< relref "content-management/page-bundles" >}}) が公開されます。
これを false に設定すると、引き続きリソースがオンデマンドで公開されますが (リソースの `.Permalink` または `.RelPermalink` がテンプレートから呼び出された場合)、それ以外のリソースはスキップされます。

{{% note %}}
どのページも、ビルドオプションに関係なく、常に [`.GetPage`]({{< relref "functions/GetPage" >}}) メソッドを使用して利用することができます。
{{% /note %}}

------

### ユースケースの例 {#illustrative-use-cases}

#### ページを公開しない {#not-publishing-a-page}

プロジェクトでは、フロントマターとボディに "Who We Are" というコンテンツファイルが必要で、ホームページで使用されますが、それ以外の場所では使用されません。

```yaml
# content/who-we-are.md`
title: Who we are
_build:
 list: false
 render: false
```

```go-html-template
{{/* layouts/index.html */}}
<section id="who-we-are">
{{ with site.GetPage "who-we-are" }}
  {{ .Content }}
{{ end }}
</section>
```

#### ページを公開せずに一覧表示する {#listing-pages-without-publishing-them}

Web サイトは、コンテンツファイルとして利用できる 100 の「お客様の声」のうちのいくつかを公開せずに紹介する必要があります。

すべての「お客様の声」にビルドオプションを設定しないようにするためには、「お客様の声」セクションのコンテンツファイルで [`cascade`]({{< relref "/content-management/front-matter#front-matter-cascade" >}}) を使用できます。

{{< code-toggle >}}
title: Testimonials
_build:
  render: true
cascade:
  _build:
    render: false
    list: true # default
{{< /code-toggle >}}

```go-html-template
{{/* layouts/_defaults/testimonials.html */}}
<section id="testimonials">
{{ range first 5 .Pages }}
  <blockquote cite="{{ .Params.cite }}">
    {{ .Content }}
  </blockquote>
{{ end }}
</section>
