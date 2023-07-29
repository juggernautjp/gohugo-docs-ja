---
aliases:
- /extras/permalinks/
- /extras/aliases/
- /extras/urls/
- /doc/redirects/
- /doc/alias/
- /doc/aliases/
categories:
- content management
date: "2017-02-01"
description: Hugo はパーマリンク、エイリアス、リンクの正規化、相対 URL と絶対 URL 処理するための複数のオプションをサポートしています。
draft: false
keywords:
- aliases
- redirects
- permalinks
- urls
linktitle: URL 管理
menu:
  docs:
    parent: content-management
    weight: 180
publishdate: "2017-02-01"
title: URL 管理
toc: true
weight: 180
---

## 概要 {#overview}

デフォルトでは、Hugo がページをレンダリングするとき、結果の URL は `content` ディレクトリ内のファイルパスと一致します。たとえば、

```text
content/posts/post-1.md → https://example.org/posts/post-1/
```

フロントマターの値やサイト構成オプションで、URL の構造や外観を変更することができます。

## Front matter

### `slug`

パスの最後のセグメントをオーバーライドするには、フロントマターの `slug` を設定します。
`slug` の値は、セクションページには影響しません。

{{< code-toggle file="content/posts/post-1.md" copy=false fm=true >}}
title = 'My First Post'
slug = 'my-first-post'
{{< /code-toggle >}}

結果の URL は、以下のようになります。

```text
https://example.org/posts/my-first-post/
```

### `url`

パス全体をオーバーライドするには、フロントマターの `url` を設定します。 
通常ページまたはセクション ページでこれを使用します。

以下のフロントマターでは、

{{< code-toggle file="content/posts/post-1.md" copy=false fm=true codeId="f2" >}}
title = 'My First Article'
url = '/articles/my-first-article'
{{< /code-toggle >}}

結果の URL は以下のようになります。

```text
https://example.org/articles/my-first-article/
```

ファイル拡張子を含める場合は、以下のようにします。

{{< code-toggle file="content/posts/post-1.md" copy=false fm=true codeId="f3" >}}
title = 'My First Article'
url = '/articles/my-first-article.html'
{{< /code-toggle >}}

結果の URL は以下のようになります。

```text
https://example.org/articles/my-first-article.html
```

単一言語サイトでは、先頭のスラッシュの有無にかかわらず、 `url` 値は `baseURL` からの相対パスとなります。

多言語サイトの場合は、以下のようになります。

- スラッシュを先頭に持つ `url` 値は、 `baseURL` からの相対パスです。
- 先頭のスラッシュがない `url` 値は、 `baseURL` に言語プレフィックスを加えたものからの相対パスとなります。

サイトのタイプ | フロントマターの `url` | 結果の URL
:--|:--|:--
単一言語 | `/about` | `https://example.org/about/`
単一言語 | `about` | `https://example.org/about/`
多言語   | `/about` | `https://example.org/about/`
多言語   | `about` | `https://example.org/de/about/`

フロントマターに `slug` と `url` の両方を設定した場合、`url` の値が優先されます。

## サイト構成 {#site-configuration}

### パーマリンク {#permalinks}

サイト構成で、各トップレベル セクションの URL パターンを定義します。 
各 URL パターンは、指定された言語および/または [ページの種類][page kind] をターゲットにすることができます。

フロントマターの `url` 値は、サイト設定の `permalinks` セクションで定義された URL パターンをオーバーライド (上書き) します。

[page kind]: /templates/section-templates/#page-kinds

#### 単一言語の例 {#permalinks-monolingual-examples}

以下のコンテンツ構造を考えます。

```text
content/
├── posts/
│   ├── bash-in-slow-motion.md
│   └── tls-in-a-nutshell.md
├── tutorials/
│   ├── git-for-beginners.md
│   └── javascript-bundling-with-hugo.md
└── _index.md
```

チュートリアル (tutorial) を「トレーニング (training)」の下に表示し、投稿 (post) を日付ベースの階層を使用して「記事 (articles)」の下に表示します。

{{< code-toggle file="hugo" copy=false >}}
[permalinks.page]
posts = '/articles/:year/:month/:slug/'
tutorials = '/training/:slug/'
[permalinks.section]
posts = '/articles/'
tutorials = '/training/'
{{< /code-toggle >}}

公開されるサイトの構造は、以下のようになります。

```text
public/
├── articles/
│   ├── 2023/
│   │   ├── 04/
│   │   │   └── bash-in-slow-motion/
│   │   │       └── index.html
│   │   └── 06/
│   │       └── tls-in-a-nutshell/
│   │           └── index.html
│   └── index.html
├── training/
│   ├── git-for-beginners/
│   │   └── index.html
│   ├── javascript-bundling-with-hugo/
│   │   └── index.html
│   └── index.html
└── index.html
```

コンテンツルート内の通常ページに日付ベースの階層を作成するには、以下のようにします。

{{< code-toggle file="hugo" copy=false codeId="h2" >}}
[permalinks.page]
"/" = "/:year/:month/:slug/"
{{< /code-toggle >}}

タクソノミー用語についても同じ方法を使います。
たとえば、URL のタクソノミー セグメントを省略する場合は、以下のようにします。

{{< code-toggle file="hugo" copy=false codeId="h3" >}}
[permalinks.term]
'tags' = '/:slug/'
{{< /code-toggle >}}

#### 多言語の例 {#permalinks-multilingual-example}

ローカライズ戦略のコンポーネントとして `permalinks` 設定を使用します。

以下のコンテンツ構造を考えます。

```text
content/
├── de/
│   ├── books/
│   │   ├── les-miserables.md
│   │   └── the-hunchback-of-notre-dame.md
│   └── _index.md
└── en/
    ├── books/
    │   ├── les-miserables.md
    │   └── the-hunchback-of-notre-dame.md
    └── _index.md
```

そして、以下のサイト構成を用いると、

{{< code-toggle file="hugo" copy=false codeId="h4" >}}
defaultContentLanguage = 'en'
defaultContentLanguageInSubdir = true

[languages.en]
contentDir = 'content/en'
languageCode = 'en-US'
languageDirection = 'ltr'
languageName = 'English'
weight = 1

[languages.en.permalinks.page]
books = "/books/:slug/"

[languages.en.permalinks.section]
books = "/books/"

[languages.es]
contentDir = 'content/de'
languageCode = 'es-ES'
languageDirection = 'ltr'
languageName = 'Español'
weight = 2

[languages.es.permalinks.page]
books = "/libros/:slug/"

[languages.es.permalinks.section]
books = "/libros/"
{{< /code-toggle >}}

公開されるサイトの構造は、以下のようになります。

```text
public/
├── en/
│   ├── books/
│   │   ├── les-miserables/
│   │   │   └── index.html
│   │   ├── the-hunchback-of-notre-dame/
│   │   │   └── index.html
│   │   └── index.html
│   └── index.html
├── es/
│   ├── libros/
│   │   ├── les-miserables/
│   │   │   └── index.html
│   │   ├── the-hunchback-of-notre-dame/
│   │   │   └── index.html
│   │   └── index.html
│   └── index.html
└── index.html
```

#### トークン {#tokens}

URL パターンを定義する際には、以下のトークンを使用します。
フロントマターの `date` フィールドは、時間に関連するトークンの値を決定します。

`:year`
: 4 桁の年

`:month`
: 2 桁の月

`:monthname`
: 月の名前

`:day`
: 2 桁の日

`:weekday`
: 1桁の曜日 (日曜日は 0)

`:weekdayname`
: 曜日の名前

`:yearday`
: 1 から 3 桁の日

`:section`
: コンテンツのセクション

`:sections`
: コンテンツのセクションの階層を指定します。 {{< new-in "0.83.0" >}} Hugo 0.83 以降では、_スライス構文_ を使用してセクションの選択を行うことができます。`:sections[1:]` は最初のセクション以外を、`:sections[:last]` は最後以外を、`:section[last]` は最後だけを、`:section[1:2]` は第 2、3 セクションを含むことが可能です。このスライスアクセスは out-of-bounds エラーをスローしないので、厳密である必要はないことに注意してください。

`:title`
: コンテンツのタイトル

`:slug`
: コンテンツのスラッグ (フロントマターでスラッグが提供されていない場合はタイトル)

`:slugorfilename`
: コンテンツのスラッグ (または、フロント マターにスラッグが提供されていない場合はファイル名)

`:filename`
: コンテンツのファイル名 (拡張子なし)

時間関連の値には、Go の [time パッケージ][time package] で定義されているレイアウト文字列コンポーネントを使用することもできます。たとえば、以下のコードです。

[time package]: https://pkg.go.dev/time#pkg-constants

{{< code-toggle file="hugo" copy=false codeId="h5" >}}
permalinks:
  posts: /:06/:1/:2/:title/
{{< /code-toggle >}}

### アピアランス {#appearance}

URL のアピアランスは、アグリーかプリティーのどちらかです。

タイプ|パス|URL
:--|:--|:--
アグリー|content/about.md|`https://example.org/about.html`
プリティー|content/about.md|`https://example.org/about/`

デフォルトでは、Hugo はプリティー URL を生成します。
アグリー URL を生成するには、サイトの設定を変更してください。

{{< code-toggle file="hugo" copy=false codeId="h6" >}}
uglyURLs = true
{{< /code-toggle >}}

### 後処理 {#post-processing}

Hugo は、ページのレンダリング後に URL を変更するための、互いに排他的な 2 つの設定オプションを提供しています。

#### 正規 URL {#canonical-urls}

{{% note %}}
これはレガシーな設定オプションで、テンプレート関数やマークダウンレンダーフックに取って代わられ、おそらく [将来のリリースで削除される][removed in a future release] でしょう。

[removed in a future release]: https://github.com/gohugoio/hugo/issues/4733
{{% /note %}}

有効にすると、Hugo はページのレンダリング後に検索と置換を実行します。 
これは `action`、`href`、`src`、`srcset`、`url` 属性に関連するサイト相対 URL (先頭にスラッシュがあるもの) を検索します。
次に、 `baseURL` を先頭につけて絶対 URL を作成します。

```text
<a href="/about"> → <a href="https://example.org/about/">
<img src="/a.gif"> → <img src="https://example.org/a.gif">
```

これは不完全で強引なアプローチであり、コンテンツだけでなく HTML 属性にも影響を与える可能性があります。
上で述べたように、これはレガシーな設定オプションであり、将来のリリースでは削除される可能性があります。

有効にするには、以下のようにします。

{{< code-toggle file="hugo" copy=false codeId="h7" >}}
canonifyURLs = true
{{< /code-toggle >}}

#### 相対 URL {$relative-urls}

{{% note %}}
ファイルシステム経由でナビゲート可能なサーバーレス サイトを作成する場合を除き、このオプションを有効にしないでください。
{{% /note %}}

有効にすると、Hugo はページのレンダリング後に検索と置換を実行します。
これは `action`、`href`、`src`、`srcset`、`url` 属性に関連するサイト相対 URL (先頭にスラッシュがあるもの) を検索します。
次に、現在のページからの相対 URL に変換します。

たとえば、`content/posts/post-1` をレンダリングするとき、

```text
<a href="/about"> → <a href="../../about">
<img src="/a.gif"> → <img src="../../a.gif">
```

これは不完全で強引なアプローチであり、コンテンツだけでなく HTML 属性にも影響を与える可能性があります。
上で述べたように、サーバーレス サイトを作成する場合を除き、このオプションを有効にしないでください。

有効にするには、以下のようにします。

{{< code-toggle file="hugo" copy=false codeId="h8" >}}
relativeURLs = true
{{< /code-toggle >}}

## エイリアス {#aliases}

以下のようにエイリアスを使用して、古い URL から新しい URL へのリダイレクトを作成します。

- スラッシュを先頭に持つエイリアスは、 `baseURL` からの相対パスです。
- スラッシュのないエイリアスは、カレント ディレクトリからの相対パスです。

### エイリアスの例 {#example-aliases}

既存のページのファイル名を変更し、以前の URL から新しい URL へのエイリアスを作成します。

{{< code-toggle file="content/posts/new-file-name.md" copy=false >}}
aliases = ['/posts/previous-file-name']
{{< /code-toggle >}}

これらのディレクトリ相対エイリアスのそれぞれは、上記のサイト相対エイリアスと等価です。

- `previous-file-name`
- `./previous-file-name`
- `../posts/previous-file-name`

現在のページに複数のエイリアスを作成できます。

{{< code-toggle file="content/posts/new-file-name.md" copy=false codeId="n2" >}}
aliases = ['previous-file-name','original-file-name']
{{< /code-toggle >}}

多言語サイトでは、ディレクトリ相対エイリアスを使用するか、以下のようにサイト相対エイリアスに言語プレフィックスを含めます。

{{< code-toggle file="content/posts/new-file-name.de.md" copy=false codeId="n3" >}}
aliases = ['/de/posts/previous-file-name']
{{< /code-toggle >}}

### エイリアスの仕組み {#how-aliases-work}

上記の最初の例を使用して、Hugo は以下のサイト構造を生成します。

```text
public/
├── posts/
│   ├── new-file-name/
│   │   └── index.html
│   ├── previous-file-name/
│   │   └── index.html
│   └── index.html
└── index.html
```

以前の URL から新しい URL へのエイリアスは、以下のようなクライアント側のリダイレクトです。

{{< code file="posts/previous-file-name/index.html" copy=false >}}
<!DOCTYPE html>
<html lang="en-us">
  <head>
    <title>https://example.org/posts/new-file-name/</title>
    <link rel="canonical" href="https://example.org/posts/new-file-name/">
    <meta name="robots" content="noindex">
    <meta charset="utf-8">
    <meta http-equiv="refresh" content="0; url=https://example.org/posts/new-file-name/">
  </head>
</html>
{{< /code >}}

`head` セクションの要素は、以下のとおりです。

- 新しい URL が正規であることを検索エンジンに伝えます
- 以前の URL をインデックスに登録しないよう検索エンジンに指示します
- ブラウザに新しい URL にリダイレクトするように指示します

Hugo はページをレンダリングする前にエイリアス ファイルをレンダリングします。
予想どおり、以前のファイル名を持つ新しいページによってエイリアスが上書きされます。

### カスタマイズする {#customize}

エイリアスファイルの内容をカスタマイズするために、新しいテンプレート (`layouts/alias.html`) を作成します。
テンプレートは、以下のコンテキストを受け取ります。

`Permalink`
: エイリアスが設定されているページへのリンク

`Page`
: エイリアスが設定されているページのページデータ
