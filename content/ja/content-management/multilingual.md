---
aliases:
- /content/multilingual/
- /tutorials/create-a-multilingual-site/
categories:
- content management
date: "2017-01-10"
description: Hugo は、複数の言語を並べて表示する Web サイトの作成をサポートしています。
draft: false
keywords:
- multilingual
- i18n
- internationalization
linktitle: 多言語対応
menu:
  docs:
    parent: content-management
    weight: 230
publishdate: "2017-01-10"
title: 多言語対応モード
toc: true
weight: 230
---

利用可能な言語は、サイト設定の `languages` セクションで定義する必要があります。

[Hugo の多言語対応 パート1: コンテンツの翻訳][Hugo Multilingual Part 1: Content translation] も参照してください。

## 言語を設定する {#configure-languages}

これは多言語プロジェクトのサイト設定の例です。`languages` オブジェクトで定義されていないキーは、サイト設定のルートにあるグローバル値にフォールバックされます。

{{< code-toggle file="hugo" >}}
defaultContentLanguage = 'de'
defaultContentLanguageInSubdir = true

[languages.de]
contentDir = 'content/de'
disabled = false
languageCode = 'de-DE'
languageDirection = 'ltr'
languageName = 'Deutsch'
title = 'Projekt Dokumentation'
weight = 1

[languages.de.params]
subtitle = 'Referenz, Tutorials und Erklärungen'

[languages.en]
contentDir = 'content/en'
disabled = false
languageCode = 'en-US'
languageDirection = 'ltr'
languageName = 'English'
title = 'Project Documentation'
weight = 2

[languages.en.params]
subtitle = 'Reference, Tutorials, and Explanations'
{{< /code-toggle >}}

`defaultContentLanguage`
: (`string`) [RFC 5646] で定義されているプロジェクトのデフォルトの言語タグです。小文字でなければならず、定義されている言語キーのいずれかにマッチする必要があります。デフォルトは `en` です。
たとえば、以下になります。

- `en`
- `en-gb`
- `pt-br`

`defaultContentLanguageInSubdir`
: (`bool`)  `true` の場合、デフォルトの言語サイトを `defaultContentLanguage` にマッチするサブディレクトリにレンダリングします。デフォルトは `false` です。

`contentDir`
: (`string`) この言語のコンテンツ ディレクトリです。 [ファイル名で翻訳する][translating by file name] 場合は省略します。

`disabled`
: (`bool`)  `true` の場合、Hugo はこの言語のコンテンツをレンダリングしません。 デフォルトは `false` です。

`languageCode`
: (`string`) [RFC 5646] で定義されている言語タグです。この値には大文字や小文字、ハイフンやアンダースコアを含めることができ、ローカライズや URL には影響しません。Hugo はこの値を [組み込み RSS テンプレート][built-in RSS template] の `language` 要素と [組み込みエイリアス テンプレート][built-in alias template] の `html` 要素の `lang` 属性に使用します。たとえば、以下になります。

- `en`
- `en-GB`
- `pt-BR`

`languageDirection`
: (`string`) 言語の方向です。左から右 (`ltr`) または右から左 (`rtl`) のどちらかになります。この値はグローバルな [`dir`] HTML 属性を持つテンプレートで使用してください。

`languageName`
: (`string`) 言語名です。通常、言語スイッチャーをレンダリングするときに使用されます。

`title`
: (`string`) 言語のタイトルです。 設定すると、この言語のサイトタイトルが上書きされます。

`weight`
: (`int`) 言語の重みです。 0 以外の値に設定すると、これがこの言語の主な並べ替え基準になります。

[`dir`]: https://developer.mozilla.org/en-US/docs/Web/HTML/Global_attributes/dir
[built-in RSS template]: https://github.com/gohugoio/hugo/blob/master/tpl/tplimpl/embedded/templates/_default/rss.xml
[built-in alias template]: https://github.com/gohugoio/hugo/blob/master/tpl/tplimpl/embedded/templates/alias.html
[RFC 5646]: https://datatracker.ietf.org/doc/html/rfc5646
[translating by file name]: #translation-by-file-name

### Hugo 0.112.0 での変更点 {#changes-in-Hugo-0.112.0}

{{< new-in "0.112.0" >}}

Hugo `v0.112.0` では、すべての設定オプションを統合し、言語とそのパラメータをメイン設定にマージする方法を改善しました。
しかし、これを Hugo サイトでテストしているときに、いくつかのエラー報告を受け取り、非推奨の警告を優先して、以下のように変更の一部を元に戻しました。

1. `site.Language.Params` は非推奨です。直接、 `site.Params` を使用してください。
2. トップレベルの言語設定へのカスタム パラメータの追加は非推奨です。これらをすべて `[params]` の下に追加します。以下の例の `color` を参照してください。

```toml
title = "My blog"
languageCode = "en-us"

[languages]
[languages.sv]
title = "Min blogg"
languageCode = "sv"
[languages.en.params]
color = "blue"
```

上記の例では、`params` 以下の `color` 以外のすべての設定は、Hugo のサイトとその言語に関する定義済みの設定オプションにマップされており、以下のような文書化されたアクセサを介してアクセスする必要があります。

```go-html-template
{{ site.Title }}
{{ site.LanguageCode }}
{{ site.Params.color }}
```

### 言語を無効にする {#disable-a-language}

サイト設定の `languages` オブジェクト内の言語を無効にするには、以下のようにします。

{{< code-toggle file="hugo" copy=false >}}
[languages.es]
disabled = true
{{< /code-toggle >}}

サイト設定のルートで1つまたは複数の言語を無効にするには、以下のようにします。

{{< code-toggle file="hugo" copy=false >}}
disableLanguages = ["es", "fr"]
{{< /code-toggle >}}

環境変数を使用して 1 つ以上の言語を無効にするには、以下のようにします。

```bash
HUGO_DISABLELANGUAGES="es fr" hugo
```

デフォルトのコンテンツ言語を無効にすることはできないことに注意してください。

### 多言語対応マルチホストの設定 {#configure-multilingual-multihost}

**Hugo 0.31** 以降、マルチホスト構成で複数の言語をサポートしています。 詳細については、[「この Issue」](https://github.com/gohugoio/hugo/issues/4027) を参照してください。

つまり、`language` ごとに `baseURL` を設定できるようになったということです。

{{% note %}}
`baseURL` が `language` レベルで設定されている場合、すべての言語に `baseURL` が必要であり、それらはすべて異なっている必要があります。
{{% /note %}}

例:

{{< code-toggle file="config" >}}
[languages]
[languages.fr]
baseURL = "https://example.fr"
languageName = "Français"
weight = 1
title = "En Français"

[languages.en]
baseURL = "https://example.com"
languageName = "English"
weight = 2
title = "In English"
{{</ code-toggle >}}

上記により、2 つのサイトが独自のルートを持つ `public` に生成されます。

```text
public
├── en
└── fr
```

**すべてのURL（つまり `.Permalink` など）は、このルートから生成されます。つまり、上記の英語のホームページの `.Permalink` は `https://example.com/` に設定されることになります。**

`hugo server` を実行すると、複数の HTTP サーバが起動されます。通常、コンソールには以下のような表示が出力されます。

```text
Web Server is available at 127.0.0.1:1313 (bind address 127.0.0.1)
Web Server is available at 127.0.0.1:1314 (bind address 127.0.0.1)
Press Ctrl+C to stop
```

サーバー間のライブリロードと `--navigateToChanged` は期待通りに動作しています。


## コンテンツを翻訳する {#translate-your-content}

コンテンツの翻訳を管理するには、2 つの方法があります。 どちらも、各ページに言語が割り当てられ、対応する翻訳にリンクされていることを確認します。

### ファイル名による翻訳 {#translation-by-filename}

以下の例で考えてみます。

1. `/content/about.en.md`
2. `/content/about.fr.md`

最初のファイルには英語が割り当てられ、2 番目のファイルにリンクされています。
2 番目のファイルにはフランス語が割り当てられ、最初のファイルにリンクされています。

それぞれの言語は、__ファイル名のサフィックス__ として付加される言語コードに従って __割り当てられます__。

同じ **パスとベース ファイル名** を 持つことで、コンテンツの断片は翻訳されたページとして一緒に __リンク__ されます。

{{% note %}}
ファイルに言語コードがない場合、デフォルトの言語が割り当てられます。
{{% /note %}}

### コンテンツディレクトリによる翻訳 {#translation-by-content-directory}

このシステムでは、各言語ごとに異なるコンテンツディレクトリを使用します。各言語のコンテンツディレクトリは `contentDir` パラメータで設定します。

{{< code-toggle file="hugo" >}}
languages:
  en:
    weight: 10
    languageName: "English"
    contentDir: "content/english"
  fr:
    weight: 20
    languageName: "Français"
    contentDir: "content/french"
{{< /code-toggle >}}

`contentDir` の値には、任意の有効なパス (絶対パス参照も含む) を指定することができます。唯一の制限は、コンテンツディレクトリは重複できないことです。

上記の設定と合わせて、以下の例を考えてみます。

1. `/content/english/about.md`
2. `/content/french/about.md`

最初のファイルには英語が割り当てられ、2 番目のファイルにリンクされています。
2 番目のファイルにはフランス語が割り当てられ、最初のファイルにリンクされています。

それらの言語は、__配置されている__ コンテンツディレクトリに従って __割り当てられます__。

同じ **パスとベース名** (言語コンテンツ ディレクトリからの相対パス) を持つことで、コンテンツの断片は翻訳されたページとして一緒に __リンク__ されます。

### デフォルトのリンクを回避する {#bypassing-default-linking}

フロントマターに設定された `translationKey` を共有するすべてのページは、ベース名や場所に関係なく、翻訳されたページとしてリンクされます。

以下の例で考えてみます。

1. `/content/about-us.en.md`
2. `/content/om.nn.md`
3. `/content/presentation/a-propos.fr.md`

{{< code-toggle >}}
translationKey: "about"
{{< /code-toggle >}}

3 つのページで `translationKey` フロントマター パラメータを `about` に設定することで、翻訳されたページとして __リンクされます__。

### パーマリンクのローカライズ {#localizing-permalinks}

パスとファイル名はリンクの処理に使用されるため、翻訳されたすべてのページは (言語サブディレクトリを除いて) 同じ URL を共有します。

URL をローカライズするには、以下のようにします。

- 通常ページの場合は、フロントマターに [`slug`] または [`url`] を設定します
- セクションページの場合は、フロントマターに [`url`] を設定します

[`slug`]: /content-management/urls/#slug
[`url`]: /content-management/urls/#url

たとえば、フランス語の翻訳は、独自のローカライズされたスラグを持つことができます。

{{< code-toggle file="content/about.fr.md" fm=true copy=false >}}
title: A Propos
slug: "a-propos"
{{< /code-toggle >}}

レンダリング時に、Hugo は `/about/` と `/fr/a-propos/` の翻訳リンクを維持したまま、両方をビルドします。

### ページバンドル {#page-bundles}

ファイルの重複を避けるため、各ページバンドルは、コンテンツファイル (Markdown ファイル、HTML ファイルなど) を除き、リンク先の翻訳ページバンドルのリソースを継承します。

したがって、テンプレート内から、ページはリンクされたすべてのページのバンドルからファイルにアクセスできるようになります。

リンクされたバンドル全体で、2つ以上のファイルが同じベースネームを共有している場合、1 つのファイルだけが含まれ、以下のように選択されます。

* 現在の言語バンドルのファイル (存在する場合)。
* バンドル間で、言語 `Weight` の順番で最初に見つかったファイル。

{{< note >}}
ページバンドルのリソースは、ファイル名 (`image.jpg`、`image.fr.jpg`) とディレクトリ (`english/about/header.jpg`、`french/about/header.jpg`) によって、コンテンツファイルと同じ言語割り当てロジックに従います。
{{%/ note %}}

## 翻訳されたコンテンツを参照する {#reference-the-translated-content}

翻訳コンテンツへのリンク集を作成する場合は、以下のようなテンプレートを使用します。

{{< code file="layouts/partials/i18nlist.html" >}}
{{ if .IsTranslated }}
<h4>{{ i18n "translations" }}</h4>
<ul>
  {{ range .Translations }}
  <li>
    <a href="{{ .Permalink }}">{{ .Lang }}: {{ .Title }}{{ if .IsPage }} ({{ i18n "wordCount" . }}){{ end }}</a>
  </li>
  {{ end }}
</ul>
{{ end }}
{{< /code >}}

上記は `partial` (つまり、`layouts/partials/` 内) に配置でき、[単一のコンテンツページ][contenttemplate] または [ホームページ][homepage] のいずれのテンプレートにも含めることができます。 指定されたページに翻訳がない場合、何も出力されません。

上記では、次のセクションで説明する [`i18n` 関数][i18func] も使用します。

### 利用可能なすべての言語を一覧表示する {#list-all-available-languages}

`Page` の `.AllTranslations` を使用して、ページ自体を含むすべての翻訳を一覧表示できます。 ホームページでは、言語ナビゲーターを構築するために使用できます。

{{< code file="layouts/partials/allLanguages.html" >}}
<ul>
{{ range $.Site.Home.AllTranslations }}
<li><a href="{{ .Permalink }}">{{ .Language.LanguageName }}</a></li>
{{ end }}
</ul>
{{< /code >}}

## 文字列の翻訳 {#translation-of-strings}

Hugo は [go-i18n] を使用して文字列の翻訳をサポートしています。 [プロジェクトのソースリポジトリ][go-i18n-source] には、翻訳ワークフローの管理に役立つツールがあります。

翻訳は `themes/<THEME>/i18n/` フォルダー (テーマに組み込まれている) から集められ、プロジェクトのルートにある `i18n/` に存在する翻訳も同様に集められます。 `i18n` では、翻訳がマージされ、テーマフォルダーにあるものよりも優先されます。 言語ファイルは [RFC 5646] に従って、 `en-US.toml` や `fr.toml` などの名前を付ける必要があります。

[RFC 5646 &#167; 2.2.7](https://datatracker.ietf.org/doc/html/rfc5646#section-2.2.7) で定義されている私的利用のサブタグを持つ人工言語もサポートされています。簡潔さを保つために `art-x-` という接頭辞を省略することができます。例えば、以下の通りです。

```text
art-x-hugolang
hugolang
```

私的利用のサブタグは、英数字で8文字以内でなければなりません。

### 基本翻訳をクエリする {#query-basic-translation}

テンプレートの中から、以下のように `i18n` 関数を使用します。

```go-html-template
{{ i18n "home" }}
```

この関数は `"home"` という ID を検索します。

{{< code-toggle file="i18n/en-US" >}}
[home]
other = "Home"
{{< /code-toggle >}}

結果は以下のようになります。

```text
Home
```

### 変数を使用して柔軟な翻訳をクエリする {#query-a-flexible-translation-with-variables}

多くの場合、翻訳文字列でページ変数を使用したいと思うでしょう。 そのためには、`i18n` を呼び出すときに、以下のように `.` コンテキストを渡します。

```go-html-template
{{ i18n "wordCount" . }}
```

この関数は `.` コンテキストを `"wordCount"` id に渡します。

{{< code-toggle file="i18n/en-US" >}}
[wordCount]
other = "This article has {{ .WordCount }} words."
{{< /code-toggle >}}

コンテキストの `.WordCount` の値が 101 であると仮定します。結果は以下のようになります。

```text
This article has 101 words.
```

### 単数形/複数形の翻訳をクエリする {#query-a-singular-plural-translation}

その他、単数/複数の要件を満たすには、 `.Count` という数値プロパティを持つ辞書 (マップ) を `i18n` 関数に渡す必要があります。 以下の例では、組み込みの `.Count` プロパティを持つ `.ReadingTime` 変数を使用しています。

```go-html-template
{{ i18n "readingTime" .ReadingTime }}
```

この関数は `.ReadingTime` から `.Count` を読み込み、その数が単数 (`one`) か複数 (`other`) かを判断します。その後、`i18n/en-US.toml` ファイルにある `readingTime` の id を渡します。

{{< code-toggle file="i18n/en-US" >}}
[readingTime]
one = "One minute to read"
other = "{{ .Count }} minutes to read"
{{< /code-toggle >}}

コンテキストの `.ReadingTime.Count` の値が 525600 であると仮定すると、結果は以下のようになります。

```text
525600 minutes to read
```

コンテキストの `.ReadingTime.Count` の値が 1 の場合、結果は以下のようになります。

```text
One minute to read
```

カスタムデータを渡す必要がある場合: (`(dict "Count" numeric_value_only)` が最低限必要)

```go-html-template
{{ i18n "readingTime" (dict "Count" 25 "FirstArgument" true "SecondArgument" false "Etc" "so on, so far") }}
```

## ローカライズ {#localization}

以下のローカライズの例では、サイトの主要言語を英語とし、フランス語とドイツ語への翻訳を想定しています。

{{< code-toggle file="hugo" >}}
defaultContentLang = 'en'

[languages]
[languages.en]
contentDir = 'content/en'
languageName = 'English'
weight = 1
[languages.fr]
contentDir = 'content/fr'
languageName = 'Français'
weight = 2
[languages.de]
contentDir = 'content/de'
languageName = 'Deutsch'
weight = 3

{{< /code-toggle >}}

### 日付 {#dates}

以下のフロントマター

{{< code-toggle >}}
date = 2021-11-03T12:34:56+01:00
{{< /code-toggle >}}

および、以下のテンプレート コード

```go-html-template
{{ .Date | time.Format ":date_full" }}
```

で、以下のレンダリングされたページが表示されます。

Language|Value
:--|:--
English|Wednesday, November 3, 2021
Français|mercredi 3 novembre 2021
Deutsch|Mittwoch, 3. November 2021

詳細については、[time.Format] を参照してください。

### 通貨 {#currency}

以下のテンプレート コード

```go-html-template
{{ 512.5032 | lang.FormatCurrency 2 "USD" }}
```

で、以下のレンダリングされたページが表示されます。

Language|Value
:--|:--
English|$512.50
Français|512,50 $US
Deutsch|512,50 $

詳細については、[lang.FormatCurrency] と [lang.FormatAccounting] を参照してください。

### 数値 {#numbers}

以下のテンプレート コード

```go-html-template
{{ 512.5032 | lang.FormatNumber 2 }}
```

で、以下のレンダリングされたページが表示されます。

Language|Value
:--|:--
English|512.50
Français|512,50
Deutsch|512,50

詳細については、[lang.FormatNumber] と [lang.FormatNumberCustom] を参照してください。

### パーセント {#percentages}

以下のテンプレート コード

```go-html-template
{{ 512.5032 | lang.FormatPercent 2 }} ---> 512.50%
```

で、以下のレンダリングされたページが表示されます。

Language|Value
:--|:--
English|512.50%
Français|512,50 %
Deutsch|512,50 %

詳細については、[lang.FormatPercent] を参照してください。

## メニュー {#menus}

メニューエントリのローカライズは、以下のように、それをどのように定義するかによって決まります。

- セクションページ メニューを使用してメニューエントリを [自動的に][automatically] 定義する場合は、翻訳テーブルを使用して各エントリをローカライズする必要があります。
- メニューエントリを [フロントマターで][in front matter] 定義した場合、それらはすでにフロントマターそのものに基づいてローカライズされています。フロントマターの値が不十分な場合は、翻訳テーブルを使って各エントリをローカライズしてください。
- メニューエントリを [サイト設定で][in site configuration] 定義するとき、(a) 翻訳テーブルを使うか、(b) 各言語キーの下に言語固有のメニューエントリを作成できます。

### 翻訳テーブルを使用する {#use-translation-tables}

メニューの各エントリに表示されるテキストをレンダリングするとき、[メニュー テンプレートの例][example menu template] は以下のことを行います。

```go-html-template
{{ or (T .Identifier) .Name | safeHTML }}
```

メニューエントリの `identifier` を使って現在の言語の翻訳テーブルに問い合わせ、翻訳された文字列を返します。
翻訳テーブルが存在しない場合、または `identifier` キーが翻訳テーブルに存在しない場合、`name` にフォールバックします。

`identifier` は、メニューエントリをどのように定義するかによって、以下のように異なります。

- セクションページ メニューを使用してメニューエントリを [自動的に][automatically] 定義する場合、 `identifier` はページの `.Section` になります。
- [サイト設定で][in site configuration] または [フロントマターで][in front matter] メニューエントリを定義する場合は、`identifier` プロパティを目的の値に設定します。

たとえば、サイト設定でメニューエントリを定義すると、以下のようになります。

{{< code-toggle file="hugo" copy=false >}}
[[menu.main]]
  identifier = 'products'
  name = 'Products'
  pageRef = '/products'
  weight = 10
[[menu.main]]
  identifier = 'services'
  name = 'Services'
  pageRef = '/services'
  weight = 20
{{< / code-toggle >}}

以下のように、翻訳テーブルに対応するエントリを作成します。

{{< code-toggle file="i18n/de" copy=false >}}
products = 'Produkte'
services = 'Leistungen'
{{< / code-toggle >}}

[example menu template]: /templates/menu-templates/#example
[automatically]: /content-management/menus/#define-automatically
[in front matter]: /content-management/menus/#define-in-front-matter
[in site configuration]: /content-management/menus/#define-in-site-configuration

### 言語固有のメニューエントリを作成する {#create-languagespecific-menu-entries}

たとえば、以下のようにします。

{{< code-toggle file="hugo" copy=false >}}
[languages.de]
languageCode = 'de-DE'
languageName = 'Deutsch'
weight = 1

[[languages.de.menu.main]]
name = 'Produkte'
pageRef = '/products'
weight = 10

[[languages.de.menu.main]]
name = 'Leistungen'
pageRef = '/services'
weight = 20

[languages.en]
languageCode = 'en-US'
languageName = 'English'
weight = 2

[[languages.en.menu.main]]
name = 'Products'
pageRef = '/products'
weight = 10

[[languages.en.menu.main]]
name = 'Services'
pageRef = '/services'
weight = 20
{{< /code-toggle >}}

2 つの言語を使用したシンプルなメニューの場合、これらのメニューエントリの作成と管理は簡単です。 
より大きなメニューの場合、または 3 つ以上の言語を使用する場合は、上記のような翻訳テーブルを使用することをお勧めします。

## 不足している翻訳 {#missing-translations}

文字列に現在の言語の翻訳がない場合、Hugo はデフォルト言語の値を使用します。 デフォルト値が設定されていない場合、空文字列が表示されます。

Hugo の Web サイトを翻訳しているとき、翻訳の欠落箇所を視覚的に確認できると便利です。設定オプションの [`enableMissingTranslationPlaceholders`][config] は、すべての未翻訳の文字列に `[i18n] identifier` というプレースホルダーを付けてフラグを立てます (ここで `identifier` は未翻訳部分の ID です。

{{< note >}}
Hugo は、これらの不足している翻訳プレースホルダーを含む Web サイトを生成します。本番環境には適さないかもしれません。
{{< /note >}}

他の言語からのコンテンツのマージ (つまり、コンテンツの翻訳がない場合) については、[lang.Merge] を参照してください。

不足している翻訳文字列を追跡するには、以下のように、Hugo を `--printI18nWarnings` フラグ付きで実行してください。

```bash
hugo --printI18nWarnings | grep i18n
i18n|MISSING_TRANSLATION|en|wordCount
```

## 多言語テーマへの対応 {#multilingual-themes-support}

テーマで多言語モードをサポートするためには、テンプレート内の URL について、いくつかの配慮が必要です。複数の言語が存在する場合、URL は以下の条件を満たす必要があります。

* 組み込みの `.Permalink` または `.RelPermalink` から来ること
* [`relLangURL` テンプレート関数][rellangurl] または [`absLangURL` テンプレート関数][abslangurl] で構築されること **または** `{{ .LanguagePrefix }}` をプレフィックスとして持つこと

複数の言語が定義されている場合、`LanguagePrefix` 変数は `/en` (または、どのような値でも `CurrentLanguage`) と等しくなります。 有効にしない場合、空文字列になります (したがって、単一言語の Hugo Web サイトには無害です)。


## `hugo new` で多言語コンテンツを生成する {#generate-multilingual-content-with-hugo-new}

翻訳を含むコンテンツを同じディレクトリに整理する場合は、以下のコマンドを実行します。

```text
hugo new post/test.en.md
hugo new post/test.de.md
```

翻訳を含むコンテンツを異なるディレクトリに整理する場合は、以下のコマンドを実行します。

```text
hugo new content/en/post/test.md
hugo new content/de/post/test.md
```

[abslangurl]: /function/abslangurl
[config]: /getting-started/configuration/
[contenttemplate]: /templates/single-page-templates/
[go-i18n-source]: https://github.com/nicksnyder/go-i18n
[go-i18n]: https://github.com/nicksnyder/go-i18n
[homepage]: /templates/homepage/
[Hugo Multilingual Part 1: Content translation]: https://regisphilibert.com/blog/2018/08/hugo-multilingual-part-1-managing-content-translation/
[i18func]: /function/i18n/
[lang.FormatAccounting]: /function/lang
[lang.FormatCurrency]: /function/lang
[lang.FormatNumber]: /function/lang
[lang.FormatNumberCustom]: /function/lang
[lang.FormatPercent]: /function/lang
[lang.Merge]: /function/lang.merge/
[menus]: /content-management/menus/
[OS environment]: /getting-started/configuration/#configure-with-environment-variables
[rellangurl]: /function/rellangurl
[RFC 5646]: https://tools.ietf.org/html/rfc5646
[single page templates]: /templates/single-page-templates/
[time.Format]: /function/dateformat
