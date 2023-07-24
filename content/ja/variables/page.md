---
categories:
- variables and parameters
date: "2017-02-01"
description: ページレベルの変数は、コンテンツファイルのフロントマターで定義されるか、コンテンツのファイルの場所から派生するか、コンテンツの本文自体から抽出されます。
draft: false
keywords:
- pages
linktitle: null
menu:
  docs:
    parent: variables
    weight: 20
publishdate: "2017-02-01"
title: ページ変数
toc: true
weight: 20
---

以下は、ページレベル変数のリストです。 これらの多くは、フロントマターで定義されるか、ファイルの場所から派生するか、コンテンツ自体から抽出されます。

## ページ変数 {#page-variables}

.AlternativeOutputFormats
: 指定されたページのすべての代替フォーマットが含まれています。 この変数は、サイトの `<head>` 内の `link rel` リストで特に役立ちます。 ([出力フォーマット](/templates/output-formats/) を参照してください)。

.Aliases
: このページのエイリアスです。

.Ancestors
: 各ページの祖先を取得し、[パンくずナビゲーション](/content-management/sections#example-breadcrumb-navigation) 実装の複雑さを簡素化します。

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

.Fragments
: Fragments は、このページのフラグメントを返す。 [ページ フラグメント](#page-fragments) も参照してください。

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
: サイト設定内の言語定義を指す言語オブジェクトです。 `.Language.Lang` は、言語コードを提供します。

.Lastmod
: コンテンツが最後に更新された日付です。`.Lastmod` はコンテンツのフロントマターにある `lastmod` フィールドから取得します。

 - `lastmod` が設定されておらず、 `.GitInfo` 機能が無効になっている場合は、フロントマターの `date` フィールドが使用されます。
 - `lastmod` が設定されておらず、 `.GitInfo` 機能が有効になっている場合は、代わりに `.GitInfo.AuthorDate` が使用されます。

`.ExpiryDate`、`.Date`、`.PublishDate`、および [`.GitInfo`][gitinfo] も参照してください。

.LinkTitle
: コンテンツへのリンクを作成するときにアクセスします。 設定されている場合、Hugo は `title` の前に、フロントマターの `linktitle` を使用します。

.Next
: 次の [通常ページ](/variables/site/#site-pages) を指します。(Hugo の [デフォルトのソート](/templates/lists#default-weight--date--linktitle--filepath) によってソートされます)。 たとえば、 `{{ with .Next }}{{ .Permalink }}{{ end }}` です。 最初のページから `.Next` を呼び出すと、`nil` が返されます。

.NextInSection
: 同じトップレベル セクション (たとえば、 `/blog`) の次の [通常ページ](/variables/site/#site-pages) までを指します。ページは Hugo の [デフォルトのソート](/templates/lists#default-weight--date--linktitle--filepath) によってソートされます。 たとえば、 `{{ with .NextInSection }}{{ .Permalink }}{{ end }}` です。 最初のページから `.NextInSection` を呼び出すと、`nil` が返されます。

.OutputFormats
: 指定されたページの現在の形式を含む、すべての形式を含みます。 特定の形式を取得するには、[`.Get`関数](/function/get/) と組み合わせることができます。([「出力形式」](/templates/output-formats/) を参照してください)。

.Pages
: 関連するページのコレクションです。この値は、通常のコンテンツページのコンテキスト内では `nil` になります。 [`.Pages`](#pages) を参照してください。

.Permalink
: このページへのパーマネント リンクです。 [「パーマリンク」](/content-management/urls/) を参照してください。

.Plain
: ページのコンテンツから HTML タグを取り除き、文字列として表示したものです。

.PlainWords
: Go の [strings.Fields](https://golang.org/pkg/strings/#Fields) で定義されているように、.Plain を単語に分割した結果の文字列のスライスです。

.Prev
: 前の [通常ページ](/variables/site/#site-pages) を指します。(Hugo の [デフォルトのソート](/templates/lists#default-weight--date--linktitle--filepath) によってソートされます)。 たとえば、 `{{ if .Prev }}{{ .Prev.Permalink }}{{ end }}` です。 最後のページから `.Prev` を呼び出すと `nil` が返されます。

.PrevInSection
: 同じトップレベル セクション (たとえば、 `/blog`) の次の [通常ページ](/variables/site/#site-pages) までを指します。ページは Hugo の [デフォルトのソート](/templates/lists#default-weight--date--linktitle--filepath) によってソートされます。 たとえば、  `{{ if .PrevInSection }}{{ .PrevInSection.Permalink }}{{ end }}` です。 最後のページから `.Prev` を呼び出すと `nil` が返されます。

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

## 書き込み可能なページスコープ変数 {#writable-pagescoped-variables}

[.Scratch][scratch]
: データを保存および操作するためのスクラッチを返します。 [`.Store`][store] メソッドとは対照的に、このスクラッチはサーバーの再構築時にリセットされます。

[.Store][store]
: データを保存および操作するためのスクラッチを返します。 [`.Scratch`][scratch] メソッドとは対照的に、このスクラッチはサーバーの再構築時にリセットされません。

## セクション変数とセクション メソッド {#section-variables-and-methods}

[「コンテンツセクション」](/content-management/sections/) も参照してください。

{{< readfile file="/content/ja/readfiles/sectionvars.md" markdown="true" >}}

## `.Pages` 変数 {#pages}

`.Pages` は `.Data.Pages` のエイリアスです。 `.Pages` というエイリアス形式を使用するのが一般的です。

### `.Pages` と `.Site.Pages` の比較 {#pages-compared-to-sitepages}

{{< getcontent path="readfiles/pages-vs-site-pages.md" >}}

## Page fragments

{{< new-in "0.111.0" >}}

`.Fragments` メソッドは、現在のページのフラグメントのリストを返します。

.Headings
: 現在のページの見出しの再帰的なリスト。 目次を生成するために使用できます。

{{< todo >}}.Headings toc の例を追加{{< /todo >}}

.Identifiers
: 現在のページの識別子のソートされたリスト。 ページに特定の識別子が含まれているかどうか、またはページに重複した識別子が含まれているかどうかを確認するために使用できます。

```go-html-template
{{ if .Fragments.Identifiers.Contains "my-identifier" }}
    <p>Page contains identifier "my-identifier"</p>
{{ end }}

{{ if gt (.Fragments.Identifiers.Count "my-identifier")  1 }}
    <p>Page contains duplicate "my-identifier" fragments</p>
{{ end }}
```

.HeadingsMap
: 現在のページの見出しのマップを保持します。 特定の見出しから目次を開始するために使用できます。

戻り値の型については、[Go Doc](https://pkg.go.dev/github.com/gohugoio/hugo@v0.111.0/markup/tableofcontents#Fragments) も参照してください。

### フックとショートコードのフラグメント {#fragments-in-hooks-and-shortcodes}

`.Fragments` は、現在のページ (`.Page.Fragments`) 上であっても、レンダリング フックから安全に呼び出すことができます。 ショートコードの場合、すべての `.Fragments` の使用を `{{</* */>}}` ショートコード区切り文字の内側にネストすることをお勧めします (`{{%/* */%}}` は目次の作成に参加するため、尻尾を噛む状況に陥りやすくなります)。


## グローバルページ関数 {#the-global-page-function}

{{< new-in "0.111.1" >}}

Hugo はほとんどの場合、データ コンテキストとして `Page` をトップレベルのテンプレート (たとえば、`single.html`) に渡します (唯一の例外はマルチホスト サイトマップ テンプレートです)。 これは、テンプレート内の `.` 変数を使用して、現在のページにアクセスできることを意味します。

しかし、`.Render` やパーシャルなどの内部に深くネストしている場合、`Page` オブジェクトにアクセスすることは必ずしも現実的でないし、可能でもありません。

このため、Hugo では、テンプレート内のどこからでも現在のページにアクセスできるグローバル `page` 関数を提供しています。

```go-html-template
{{ page.Title }}
```

これには1つ注意点があり、これは新しいことではありませんが、ここで言及する価値があります。
それは、Hugo では、`partialCached` を使用したときやショートコードの中など、キャッシュされた値が表示される場合があることです。

## ページレベルのパラメータ {#pagelevel-params}

タクソノミーを含む、コンテンツファイルのフロントマターで定義されたその他の値は、`.Params` 変数の一部として使用可能になります。

{{< code-toggle file="content/example.md" fm=true copy=false >}}
title: Example
categories: [one]
tags: [two,three,four]
{{< /code-toggle >}}

上記のフロントマターで、`tags` と `categories` タクソノミーにアクセスするには、以下のようにします。

* `.Params.tags`
* `.Params.categories`

.Params`変数は、特にコンテンツファイルにユーザー定義のフロントマターフィールドを導入するのに便利です。たとえば、書評に関する Hugo の Web サイトでは、以下のようなフロントマターを持つことができます。

{{< code-toggle file="content/example.md" fm=true copy=false >}}
title: Example
affiliatelink: "http://www.my-book-link.here"
recommendedby: "My Mother"
{{< /code-toggle >}}

これらのフィールドは、`.Params.affiliatelink` および `.Params.recommendedby` 経由でアクセスできるようになります。

```go-html-template
<h3><a href="{{ .Params.affiliatelink }}">Buy this book</a></h3>
<p>It was recommended by {{ .Params.recommendedby }}.</p>
```

このテンプレートは、以下のようにレンダリングされます。

```html
<h3><a href="http://www.my-book-link.here">Buy this book</a></h3>
<p>It was recommended by my Mother.</p>
```

{{% note %}}
コンテンツ全体にわたる `Params` の一貫性については、[アーキタイプ](/content-management/archetypes/) を参照してください。
{{% /note %}}

### `.Param` メソッド {#the-param-method}

Hugo では、個々のページでパラメータを宣言したり、Web サイト全体でグローバルに宣言したりできます。よくある使用例としては、サイトのパラメータには一般的な値を、一部のページ (たとえば、ヘッダ画像など) にはより具体的な値を指定するというものがあります 。

```go-html-template
{{ $.Param "header_image" }}
```

`.Param` メソッドは、ページパラメータ (つまり、コンテンツのフロントマター) またはサイトパラメータ (つまり、サイト設定内) での定義に従って、単一の値を解決する方法を提供します。

### フロントマターでネストしたフィールドにアクセスする {#access-nested-fields-in-front-matter}

フロントマターが以下のようなネストしたフィールドを含む場合。

{{< code-toggle file="content/example.md" fm=true copy=false >}}
title: Example
author:
  given_name: John
  family_name: Feminella
  display_name: John Feminella
{{< /code-toggle >}}

`.Param` は、以下のようにフィールド名をドットで連結することにより、これらのフィールドにアクセスできます。

```go-html-template
{{ $.Param "author.display_name" }}
```

[gitinfo]: /variables/git/
[File Variables]: /variables/files/
[bundle]: /content-management/page-bundles
[scratch]: /functions/scratch
[store]: /functions/store
