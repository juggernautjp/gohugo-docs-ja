---
aliases:
- /content/front-matter/
categories:
- content management
date: "2017-01-09"
description: Hugo では、コンテンツファイルに yaml、toml、json で記述されたフロントマターを追加できます。
draft: false
keywords:
- front matter
- yaml
- toml
- json
- metadata
- archetypes
lastmod: "2017-02-24"
linktitle: null
menu:
  docs:
    parent: content-management
    weight: 60
publishdate: "2017-01-09"
title: フロントマター
toc: true
weight: 60
---

**フロントマター** は、[コンテンツタイプ][content type] のインスタンスに付けられたメタデータを保持できます --- つまり、コンテンツファイルの中に埋め込むことができます --- そして、Hugo の強みを示す多くの機能のうちの 1 つです。

{{< youtube Yh2xKRJGff4 >}}

## フロントマターのフォーマット {#front-matter-formats}

Hugo は、フロントマターの 4 つのフォーマットをサポートしており、それぞれに識別用のトークンが用意されています。

TOML
: 開始と終了に `+++` を使うことで識別されます

YAML
: 開始と終了に  `---` を使うことで識別されます

JSON
: '`{`' と '`}`' で囲まれ、その後に改行が続く単一の JSON オブジェクト

ORG
: '`#+KEY: VALUE`' 形式の Org モード キーワードのグループです。 `#+` で始まらない行はフロントマターのセクションを終了します。
  キーワードの値は、文字列 (`#+KEY: VALUE`) または空白で区切られた文字列のリスト (`#+KEY[]: VALUE_1 VALUE_2`) のいずれかです。

### 例 {#example}

{{< code-toggle >}}
title = "spf13-vim 3.0 release and new website"
description = "spf13-vim is a cross platform distribution of vim plugins and resources for Vim."
tags = [ ".vimrc", "plugins", "spf13-vim", "vim" ]
date = "2012-04-06"
categories = [
  "Development",
  "VIM"
]
slug = "spf13-vim-3-0-release-and-new-website"
{{< /code-toggle >}}

## フロントマターの変数 {#front-matter-variables}

### 事前定義済み {#predefined}

Hugo が認識している定義済み変数がいくつかあります。これらの定義済み変数の多くをテンプレートで呼び出す方法については、[「ページ変数」][pagevars] を参照してください。

aliases
: 出力ディレクトリ構造に作成される 1 つ以上のエイリアス (たとえば、名前が変更されたコンテンツの古い公開パスなど) の配列です。 詳細については、[「エイリアス」][aliases] を参照してください。

audio
: ページに関連するオーディオ ファイルへのパスの配列です。 `opengraph` [内部テンプレート](/templates/internal) が `og:audio` に入力するために使用します。

cascade
: 自分自身またはより近い祖先のカスケードによって上書きされない限り、値がページの子孫に渡されるフロントマターのキーのマップです。 詳細については、[「フロントマターのカスケード」](#front-matter-cascade) を参照してください。

date
: このページに割り当てられた日付です。これは通常、フロントマターの `date` フィールドから取得されますが、この動作は設定可能です。

description
: コンテンツの説明文を指定します。

draft
: `true` の場合、`--buildDrafts` フラグが `hugo` コマンドに渡されない限り、コンテンツはレンダリングされません。

expiryDate
: Hugo がこの日を過ぎると、コンテンツを公開しない日時です。つまり、 `hugo` コマンドに `--buildExpired` フラグが渡されない限り、期限切れのコンテンツはレンダリングされません。

headless
: `true` の場合、リーフバンドルは [ヘッドレス][headless-bundle] に設定されます。

images
: ページに関連する画像へのパスの配列です。 `_internal/twitter_cards.html` などの [内部テンプレート](/templates/internal) で使用されます。

isCJKLanguage
: `true` の場合、Hugo は明示的にコンテンツを日中韓 (CJK) の言語として扱います。 `.Summary` と `.WordCount` の両方が日中韓の言語で正しく機能します。

keywords
: コンテンツのメタキーワードを指定します。

layout
: コンテンツをレンダリングする際に Hugo が [検索順序][lookup] から選択すべきレイアウトを指定します。フロントマターで `type` が指定されていない場合、Hugo はコンテンツのセクションに対応するレイアウト ディレクトリで同名のレイアウトを探します。詳細は、[「コンテンツタイプ」][content type] を参照してください。

lastmod
: コンテンツが最後に更新された日時です。

linkTitle
: コンテンツへのリンクを作成するために使用されます。 設定されている場合、Hugo はデフォルトで `title` の前に `linktitle` を使用します。 Hugo は [コンテンツのリストを `linktitle` で並べ替える][bylinktitle] もできます。

markup
: **実験的な機能** reStructuredText には `"rst"` を (`rst2html` が必要)、 Markdown には `"md"` (デフォルト) を指定します。

outputs
: コンテンツに固有の出力形式を指定できます。 詳細は、[「出力形式」][outputs] を参照してください。

publishDate
: 将来的に、 `--buildFuture` フラグが `hugo` に渡されない限り、コンテンツはレンダリングされません。

resources
: ページバンドルのリソースを設定するために使用されます。 詳細は、[「ページリソース」][page-resources] を参照してください。

series
: このページが属するシリーズの配列です。`series` [タクソノミー](/content-management/taxonomies/) のサブセットで、 `opengraph` [内部テンプレート](/templates/internal) が `og:see_also` に入力するために使用されます。

slug
: 出力 URL の末尾に表示されます。 フロントマターで指定された値は、ファイル名に基づいて URL のセグメントをオーバーライドします。

summary
: ページ変数 `.Summary` で記事の要約を提供するときに使われるテキストです。 詳細は、[コンテンツサマリー](/content-management/summaries/) セクションで確認できます。

title
: コンテンツのタイトルを指定します。

type
: コンテンツのタイプです。 この値は、フロントマターで指定されていない場合、ディレクトリ (すなわち、[セクション][section]) から自動的に導き出されます。

url
: Web ルートからのコンテンツへのフルパスです。 コンテンツファイルのパスについては想定していません。 詳細は、[URL 管理](/content-management/urls/#set-url-in-front-matter) を参照してください。

videos
: ページに関連する動画へのパスの配列です。 `opengraph` [内部テンプレート](/templates/internal) によって `og:video` に入力するために使用されます。

weight
: [リスト内のコンテンツの順序付け][ordering] に使用されます。 重みが小さいほど優先度が高くなります。 そのため、ウェイトの低いコンテンツが最初に表示されます。 設定されている場合、0 は *未設定* の重みとして解釈されるため、重みは非ゼロである必要があります。

\<taxonomies\>
: インデックスの *複数* 形式のフィールド名です。 上記のフロントマターの例の `tags` と `categories` を参照してください。 *ユーザー定義のタクソノミーの複数形は、定義済みのフロントマター変数のいずれとも同じにはできないことに注意してください。*

{{% note "Hugo's Default URL Destinations" %}}
`slug` と `url` のどちらも存在せず、[サイトの `config` ファイルでパーマリンクが設定されていない場合](/content-management/urls/#permalinks)、Hugo はコンテンツのファイル名を使って出力 URL を作成します。 Hugo のパスについての説明は、[コンテンツ構成](/content-management/organization) を、Hugo のデフォルトの挙動をカスタマイズする方法は、 [「URL 管理」](/content-management/urls/) を参照してください。
{{% /note %}}

### ユーザー定義 {#user-defined}

フロントマターには、ニーズに合わせて任意のフィールドを追加することができます。これらのユーザー定義のキー値は、テンプレートで使用するために、単一の `.Params` 変数に格納されます。

以下のフィールドはそれぞれ `.Params.include_toc` と `.Params.show_comments` によってアクセスすることができます。 [変数][variables] セクションでは、Hugo のページレベルおよびサイトレベルの変数をテンプレートで使用するための詳細な情報を提供しています。

{{< code-toggle copy="false" >}}
include_toc: true
show_comments: false
{{</ code-toggle >}}

## フロントマターのカスケード {#front-matter-cascade}

どのノードやセクションも、予約されているフロントマターの `cascade` キーの下で定義されている限り、フロントマターの値のセットを子孫に伝えることができます。

### 特定のページをターゲットにする {#target-specific-pages}

`cascade` ブロックは、オプションの `_target` キーワードを持つスライスで、異なるページセットを対象とした複数の `cascade` 値を使用できます。

{{< code-toggle copy="false" >}}
title ="Blog"
[[cascade]]
background = "yosemite.jpg"
[cascade._target]
path="/blog/**"
lang="en"
kind="page"
[[cascade]]
background = "goldenbridge.jpg"
[cascade._target]
kind="section"
{{</ code-toggle >}}

`_target` で使用できるキーワード:

path
: /content の下のコンテンツ パスに一致する [Glob](https://github.com/gobwas/glob) パターンで、 Unix スタイルのスラッシュが必要です。 これは仮想パスであるため、マウントルートから始まることに注意してください。 マッチングは二重アスタリスクをサポートしているので、`/blog/*/**` のようなパターンにマッチして、第 3 レベル以下のすべてのものと一致させることができます。

kind
: ページの種類 (複数可) にマッチする glob パターンで、たとえば、"{home,section}"。

lang
: ページの言語に一致する glob パターンで、たとえば、"{en,sv}"。

environment
: ビルド環境に一致する glob パターンで、たとえば、"{production,development}"。

上記はすべて省略可能です。

### 例 {#example}

`content/blog/_index.md` ファイルには、

{{< code-toggle copy="false" >}}
title: Blog
cascade:
  banner: images/typewriter.jpg
{{</ code-toggle >}}

上記の例では、以下の場合を除き、ブログのセクションページとその子孫は、`.Params.banner` が呼び出されたときに `images/typewriter.jpg` を返します。

- その子孫は独自の `banner` 値が設定されている。
- あるいは、より近い祖先ノードに独自の `cascade.banner` 値が設定されている場合。

## フロントマターからコンテンツを注文する {#order-content-through-front-matter}

コンテンツのフロントマターで、コンテンツ固有の `weight` を割り当てることができます。これらの値は、特にリストビューでの [順序付け][ordering] に便利です。
コンテンツの順序付けには `weight` を、タクソノミーの中でのコンテンツの順序付けには [`<TAXONOMY>_weight`][taxweight] という規則を使用することができます。
リストビューでコンテンツを整理するために `weight` をどのように使用できるかは、 [「Hugo リストの順序付けとグループ化」][lists] を参照してください。

## Markdown のグローバル設定をオーバーライドする {#override-global-markdown-configuration}

[プロジェクト設定で設定されたレンダリングオプション][config] のオーバーライドとして、コンテンツのフロントマターで Markdown レンダリングに関するいくつかのオプションを設定できます。

## フロントマターのフォーマット仕様 {#front-matter-format-specs}

- [TOML 仕様][toml]
- [YAML 仕様][yaml]
- [JSON 仕様][json]

[variables]: /variables/
[aliases]: /content-management/urls/#aliases
[archetype]: /content-management/archetypes/
[bylinktitle]: /templates/lists/#by-link-title
[config]: /getting-started/configuration/ "サイト設定に関する Hugo ドキュメント"
[content type]: /content-management/types/
[contentorg]: /content-management/organization/
[headless-bundle]: /content-management/page-bundles/#headless-bundle
[json]: https://www.ecma-international.org/publications/files/ECMA-ST/ECMA-404.pdf "JSON (JavaScript Object Notation) の仕様"
[lists]: /templates/lists/#order-content "リストページでのコンテンツを並べ替える方法を参照してください。たとえば、コンテンツとフロントマターのために特定の _index.md を参照するテンプレートがあります。"
[lookup]: /templates/lookup-order/ "Hugo は、コンテンツをレンダリングする際に、テンプレートを特定の順序でトラバースし、より DRY なテンプレート作成を可能にします。"
[ordering]: /templates/lists/ "Hugo では、リストテンプレートでコンテンツをソートしたり、順序付けする方法が複数あります。"
[outputs]: /templates/output-formats/ "v22 のリリースにより、Hugo の使い慣れたテンプレートを使って、コンテンツを任意のテキスト形式で出力することができるようになりました。"
[page-resources]: /content-management/page-resources/
[pagevars]: /variables/page/
[section]: /content-management/sections/
[taxweight]: /content-management/taxonomies/
[toml]: https://github.com/toml-lang/toml "TOML (Tom's Obvious Minimal Language) の仕様"
[urls]: /content-management/urls/
[variables]: /variables/
[yaml]: https://yaml.org/spec/ "YAML (YAML Ain't Markup Language) の仕様"
