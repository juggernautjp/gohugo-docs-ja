---
aliases: []
categories:
- variables and params
date: "2017-02-01"
description: ページレベルの変数は、コンテンツファイルのフロントマターで定義されるか、コンテンツのファイルの場所から派生するか、コンテンツの本文自体から抽出されます。
draft: false
keywords:
- pages
linktitle: null
menu:
  docs:
    parent: variables
    title: ページで定義された変数
    weight: 20
publishdate: "2017-02-01"
sections_weight: 20
title: ページ変数
toc: true
weight: 20
---

以下は、ページレベル変数のリストです。 これらの多くは、フロントマターで定義されるか、ファイルの場所から派生するか、コンテンツ自体から抽出されます。

{{% note "`.Scratch`" %}}
ページスコープの書き込み可能な変数については、[`.Scratch`](/functions/scratch/) を参照してください。
{{% /note %}}

## ページ変数 {#page-variables}

.AlternativeOutputFormats
: 指定されたページのすべての代替フォーマットが含まれています。 この変数は、サイトの `<head>` 内の `link rel` リストで特に役立ちます。 ([出力フォーマット](/templates/output-formats/) を参照してください)。

.Aliases
: このページのエイリアスです。

.BundleType
: [バンドル][bundle] タイプを指定します。ページがバンドルでない場合は、 `leaf`、 `branch`、または空文字列を指定します。

.Content
: コンテンツ自体で、フロントマターの下に定義されています。

.Data
: このタイプのページに固有のデータです。

.Date
: ページに関連付けられた日付です。 `.Date` はコンテンツのフロントマターの `date` フィールドから取得されます。また、 `.ExpiryDate` 、`.PublishDate` 、`.Lastmod` も参照してください。

.Description
: ページの説明文を指定します。

.Draft
: ブール値で、フロントマターでコンテンツがドラフトとしてマークされている場合は `true` となります。

.ExpiryDate
: コンテンツの有効期限が切れる日付です。 `.ExpiryDate` はコンテンツのフロントマターにある `expirydate` フィールドから取得します。また、 `.PublishDate` 、`.Date` 、`.Lastmod` も参照してください。

.File
: このコンテンツファイルのファイルシステム関連データです。 [ファイル変数][File Variables] も参照してください。

.FuzzyWordCount
: コンテンツのおおよその単語数です。

.IsHome
: [ホームページ](/templates/homepage/) のコンテキストで `true` となります。

.IsNode
: 通常のコンテンツページでは常に `false` です。

.IsPage
: 通常のコンテンツページでは常に `true` です。

.IsSection
: [`.Kind`](/templates/section-templates/#page-kinds) が `section` の場合は、 `true` となります。

.IsTranslated
: 表示する翻訳がある場合は、 `true` となります。

.Keywords
: コンテンツのメタキーワードを指定します。

.Kind
: ページの *種類* を返します。 可能な戻り値は、`page`、`home`、`section`、`taxonomy`、または `term` です。 `RSS`、`sitemap`、`robotsTXT`、および `404` の種類もありますが、これらはそれぞれの種類のページのレンダリング中にのみ使用可能であり、したがって、どの `Pages` コレクションでも使用 *できません*。

.Language
: サイト `config` 内の言語の定義を指す言語オブジェクトです。`.Language.Lang` は、言語コードを提供します。

.Lastmod
: コンテンツが最後に更新された日付です。`.Lastmod` はコンテンツのフロントマターにある `lastmod` フィールドから取得します。

 - `lastmod` が設定されておらず、 `.GitInfo` 機能が無効になっている場合は、フロントマターの `date` フィールドが使用されます。
 - `lastmod` が設定されておらず、 `.GitInfo` 機能が有効になっている場合は、代わりに `.GitInfo.AuthorDate` が使用されます。

`.ExpiryDate`、`.Date`、`.PublishDate`、および [`.GitInfo`][gitinfo] も参照してください。

.LinkTitle
: コンテンツへのリンクを作成するときにアクセスします。 設定されている場合、Hugo は `title` の前に、フロントマターの `linktitle` を使用します。

.Next
: 次の [通常ページ](/variables/site/#site-pages) を指します。(Hugo の [デフォルトのソート](/templates/lists#default-weight--date--linktitle--filepath) によってソートされます)。 たとえば、 `{with .Next}{{.Permalink}}{{end}}` です。 最初のページから `.Next` を呼び出すと、`nil` が返されます。

.NextInSection
: 同じトップレベル セクション (たとえば、 `/blog`) の次の [通常ページ](/variables/site/#site-pages) までを指します。ページは Hugo の [デフォルトのソート](/templates/lists#default-weight--date--linktitle--filepath) によってソートされます。 たとえば、 `{with .NextInSection}}{.Permalink}{{end}}` です。 最初のページから `.NextInSection` を呼び出すと、`nil` が返されます。

.OutputFormats
: 指定されたページの現在の形式を含む、すべての形式を含みます。 特定の形式を取得するには、[`.Get`関数](/functions/get/) と組み合わせることができます。([「出力形式」](/templates/output-formats/) を参照してください)。

.Pages
: 関連するページのコレクションです。この値は、通常のコンテンツページのコンテキスト内では `nil` になります。 [`.Pages`]({{< relref "page.md#pages" >}}) を参照してください。

.Permalink
: このページへのパーマネント リンクです。 [「パーマリンク」](/content-management/urls/) を参照してください。

.Plain
: ページのコンテンツから HTML タグを取り除き、文字列として表示したものです。

.PlainWords
: Go の [strings.Fields](https://golang.org/pkg/strings/#Fields) で定義されているように、.Plain を単語に分割した結果の文字列のスライスです。

.Prev
: 前の [通常ページ](/variables/site/#site-pages) を指します。(Hugo の [デフォルトのソート](/templates/lists#default-weight--date--linktitle--filepath) によってソートされます)。 たとえば、 `{{if .Prev}}{{.Prev.Permalink}}{{end}}` です。 最後のページから `.Prev` を呼び出すと `nil` が返されます。

.PrevInSection
: 同じトップレベル セクション (たとえば、 `/blog`) の次の [通常ページ](/variables/site/#site-pages) までを指します。ページは Hugo の [デフォルトのソート](/templates/lists#default-weight--date--linktitle--filepath) によってソートされます。 たとえば、  `{{if .PrevInSection}}{{.PrevInSection.Permalink}}{{end}}` です。 最後のページから `.Prev` を呼び出すと `nil` が返されます。

.PublishDate
: コンテンツが公開された、または公開される予定の日付です。 `.Publishdate` はコンテンツのフロントマターの `publishdate` フィールドから取得されます。また、 `.ExpiryDate` 、`.Date` 、`.Lastmod` も参照してください。

.RawContent
: フロントマターのない生の Markdown コンテンツです。 [remarkjs.com](https://remarkjs.com) と一緒に使うと便利です。

.ReadingTime
: コンテンツを読むのに必要な推定時間 (分) です。

.Resources
: このページに関連する画像や CSS などのリソースです。

.Ref
: 指定された参照のパーマリンクを返します (たとえば、 `.Ref "sample.md"`)。 `.Ref` は、ページ内フラグメントを正しく処理 *しません*。 詳細は、[「クロスリファレンス」](/content-management/cross-references/) を参照してください。

.RelPermalink
: このページの相対的なパーマネント リンクです。

.RelRef
: 指定された参照の相対パーマリンクを返します (たとえば、 `RelRef "sample.md"`)。 `.RelRef` は、ページ内フラグメントを正しく処理 *しません*。 詳細は、[「クロスリファレンス」](/content-management/cross-references/) を参照してください。

.Site
: [「サイト変数」](/variables/site/) を参照してください。

.Sites
: すべてのサイト (言語) を返します。 典型的な使用例は、`<a href="{{ .Sites.First.Home.RelPermalink }}">...</a>` のように、メイン言語にリンクを戻すことです。

.Sites.First
: 最初の言語のサイトを返します。 これが多言語設定でない場合は、それ自体が返されます。

.Summary
: サマリービューでスニペットを簡単に表示するために、コンテンツの要約を生成したものです。 ブレークポイントは、コンテンツページの適切な場所に <code>&lt;!&#x2d;&#x2d;more&#x2d;&gt;<code> を挿入して手動で設定するか、ページテキストから独立して要約を記述することができます。 詳細については、[「コンテンツサマリー」](/content-management/summaries/) を参照してください。

.TableOfContents
: ページのレンダリングされた [目次](/content-management/toc/) です。

.Title
: このページのタイトルです。

.Translations
: 現在のページの翻訳版のリストです。 詳しくは、[「多言語対応モード」](/content-management/multilingual/) を参照してください。

.TranslationKey
: 現在のページの言語翻訳をマップするために使用されるキーです。 詳しくは、[「多言語対応モード」](/content-management/multilingual/) を参照してください。

.Truncated
: ブール値で、`.Summary` が切り詰められた場合は `true` となります。 必要なときだけ、 "Read more..." リンクを表示させるのに便利です。 詳しくは、 [「コンテンツサマリー」](/content-management/summaries/) を参照してください。 

.Type
: コンテンツの [コンテンツタイプ](/content-management/types/) (たとえば、 `posts`) を指定します。

.Weight
: このコンテンツに (フロントマターで) 重みを割り当て、ソート (並べ替え) に使用します。

.WordCount
: コンテンツに含まれる単語数です。

## セクション変数とセクション メソッド {#section-variables-and-methods}

[「コンテンツセクション」](/content-management/sections/) も参照してください。

{{< readfile file="/content/ja/readfiles/sectionvars.md" markdown="true" >}}

## `.Pages` 変数 {#pages}

`.Pages` は `.Data.Pages` のエイリアスです。 `.Pages` というエイリアス形式を使用するのが一般的です。

### `.Pages` と `.Site.Pages` の比較 {#pages-compared-to-sitepages}

{{< getcontent path="readfiles/pages-vs-site-pages.md" >}}

## ページレベルのパラメータ {#pagelevel-params}

タクソノミーを含む、コンテンツファイルのフロントマターで定義されたその他の値は、`.Params` 変数の一部として使用可能になります。

```yml
---
title: My First Post
date: 2017-02-20T15:26:23-06:00
categories: [one]
tags: [two,three,four]
```

上記のフロントマターで、`tags` と `categories` タクソノミーにアクセスするには、以下のようにします。

* `.Params.tags`
* `.Params.categories`

{{% note "Casing of Params" %}}
ページレベルの `.Params` は、小文字で *のみ* アクセス可能です。
{{% /note %}}

`.Params` 変数は、コンテンツファイルにユーザー定義のフロントマター フィールドを導入する際に特に便利です。たとえば、書評に関する Hugo の Web サイトでは、`/content/review/book01.md` に以下のフロントマターを含めることができます。

```yml
---
...
affiliatelink: "http://www.my-book-link.here"
recommendedby: "私の母"
...
---
```

上記のフィールドは、それぞれ `.Params.affiliatelink` と `.Params.recommendedby` を介して、 `/themes/yourtheme/layouts/review/single.html` テンプレートからアクセスできます。

このタイプのフロントマター フィールドが導入される 2 つの一般的な状況は、`href=""` のような特定の属性の値として、またはそれ自体で Web サイトの訪問者にテキストとして表示されることです。

{{< code file="/themes/yourtheme/layouts/review/single.html" >}}
<h3><a href={{ printf "%s" $.Params.affiliatelink }}>この本を購入する</a></h3>
<p>{{ .Params.recommendedby }} に勧められました。</p>
{{< /code >}}

[サイト `config`](/getting-started/configuration/) で [`uglyURLs`](/content-management/urls/) を `false` に設定した場合、このテンプレートは以下のようにレンダリングされます。

{{< output file="yourbaseurl/review/book01/index.html" >}}
<h3><a href="http://www.my-book-link.here">この本を購入する</a></h3>
<p>私の母に勧められました。</p>
{{< /output >}}

{{% note %}}
コンテンツ間の `Params` の一貫性については、 [「アーキタイプ」](/content-management/archetypes/) を参照してください。
{{% /note %}}

### `.Param` メソッド {#the-param-method}

Hugo では、個々のページでパラメータを宣言したり、Web サイト全体でグローバルに宣言したりできます。よくある使用例としては、サイトのパラメータには一般的な値を、一部のページ (たとえば、ヘッダ画像など) にはより具体的な値を指定するというものがあります 。

```go-html-template
{{ $.Param "header_image" }}
```

`.Param` メソッドは、ページパラメータ (つまり、コンテンツのフロントマター) またはサイトパラメータ (つまり、`config` 内) での定義に従って、単一の値を解決する方法を提供します。

### フロントマターでネストしたフィールドにアクセスする {#access-nested-fields-in-front-matter}

フロントマターが以下のようなネストしたフィールドを含む場合。

```yml
---
author:
  given_name: John
  family_name: Feminella
  display_name: John Feminella
---
```

`.Param` は、以下のようにフィールド名をドットで連結することにより、これらのフィールドにアクセスできます。

```go-html-template
{{ $.Param "author.display_name" }}
```

以下の場合のように、フロントマターにネストされたキーとあいまいなトップレベルのキーを含んでいる場合。

```yml
---
favorites.flavor: vanilla
favorites:
  flavor: chocolate
---
```

トップレベルのキーが優先されます。したがって、以下のメソッドを先ほどの例に適用すると、 `chocolate` ではなく `vanilla` と表示されます。

```txt
{{ $.Param "favorites.flavor" }}
=> vanilla
```

[gitinfo]: /variables/git/
[File Variables]: /variables/files/
[bundle]: {{< relref "content-management/page-bundles" >}}
