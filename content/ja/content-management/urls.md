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

## パーマリンク {#permalinks}

構築した Web サイトのデフォルトの Hugo ターゲットディレクトリは `public/` です。ただし、[サイト設定][config] で別の `publishDir` を指定することで、この値を変更できます。セクションのビルド時に作成されるディレクトリは、`content` フォルダー内のコンテンツのディレクトリの位置と、`contentdir` 階層内のレイアウトに合わせた名前空間が反映されます。

[サイト構成][config] の `permalinks` オプションを使用すると、ディレクトリパス (つまり URL) をセクションごとに調整することができます。これはファイルが書き込まれる場所を変更し、ページ内部の「正規の」場所を変更します。このため、`.RelPermalink` へのテンプレート参照は、このオプションのマッピングの結果として行われた調整を尊重することになります。

{{% note "Default Publish and Content Folders" %}}
これらの例では、 `publishDir` と `contentDir` にデフォルト値、つまりそれぞれ `public` と `content` を使用しています。デフォルト値は、[サイトの `config` ファイル](/getting-started/configuration/) でオーバーライドすることができます。
{{% /note %}}

たとえば、[セクション][section] の1つが `posts` という名前で、年、月、投稿タイトルに基づいて階層化するように正規のパスを調整したい場合、YAML と TOML でそれぞれ以下のように設定することが可能です。

### パーマリンクの設定例 {#permalinks-configuration-example}

{{< code-toggle file="config" copy="false" >}}
permalinks:
  posts: /:year/:month/:title/
{{< /code-toggle >}}

`posts/` 以下のコンテンツのみが新しい URL 構造を持つことになります。たとえば、`content/posts/sample-entry.md` のフロントマターに `date: 2017-02-27T19:20:00-05:00` があると、ビルド時に `public/2017/02/sample-entry/index.html` にレンダーされるので、 `https://example.com/2017/02/sample-entry/` で到達できるようになります。

「ルート」セクションのページに対して `permalinks` オプションを設定するには、以下のように、キーとして **/** を使用します。

{{< code-toggle file="config" copy="false" >}}
permalinks:
  /: /:year/:month/:filename/
{{< /code-toggle >}}

標準の日付ベースのパーマリンク構成がニーズを満たさない場合、[Go time フォーマット ディレクティブ](https://golang.org/pkg/time/#Time.Format) を使用して URL セグメントをフォーマットすることも可能です。たとえば、ゼロパディングなしで 2 桁の年と月日の桁を持つ URL 構造は、以下のようにして実現できます。

{{< code-toggle file="config" copy="false" >}}
permalinks:
  posts: /:06/:1/:2/:title/
{{< /code-toggle >}}

また、セクションの代わりにタクソノミーの複数形を使用することで、同じ構文でタクソノミーのパーマリンクを設定することもできます。おそらく、設定値 `:slug` と `:title` のみを使用したいことでしょう。

### パーマリンクの設定値 {#permalink-configuration-values}

以下は、サイトの `config` ファイルにある `permalink` の定義で使用できる値のリストです。時間に関するすべての参照は、コンテンツの日付に依存します。

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

さらに、`:` を先頭に持つ Go 時間形式文字列を使用することもできる。

## エイリアス {#aliases}

エイリアスを使用して、他の URL からページへのリダイレクトを作成できます。

エイリアスには以下の 2 つの形式があります。

1. たとえば、 `/posts/my-blogpost/` のように、`BaseURL` からの相対パスを意味する `/` で始まる文字列
2. たとえば、 `my-blogpost` や `../blog/my-blogpost` (Hugo 0.55 の新機能) のように、定義されている `Page` からの相対パスとなります。

### エイリアスの例 {#example-aliases}

たとえば、`content/posts/my-awesome-blog-post.md` に新しいコンテンツを作成すると仮定します。このコンテンツは `content/posts/my-original-url.md` にある前回の投稿の改訂版です。 新しい `my-awesome-blog-post.md` のフロントマターに `aliases` フィールドを作成し、そこに以前のパスを追加できます。以下の例では、このフィールドを TOML と YAML のフロントマターでそれぞれ作成する方法を示しています。

#### TOML フロントマター

{{< code file="content/posts/my-awesome-post.md" copy="false" >}}
+++
aliases = [
    "/posts/my-original-url/",
    "/2010/01/01/even-earlier-url.html"
]
+++
{{< /code >}}

#### YAML フロントマター

{{< code file="content/posts/my-awesome-post.md" copy="false" >}}
---
aliases:
    - /posts/my-original-url/
    - /2010/01/01/even-earlier-url.html
---
{{< /code >}}

これで、エイリアスで指定された場所にアクセスすると --- つまり、 _同じサイトドメインであると仮定して_ ---、指定されたページにリダイレクトされるようになります。たとえば、`example.com/posts/my-original-url/` にアクセスした人は、すぐに `example.com/posts/my-awesome-post/` にリダイレクトされます。

### 例: 多言語版でのエイリアス {#example-aliases-in-multilingual}

[多言語サイト][multilingual] では、投稿の各翻訳に固有のエイリアスを設定できます。複数の言語で同じエイリアスを使用するには、言語コードをプレフィックスとして付けます。

`/posts/my-new-post.es.md` の場合は、以下のように指定します。

```md
---
aliases:
    - /es/posts/my-original-post/
---
```

Hugo 0.55 からは、ページ相対のエイリアスも使用できるようになり、 `/es/posts/my-original-post/` は、より移植性の高い `my-original-post/` に簡略化できます。

### Hugo エイリアスの仕組み {#how-hugo-aliases-work}

エイリアスが指定されると、Hugo はエイリアスのエントリにマッチするディレクトリを作成します。そのディレクトリの中に、Hugo はページの正規の URL と新しいリダイレクト先を指定した `.html` ファイルを作成します。

たとえば、`posts/my-intended-url.md` のコンテンツファイルに、以下のようなフロントマターがあるとします。

```yml
---
title: My New post
aliases: [/posts/my-old-url/]
---
```

`baseURL` が `example.com` であると仮定すると、`https://example.com/posts/my-old-url/` にある自動生成されたエイリアス `.html` の内容は、以下のようになります。

```html
<!DOCTYPE html>
<html>
  <head>
    <title>https://example.com/posts/my-intended-url</title>
    <link rel="canonical" href="https://example.com/posts/my-intended-url"/>
    <meta name="robots" content="noindex">
    <meta http-equiv="content-type" content="text/html; charset=utf-8"/>
    <meta http-equiv="refresh" content="0; url=https://example.com/posts/my-intended-url"/>
  </head>
</html>
```

`http-equiv="refresh"` 行はリダイレクトを実行するもので、この場合は 0 秒で実行されます。Web サイトのエンドユーザーが `https://example.com/posts/my-old-url` にアクセスした場合、自動的に新しい正しい URL にリダイレクトされます。 `<meta name="robots" content="noindex">` の追加により、検索エンジンのボットに、エイリアスページ (`https://example.com/posts/my-old-url/`) をインデックスしてはいけないことを知らせることができます。

### カスタマイズ {#customize}

このエイリアスページをカスタマイズするには、サイトの layouts フォルダーに `alias.html` テンプレートを作成します (たとえば、`layouts/alias.html`)。この場合、テンプレートに渡されるデータは、以下です。

`Permalink`
: エイリアスが設定されているページへのリンク

`Page`
: エイリアスが設定されているページのページデータ

### エイリアスの重要な動作 {#important-behaviors-of-aliases}

1. Hugo はエイリアスについて何の仮定もしません。また、UglyURLs の設定に基づいて変更されることもありません。 Web ルートへの絶対パスと完全なファイル名またはディレクトリを指定する必要があります。
2. エイリアスは、コンテンツがレンダリングされる *前に* レンダリングされるため、同じ場所のコンテンツによって上書きされます。

## プリティー URL {#pretty-urls}

Hugo のデフォルトの動作は、コンテンツを「プリティー URL」でレンダリングすることです。これらの「プリティー URL」を動作させるために、非標準のサーバ側の設定は必要ありません。

以下は、その概念を示すものです。

```txt
content/posts/_index.md
=> example.com/posts/
content/posts/post-1.md
=> example.com/posts/post-1/
```

## アグリー URL {#ugly-urls}

「アグリー URL」と呼ばれることが多いもの (たとえば、example.com/urls.html) を使用したい場合は、サイトの `config.toml` または `config.yaml` にそれぞれ `uglyurls = true` または `uglyurls: true` を設定してください。また、`hugo` または `hugo server` を実行する際に、環境変数 `HUGO_UGLYURLS` を `true` に設定することもできます。

特定のコンテンツに正確な URL を持たせたい場合は、`url` キーの下の [フロントマター][front matter] で指定します。以下は、同じコンテンツ ディレクトリで、Hugo がデフォルトの動作で実行されたときに、最終的にどのような URL 構造になるかの例です。

パスの詳細については、[「コンテンツ構成」][contentorg] を参照してください。

```txt
.
└── content
    └── about
    |   └── _index.md  // <- https://example.com/about/
    ├── posts
    |   ├── firstpost.md   // <- https://example.com/posts/firstpost/
    |   ├── happy
    |   |   └── ness.md  // <- https://example.com/posts/happy/ness/
    |   └── secondpost.md  // <- https://example.com/posts/secondpost/
    └── quote
        ├── first.md       // <- https://example.com/quote/first/
        └── second.md      // <- https://example.com/quote/second/
```

以下は、同じ構成を `hugo --uglyURLs` で実行したものです。

```txt
.
└── content
    └── about
    |   └── _index.md  // <- https://example.com/about.html
    ├── posts
    |   ├── firstpost.md   // <- https://example.com/posts/firstpost.html
    |   ├── happy
    |   |   └── ness.md    // <- https://example.com/posts/happy/ness.html
    |   └── secondpost.md  // <- https://example.com/posts/secondpost.html
    └── quote
        ├── first.md       // <- https://example.com/quote/first.html
        └── second.md      // <- https://example.com/quote/second.html
```

## 正規化 {#canonicalization}

デフォルトでは、入力で見つかったすべての相対 URL は変更されず、たとえば `/css/foo.css` は `/css/foo.css` として残ります。サイトの `config` にある `canonifyURLs` フィールドは、デフォルトで `false` になっています。

`canonifyURLs` を `true` に設定すると、すべての相対 URL は `baseURL` を使用して *正規化* されます。 たとえば、`baseURL = https://example.com/` と仮定すると、相対 URL である `/css/foo.css` は絶対 URL である `https://example.com/css/foo.css` に変換されます。

正規化の利点は、すべての URL を絶対 URL に固定することが含まれます。これは、一部のパース作業に役立つ場合があります。しかし、最近のブラウザはすべて、クライアント側で問題なくこれを処理することに注意してください。

非正規化の利点としては、スキームに関係なくリソースを含めることができます。 たとえば、`http` と `https` は、ページをどのように取得したかに応じて決定できます。

{{% note "`canonifyURLs` default change" %}}
2014年5月にリリースされた Hugo v0.11 では、`canonifyURLs` のデフォルト値が `true` から `false` に変更されましたが、これはより良いデフォルトであり、今後もそうあるべきと考えています。 v0.10 またはそれ以前のバージョンからアップグレードする場合は、適宜確認・調整してください。
{{% /note %}}

Web サイトの `canonifyURLs` の現在の値を知るには、v0.13 で追加された便利な `hugo config` コマンドを使用できます。

```txt
hugo config | grep -i canon
```

または、Windows で、`grep` がインストールされていない場合は、以下のコマンドを実行します。

```txt
hugo config | FINDSTR /I canon
```

## フロントマターに URL を設定する {#set-url-in-front-matter}

さまざまなコンテンツセクションのサイト設定でパーマリンク値を指定することに加えて、Hugo では、個々のコンテンツをさらに細かく制御できます。

`slug` と `url` の両方は、個々のフロントマターで定義できます。ビルド時のコンテンツの行き先についての詳細は、[「コンテンツ構成」][contentorg] を参照してください。

Hugo 0.55 からは、現在のサイトのコンテキスト (言語) に対する相対的な URL を使用できるようになり、メンテナンスがより簡単になりました。日本語の翻訳の場合、以下の例の両方が同じ URL になります。

```markdown
---
title: "Custom URL!"
url: "/jp/custom/foo"
---
```

```markdown
---
title: "Custom URL!"
url: "custom/foo"
---
```

## 相対 URL {#relative-urls}

Hugo のデフォルトでは、相対 URL はすべて変更されないため、ローカル ファイルシステムからサイトを閲覧できるようにしたい場合に問題となることがあります。

[サイト設定][config] で `relativeURLs` を `true` に設定すると、Hugo はすべての相対 URL を現在のコンテンツからの相対 URL に書き換えます。

たとえば、`/posts/first/` ページに `/about/` へのリンクがある場合、Hugo は URL を `../../about/` に書き換えます。

[config]: /getting-started/configuration/
[contentorg]: /content-management/organization/
[front matter]: /content-management/front-matter/
[multilingual]: /content-management/multilingual/
[sections]: /content-management/sections/
[usage]: /getting-started/usage/
