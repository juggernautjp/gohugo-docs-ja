---
aliases:
- /overview/source-directory/
- /overview/configuration/
categories:
- getting started
- fundamentals
date: "2013-07-01"
description: Hugo サイトの設定方法。
draft: false
keywords:
- configuration
- toml
- yaml
- json
linktitle: 設定
menu:
  docs:
    parent: getting-started
    weight: 40
publishdate: "2017-01-02"
title: Hugo の設定
toc: true
weight: 40
---

## 設定ファイル {#configuration-file}

Hugo は  (サイトルートにある場合) `hugo.toml`、`hugo.yaml`、または `hugo.json` をデフォルトのサイト設定ファイルとして使用します。

ユーザーは、コマンドラインの `--config` スイッチを使用して、1 つまたは複数のサイト設定ファイルでそのデフォルトをオーバーライドすることを選択できます。

例:

```bash
hugo --config debugconfig.toml
hugo --config a.toml,b.toml,c.toml
```

{{< note >}}
複数のサイト設定ファイルをカンマ区切りの文字列として `--config` スイッチに指定できます。
{{< /note >}}

## hugo.toml vs config.toml

Hugo 0.110.0 では、デフォルトの設定ベースファイル名を `hugo` に変更しました (たとえば、 `hugo.toml`)。
私たちはまだ `config.toml` などを探しますが、最終的には名前を変更することをお勧めします (ただし、古いバージョンの Hugo をサポートしたい場合は待つ必要があります)。

{{< new-in "0.110.0" >}}

## 設定ディレクトリ {#configuration-directory}

単一のサイト設定ファイルを使用することに加えて、 `configDir` ディレクトリ (デフォルトは `config/`) を使用すると、組織や環境固有の設定を簡単に維持することができます。

- 各ファイルは、`[Params]` には `params.toml`、`[Menu]` には `menu(s).toml`、`[Languages]` には `languages.toml` など、設定のルートオブジェクトを表します。
- 各ファイルの内容は、たとえば以下のように、トップレベルでなければなりません。

{{< code-toggle file="hugo" >}}
[Params]
  foo = "bar"
{{< /code-toggle >}}

{{< code-toggle file="params" >}}
foo = "bar"
{{< /code-toggle >}}

- 各ディレクトリは、環境固有の設定を含むファイル群を保持します。
- ファイルは言語ごとにローカライズすることが可能です。


```txt
├── config
│   ├── _default
│   │   ├── hugo.toml
│   │   ├── languages.toml
│   │   ├── menus.en.toml
│   │   ├── menus.zh.toml
│   │   └── params.toml
│   ├── production
│   │   ├── hugo.toml
│   │   └── params.toml
│   └── staging
│       ├── config.toml
│       └── hugo.toml
```

上記の構造を考えると、`hugo --environment staging` を実行すると、Hugo は `config/_default` のすべての設定を使用し、その上に `staging` の設定をマージします。

これをよりよく理解するために、例を挙げてみましょう。たとえば、あなたの Web サイトに Google アナリティクスを利用しているとします。この場合、`googleAnalytics = "G-XXXXXXXX"` を `hugo.toml` で指定する必要があります。ここで、次のようなシナリオを考えてみましょう。
- Analytics コードを開発中に、つまり `localhost` にロードしたくない場合
- 本番環境とステージング環境に別々の Google アナリティクス ID を使用したい (たとえば、以下のような)
  - 本番環境に `G-PPPPPPPP`
  - ステージング環境に `G-SSSSSSSS`

上記のシナリオを考慮して、`hugo.toml` ファイルを以下のように設定する必要があります。
1. `default/hugo.toml` では、`googleAnalytics` パラメータを記述する必要は全くありません。これにより、開発用サーバ、つまり `hugo server` を実行したときに、Google アナリティクスのコードがロードされないようになります。デフォルトでは、Hugo は `hugo server` を実行するときに `Environment=development` を設定し、 `_default` フォルダーにある設定ファイルを使用するので、これはうまくいきます。
2. `production/hugo.toml` には、以下の 1 行が必要です。

    ```googleAnalytics = "G-PPPPPPPP"```

    この設定ファイルでは、`title`、`baseURL`、`theme` などの他のすべてのパラメータを改めて記述する必要はありません。本番環境では異なる、あるいは新しいパラメータのみを記述する必要があります。これは、Hugo が `_default/hugo.toml` の上に __マージ__ するためです。これで `hugo` (ビルドコマンド) を実行すると、デフォルトで `Environment=production` が設定されます。したがって、 `G-PPPPPPP` の解析コードが本番環境の Web サイトに存在することになります。
3. 同様に `staging/hugo.toml` にも、以下の 1行だけ記述すればよいです。

    ```googleAnalytics = "G-SSSSSSSS"```

    ここで、ステージング環境を使用していることを Hugo に伝える必要があります。ビルドコマンドは `hugo --environment staging` で、ステージング Web サイトに `G-SSSSSS` の解析コードをロードします。

{{< note >}}
デフォルトの環境は、__development (ステージング環境)__ では `hugo server` コマンドを、__production (本番環境)__ では `hugo` コマンドを使用します。
{{%/ note %}}

## テーマから設定をマージする {#merge-configuration-from-themes}

`_merge` の設定値は、以下のいずれかを指定できます。

none
: マージはしない。

shallow
: 新しいキーの値だけを追加する。

deep
: 新しいキーの値を追加し、既存のキーをマージする。

以下のデフォルト設定のように、それほど冗長にする必要はないことに注意してください。 設定されていない場合は、上位の `_merge` 値が継承されます。

{{< code-toggle config="mergeStrategy" skipHeader=true />}}

## すべてのコンフィギュレーション設定 {#all-configuration-settings}

以下は Hugo で定義された変数の完全なリストです。 ユーザーは、サイト設定ファイルでこれらの値をオーバーライドすることができます。

### archetypeDir

**デフォルト値:** "archetypes"

Hugo がアーキタイプ ファイル (コンテンツ テンプレート) を検索するディレクトリ。 {{% module-mounts-note %}}

### assetDir

**デフォルト値:** "assets"

Hugo が [Hugo パイプ](/hugo-pipes/) で使用するアセットファイルを検索するディレクトリ。 {{% module-mounts-note %}}

### baseURL

公開サイトの絶対 URL (プロトコル、ホスト、パス、末尾のスラッシュ) (たとえば、 `https://www.example.org/docs/`)。

### build

[「ビルドを設定する」](#configure-build) を参照してください。

### buildDrafts (false)

**デフォルト値:** false

ビルド時にドラフトを含めます。

### buildExpired

**デフォルト値:** false

期限切れのコンテンツを含めます。

### buildFuture

**デフォルト値:** false

publishdate (公開日) が将来のコンテンツを含めます。

### caches

[「ファイルキャッシュを設定する」](#configure-file-caches) を参照してください。

### cascade

コンテンツツリー内のページに、デフォルトの設定値 (フロントマター) を渡します。サイト設定でのオプションは、ページのフロントマターと同じです。[フロントマター カスケード](/content-management/front-matter#front-matter-cascade) をご覧ください。

### canonifyURLs

**デフォルト値:** false

相対 URL を絶対 URL に変換できるようにします。

### cleanDestinationDir

**デフォルト値:** false

ビルド時に、静的ディレクトリにないファイルをビルド先から削除します。

### contentDir

**デフォルト値:** "content"

Hugo がコンテンツファイルを読み込むディレクトリ。 {{% module-mounts-note %}}

### copyright

**デフォルト値:** ""

サイトの著作権表示で、通常はフッターに表示されます。

### dataDir

**デフォルト値:** "data"

Hugo がデータ ファイルを読み取るディレクトリ。 {{% module-mounts-note %}}

### defaultContentLanguage

**デフォルト値:** "en"

言語インジケーターのないコンテンツは、デフォルトでこの言語になります。

### defaultContentLanguageInSubdir

**デフォルト値:**  false

サブディレクトリにあるデフォルトのコンテンツ言語を、たとえば `content/en/` のようにレンダリングします。サイトルート `/` は `/en/` にリダイレクトされます。

### disableAliases

**デフォルト値:**  false

エイリアス リダイレクトの生成を無効にします。 `disableAliases` が設定されていても、エイリアス自体はページに保持されることに注意してください。 これの動機は、`.htaccess` や Netlify の `_redirects` ファイルなどでカスタム出力形式を使用して 301 リダイレクトを生成できるようにするためのものです。

### disableHugoGeneratorInject

**デフォルト値:**  false

デフォルトでは、Hugo は _home page only_ の HTML ヘッドにジェネレーター メタタグを挿入します。 これをオフにすることもできますが、Hugo の人気が上昇するのを見るには良い方法なので、オフにしていただけるとありがたいです。

### disableKinds

**デフォルト値:**  []

指定された *Kinds* のすべてのページの無効化を有効にします。 このリストで使用できる値は、 `"page"`、`"home"`、`"section"`、`"taxonomy"`、`"term"`、`"RSS"`、`"sitemap"`、`" robotsTXT"`、`"404"` です。

### disableLiveReload

**デフォルト値:**  false

ブラウザ ウィンドウの自動ライブリロードを無効にします。

### disablePathToLower

**デフォルト値:**  false

URL/ パスを小文字に変換しないようにします。

### enableEmoji

**デフォルト値:**  false

ページ コンテンツで絵文字のサポートを有効にします。[「絵文字チートシート」](https://www.webpagefx.com/tools/emoji-cheat-sheet/) を参照してください。

### enableGitInfo

**デフォルト値:**  false

各ページの `.GitInfo` オブジェクトを有効にします (Hugo サイトが Git でバージョン管理されている場合)。これにより、各ページの `Lastmod` パラメータが、そのコンテンツファイルの最終 git commit 日時を使用して更新されます。

### enableInlineShortcodes

**デフォルト値:**  false

インライン ショートコードのサポートを有効にします。 詳細は、[「インライン ショートコード」](/templates/shortcode-templates/#inline-shortcodes) を参照してください。

### enableMissingTranslationPlaceholders

**デフォルト値:**  false

デフォルト値の代わりにプレースホルダーを表示するか、翻訳がない場合は空文字列を表示します。

### enableRobotsTXT

**デフォルト値:**  false

`robots.txt` ファイルの生成を有効にします。

### frontmatter

[「フロントマターの設定」](#configure-front-matter) を参照してください。

### googleAnalytics

**デフォルト値:**  ""

Google アナリティクスのトラッキング ID です。

### hasCJKLanguage

**デフォルト値:** false

true の場合、コンテンツ内の中国語/日本語/韓国語の自動検出を行います。これにより、`.Summary` と `.WordCount` が日中韓 (CJK) の言語に対して正しく動作するようになります。


### imaging

[「画像処理の設定」](/content-management/image-processing/#imaging-configuration) を参照してください。

### languageCode

**デフォルト値:**  ""

[RFC 5646](https://datatracker.ietf.org/doc/html/rfc5646) で定義された言語タグでう。この値は、以下の値を設定するために使用されます。

- 内部の [RSS テンプレート](https://github.com/gohugoio/hugo/blob/master/tpl/tplimpl/embedded/templates/_default/rss.xml) の `<language>` 要素 
- 内部の [エイリアス テンプレート](https://github.com/gohugoio/hugo/blob/master/tpl/tplimpl/embedded/templates/alias.html) にある `<html>` 要素の `lang` 属性。

### languages

[「言語を設定する」](/content-management/multilingual/#configure-languages) を参照してください。

### disableLanguages

[「言語を無効にする」](/content-management/multilingual/#disable-a-language) を参照してください。

### markup

[「マークアップを設定する」](/getting-started/configuration-markup) を参照してください。

### mediaTypes

[「メディアタイプを設定する」](/templates/output-formats/#media-types) を参照してください。

### menus

[「メニュー」](/content-management/menus/#define-in-site-configuration) を参照してください。

### minify

[「ミニファイを設定する」](#configure-minify) を参照してください。

### module

モジュール設定です。[「モジュール設定」](/hugo-modules/configuration/) を参照してください。

### newContentEditor

**デフォルト値:** ""

新しいコンテンツを作成する際に使用するエディターです。

### noChmod

**デフォルト値:** false

ファイルのパーミッション モードを同期させません。

### noTimes

**デフォルト値:** false

ファイルの修正時刻を同期させません。

### outputFormats

[「出力形式を設定する」](#configure-additional-output-formats) を参照してください。

### paginate

**デフォルト値:** 10

[ページネーション](/templates/pagination/) における、1ページあたりの要素のデフォルト数です。

### paginatePath

**デフォルト値:** "page"

ページネーション中に使用されるパス要素 (`https://example.com/page/2`)。

### permalinks

[「コンテンツ管理」](/content-management/urls/#permalinks) を参照してください。

### pluralizeListTitles

**デフォルト値:** true

リスト内のタイトルを複数形にします。

### publishDir

**デフォルト値:** "public"

Hugo が最終的な静的サイト (HTML ファイルなど) を書き込むディレクトリです。

### related

[「関連コンテンツ」](/content-management/related/#configure-related-content) を参照してください。{{< new-in "0.27" >}}

### relativeURLs

**デフォルト値:** false

これを有効にすると、すべての相対 URL はコンテンツルートからの相対的になります。絶対 URL には影響しないことに注意してください。

### refLinksErrorLevel

**デフォルト値:** "ERROR"

ページリンクを解決するために `ref` または `relref` を使用し、リンクが解決できなかった場合に、このログレベルでログに記録されます。有効な値は `ERROR` (デフォルト) または `WARNING` です。 `ERROR` が指定された場合は、ビルドに失敗します (`exit -1`)。

### refLinksNotFoundURL

`ref` または `relref` でページ参照が見つからない場合に、プレースホルダとして使用する URL。そのまま使用される。

### removePathAccents

**デフォルト値:** false

コンテンツ パスの [複合文字](https://en.wikipedia.org/wiki/Precomposed_character) から [非空白記号](https://www.compart.com/en/unicode/category/Mn) を削除します。

```text
content/post/hügó.md --> https://example.org/post/hugo/
```

### rssLimit

**デフォルト値:** -1 (unlimited)

RSS フィードの最大アイテム数。

### sectionPagesMenu

[「メニュー」](/content-management/menus/#define-in-site-configuration) を参照してください。

### security

[「セキュリティポリシー」](/about/security-model/#security-policy) を参照してください。

### sitemap

デフォルトの [サイトマップ設定](/templates/sitemap-template/#configuration) です。

### summaryLength

**デフォルト値:** 70

[`.Summary`](/content-management/summaries/#automatic-summary-splitting) に表示するテキストの長さを単語単位で指定します。

### taxonomies

[「タクソノミーを設定する」](/content-management/taxonomies#configure-taxonomies) を参照してください。

### theme

テーマをインポートする方法については、[「モジュール設定」](/hugo-modules/configuration/#module-configuration-imports) を参照してください。

### themesDir

**デフォルト値:**  "themes"

Hugo がテーマを読み込むディレクトリ。

### timeout

**デフォルト値:** "30s"

[duration](https://pkg.go.dev/time#Duration) または秒単位で指定される、ページコンテンツ生成のためのタイムアウト。
*注意:* &nbsp;これは再帰的なコンテンツ生成から抜け出すために使用されます。ページの生成に時間がかかる場合、この制限を上げる必要があるかもしれません (たとえば、大きな画像処理を必要としたり、リモートコンテンツに依存する場合など)。

### timeZone

[`time` 関数](/function/time/) で、そのような情報なしでフロントマターの日付を解析するために使用される、たとえば `Europe/Oslo` のようなタイムゾーン (または場所)。有効な値のリストはシステムに依存しますが、 `UTC`、`Local`、そして [IANA タイムゾーンデータベース](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones) にある任意の場所を含める必要があります。

### title

サイトのタイトルです。

### titleCaseStyle

**デフォルト値:**  "AP"

[「タイトルケースを設定する」](#configure-title-case) を参照してください。

### uglyURLs

**デフォルト値:** false

有効にすると、`/filename/` の代わりに `/filename.html` の形式の URL が作成されます。

### watch

**デフォルト値:** false

ファイルシステムの変更を監視し、必要に応じて再作成します。

{{< note >}}
\*nix マシン上でサイトを開発しているならば、ここでは、コマンドラインから設定オプションを見つけるための便利なショートカットを紹介します。

```bash
cd ~/sites/yourhugosite
hugo config | grep emoji
```

以下のような出力を示します。

```yaml
enableemoji: true
```
{{< /note >}}

## ビルドを設定する {#configure-build}

`build` 設定セクションには、ビルドに関連するグローバルな設定オプションが含まれています。

{{< code-toggle file="hugo" >}}
[build]
  noJSConfigInAssets = false
  useResourceCacheWhen = 'fallback'
  [build.buildStats]
    disableClasses = false
    disableIDs = false
    disableTags = false
    enable = false
[[build.cachebusters]]
  source = 'assets/.*\.(js|ts|jsx|tsx)'
  target = '(js|scripts|javascript)'
[[build.cachebusters]]
  source = 'assets/.*\.(css|sass|scss)$'
  target = '(css|styles|scss|sass)'
[[build.cachebusters]]
  source = '(postcss|tailwind)\.config\.js'
  target = '(css|styles|scss|sass)'
[[build.cachebusters]]
  source = 'assets/.*\.(.*)$'
  target = '$1'
{{< /code-toggle >}}

buildStats {{< new-in "0.115.1" >}}
: 有効にすると、プロジェクトのルートに `hugo_stats.json` ファイルが作成されます。このファイルには、公開されているサイト内のすべての HTML 要素の `class` 属性、`id` 属性、タグの配列が含まれています。このファイルは、サイトから [未使用の CSS を削除する][removing unused CSS] 際のデータソースとして使用します。このプロセスは、枝刈り (pruning)、パージ (purging)、ツリーシェイク (tree shaking) としても知られています。

[removing unused CSS]: http://localhost:1313/hugo-pipes/postprocess/#css-purging-with-postcss

`disableClasses`、`disableIDs`、`disableTags` キーを使用して、`hugo_stats.json` から `class` 属性、`id` 属性、またはタグを除外します。

{{% note %}}
v0.115.0 以前では、この機能は `writeStats` を `true` に設定することで有効になっていました。`writeStats` キーはまだ機能していますが、将来のリリースでは廃止される予定です。

CSS のパージは通常プロダクションビルドに限定されるので、`buildStats` オブジェクトを [config/production] の下に配置します。

[config/production]: /getting-started/configuration/#configuration-directory

高速化のために構築されたため、公開されたサイトの解析中に「誤検知 (falsse positive)」 (HTML 要素ではない HTML 要素など) が発生することがあります。このような「誤検知」はまれであり、取るに足らないものです。
{{% /note %}}

サーバーの部分的なビルドの性質上、新しい HTML エンティティはサーバーの実行中に追加されますが、古い値はサーバーを再起動するか、通常の `hugo` ビルドを実行するまで削除されません。

cachebusters
: See [キャッシュバスターを設定する](#configure-cache-busters)

noJSConfigInAssets
: [js.Build](/hugo-pipes/js) の実行からのインポートのマッピングを含む `jsconfig.json` を `/assets` フォルダーに書き込むことをオフにします。このファイルは [VS Code](https://code.visualstudio.com/) のようなコードエディタでのインテリセンスやナビゲーションを助けるためのものです。なお、`js.Build` を使用しない場合、ファイルは書き込まれないことに注意してください。

useResourceCacheWhen
: PostCSS と ToCSS で、`/resources/_gen` にあるキャッシュされたリソースをいつ使用するかを指定します。有効な値は `never`、`always` および `fallback` です。最後の値は、PostCSS/拡張版が利用できない場合に、キャッシュを試行することを意味します。

## キャッシュバスターを設定する {#configure-cache-busters}

{{< new-in "0.112.0" >}}

Tailwind 3.x の JIT コンパイラを使用した開発をサポートするために、`build.cachebusters` 設定オプションが追加されました。 `build` 設定は以下のようになります。

<!-- TODO (jmm) writeStats => build.buildStats -->

{{< code-toggle file="hugo" >}}
[build]
  [build.buildStats]
    enable = true
  [[build.cachebusters]]
    source = "assets/watching/hugo_stats\\.json"
    target = "styles\\.css"
  [[build.cachebusters]]
    source = "(postcss|tailwind)\\.config\\.js"
    target = "css"
  [[build.cachebusters]]
    source = "assets/.*\\.(js|ts|jsx|tsx)"
    target = "js"
  [[build.cachebusters]]
    source = "assets/.*\\.(.*)$"
    target = "$1"
{{< /code-toggle >}}

上記のいくつかの重要なポイントは、`writeStats = true` です。
これは、レンダリングされた出力で使用される HTML クラスなどを使用して、ビルドごとに `hugo_stats.json` ファイルを書き込みます。
このファイルを変更すると、`styles.css` ファイルの再構築がトリガーされます。 
また、Hugo のサーバーウォッチャーに `hugo_stats.json` を追加する必要があります。
実行例は、 [Hugo Starter Tailwind Basic](https://github.com/bep/hugo-starter-tailwind-basic) を参照してください。

source
: Hugo の仮想コンポーネント ディレクトリの 1 つに対する正規表現一致ファイル (通常は `assets/...`)。

target
: `source` が変更されたときに期限切れになる必要があるリソース キャッシュ内のキーに一致する正規表現。 `$1` のように、`source` に一致する正規表現グループを式に使用できます。

## サーバーを設定する {#configure-server}

これは `hugo server` を実行するときにのみ関係し、開発中に HTTP ヘッダーを設定することができるので、コンテンツ セキュリティ ポリシーなどをテストすることができます。設定形式は、[Netlify の](https://docs.netlify.com/routing/headers/#syntax-for-the-netlify-configuration-file) と少し強力な [glob マッチング](https://github.com/gobwas/glob) にマッチしています。


{{< code-toggle file="hugo">}}
[server]
[[server.headers]]
for = "/**"

[server.headers.values]
X-Frame-Options = "DENY"
X-XSS-Protection = "1; mode=block"
X-Content-Type-Options = "nosniff"
Referrer-Policy = "strict-origin-when-cross-origin"
Content-Security-Policy = "script-src localhost:1313"
{{< /code-toggle >}}

これは「開発専用」なので、以下のように `development` 環境の下に置くのが理にかなっているかもしれません。


{{< code-toggle file="config/development/server">}}
[[headers]]
for = "/**"

[headers.values]
X-Frame-Options = "DENY"
X-XSS-Protection = "1; mode=block"
X-Content-Type-Options = "nosniff"
Referrer-Policy = "strict-origin-when-cross-origin"
Content-Security-Policy = "script-src localhost:1313"
{{< /code-toggle >}}

また、サーバーの簡単なリダイレクトルールを指定することもできます。この構文もまた、Netlify のものと同様です。

`status` コード 200 は [URL リライト](https://docs.netlify.com/routing/redirects/rewrites-proxies/) をトリガーすることに注意してください。これは、SPA の状況で必要なものです。たとえば、次のようにします。

{{< code-toggle file="config/development/server">}}
[[redirects]]
from = "/myspa/**"
to = "/myspa/"
status = 200
force = false
{{< /code-toggle >}}

`force=true` を設定すると、パスに既存のコンテンツがある場合でもリダイレクトを行います。Hugo 0.76 以前は `force` がデフォルトの動作でしたが、これはNetlify が行う方法と一致していることに注意してください。

## 404 サーバーエラーページ {#_404-server-error-page}

{{< new-in "0.103.0" >}}

デフォルトでは、`404.html` テンプレートで `hugo server` を実行すると、Hugo はすべての 404 エラーをレンダリングします。[サーバーの設定](#configure-server) に 1 つ以上のリダイレクトを追加している場合は、404リダイレクトを明示的に追加する必要があることに注意してください。

{{< code-toggle file="config/development/server" copy=false >}}
[[redirects]]
from   = "/**"
to     = "/404.html"
status = 404
{{< /code-toggle >}}

## タイトルケースを設定する {#configure-title-case}

[title](/function/title/) テンプレート関数と Hugo の自動セクションタイトルで使用されるタイトルスタイルを指定するには、`titleCaseStyle` を設定します。

値は、以下のいずれかになります。

* `ap` (デフォルト): [Associated Press (AP) スタイルブック][Associated Press (AP) Stylebook] の大文字と小文字のルール 
* `chicago`:  [シカゴ・マニュアル・オブ・スタイル][Chicago Manual of Style]
* `go`:  すべての単語を大文字にするという Go の慣例。
* `firstupper`:  最初の単語の最初の文字を大文字にします。
* `none`:  大文字は使用しません。

[Associated Press (AP) Stylebook]: https://www.apstylebook.com/
[Chicago Manual of Style]: https://www.chicagomanualofstyle.org/home.html
[site configuration]: /getting-started/configuration/#configure-title-case

## コンフィギュレーション環境変数 {#configuration-environment-variables}

HUGO_NUMWORKERMULTIPLIER
: Hugo の並列処理で使用するワーカーの数を増減するように設定できます。 設定されていない場合、論理 CPU の数が使用されます。

## 設定ファイルの検索順序 {#configuration-lookup-order}

テンプレート [検索順序][lookup order] と同様に、Hugo にはデフォルトの動作として、Web サイトのソースディレクトリのルートにある設定ファイルを検索するためのデフォルトのルールセットが用意されています。

1. `./hugo.toml`
2. `./hugo.yaml`
3. `./hugo.json`

設定ファイルでは、Hugo に Web サイトのレンダリング方法を指示したり、Web サイトのメニューを制御したり、プロジェクトに特有のサイト全体のパラメータを任意に定義したりすることが可能です。


## 設定例 {#example-configuration}

以下は、設定ファイルの典型的な例です。 `params:` の下にネストされた値は、[テンプレート][templates] で使用するために [`.Site.Params`] 変数に格納されます。

{{< code-toggle file="hugo">}}
baseURL: "https://yoursite.example.com/"
title: "My Hugo Site"
permalinks:
  posts: /:year/:month/:title/
params:
  Subtitle: "Hugo is Absurdly Fast!"
  AuthorName: "Jon Doe"
  GitHubUser: "spf13"
  ListOfFoo:
    - "foo1"
    - "foo2"
  SidebarRecentLimit: 5
{{< /code-toggle >}}

## 環境変数で設定する {#configure-with-environment-variables}

前述の 3 つの設定オプションに加え、OS の環境変数を使用して設定キー値を定義することができます。

たとえば、以下のコマンドは、Unix 系システムにおいて、Web サイトのタイトルを効果的に設定します。

```bash
$ env HUGO_TITLE="Some Title" hugo
```

これは Netlify のようなサービスを利用してサイトをデプロイする場合にとても便利です。Hugo のドキュメント [Netlify 設定ファイル](https://github.com/gohugoio/hugoDocs/blob/master/netlify.toml) に例があります。

{{% note %}}
OS の環境変数を設定する際には、名前の前に `HUGO_` を付け、設定キーを大文字で設定する必要があります。

設定パラメータを設定するには、名前のプレフィックスに `HUGO_PARAMS_` を付けます。
{{% /note %}}

スネークケース [^1] の変数名を使っている場合、上記は動作しません。Hugo は `HUGO` の後の最初の文字で、使用する区切り文字を決定します。これにより、任意の [有効な (allowed)](https://stackoverflow.com/questions/2821043/allowed-characters-in-linux-environment-variable-names#:~:text=So%20names%20may%20contain%20any,not%20begin%20with%20a%20digit.) 区切り文字を使用して、`HUGOxPARAMSxAPI_KEY=abcdefgh` という形式の環境変数を定義することができるようになっています。

{{< todo >}}
Test and document setting params via JSON env var.
{{< /todo >}}

## レンダリング時にコンテンツとデータ ファイルを無視する {#ignore-content-and-data-files-when-rendering}

**注意:** これは動作しますが、より新しく強力な [includeFiles および excludeFiles](https://gohugo.io/hugo-modules/configuration/#module-config-mounts) マウント オプションを使用することをお勧めします。

サイトをレンダリングするときに `content`、`data`、`i18n` ディレクトリから特定のファイルを除外するには、`ignoreFiles` に絶対ファイルパスに対してマッチする 1 つ以上の正規表現を設定します。

`.foo` や `.boo` で終わるファイルを無視するには、以下のようにします。

{{< code-toggle copy=false file="hugo" >}}
ignoreFiles = ['\.foo$', '\.boo$']
{{< /code-toggle >}}

絶対ファイルパスを使ってファイルを無視するには、以下のようにします。

{{< code-toggle copy=false file="hugo" >}}
ignoreFiles = ['^/home/user/project/content/test\.md$']
{{< /code-toggle >}}

## フロントマターを設定する {#configure-front-matter}

### 日付を設定する {#configure-dates}

Hugo では日付が重要であり、Hugo がコンテンツページにどのように日付を割り当てるか設定できます。これは、`hugo.toml` に `frontmatter` セクションを追加することで行います。

デフォルトの設定は以下のとおりです。

{{< code-toggle file="hugo" >}}
[frontmatter]
date = ["date", "publishDate", "lastmod"]
lastmod = [":git", "lastmod", "date", "publishDate"]
publishDate = ["publishDate", "date"]
expiryDate = ["expiryDate"]
{{< /code-toggle >}}

たとえば、コンテンツの一部に非標準の日付パラメータがある場合、 `date` の設定をオーバーライドできます。

{{< code-toggle file="hugo" >}}
[frontmatter]
date = ["myDate", ":default"]
{{< /code-toggle >}}

`:default` は、デフォルト設定へのショートカットです。上記の例では、 `.Date` が存在すれば `myDate` の日付値を設定し、存在しなければ `date`、`publishDate`、`lastmod` を調べて、最初に有効な日付を選択することになります。

右側のリストで、`:` で始まる値は特別な意味を持つ日付ハンドラーです (下記参照)。それ以外は、フロントマターの設定にある日付パラメータの名前 (大文字小文字は区別されません) です。 また、Hugo には上記のようなエイリアスがいくつか組み込まれていることに注意してください。たとえば、 `lastmod` => `modified`. `publishDate` => `pubdate`. `published`. `expiryDate` => `unpublishdate` などです。これを例にとると、フロントマターの日付として `pubDate` を使用すると、デフォルトで `.PublishDate` に代入されることになります。

特別な日付ハンドラーは、以下のとおりです。


`:fileModTime`
: コンテンツファイルの最終更新タイムスタンプから日付を取得します。

例:

{{< code-toggle file="hugo" >}}
[frontmatter]
lastmod = ["lastmod", ":fileModTime", ":default"]
{{< /code-toggle >}}


上記では、まず `.Lastmod` の値を抽出しようとします。まず フロントマターの `lastmod` パラメータから始まり、次にコンテンツファイルの変更タイムスタンプを抽出します。最後の `:default` はここでは必要ありませんが、Hugo は最後に `:git`、`date`、そして `publishDate` の中から有効な日付を探します。


`:filename`
: コンテンツファイルのファイル名から日付を取得します。たとえば、 `2018-02-22-mypage.md` とすると、`2018-02-22` という日付が取り出されます。また、`slug` が設定されていない場合は、 `mypage` が `.Slug` の値として使用されます。

例:

{{< code-toggle file="hugo" >}}
[frontmatter]
date  = [":filename", ":default"]
{{< /code-toggle >}}

上記は、まずファイル名から `.Date` の値を抽出し、次にフロントマターのパラメータ `date`、`publishDate`、最後に `lastmod` を調べます。


`:git`
: このコンテンツファイルの最終リビジョンの Git 作成日時です。これは、 `--enableGitInfo` が設定されているか、サイト設定で `enableGitInfo = true` が設定されている場合のみ、設定されます。

## 追加の出力形式を設定する {#configure-additional-output-formats}

Hugo v0.20 では、コンテンツを複数の出力形式 (JSON、AMP html、CSV など) にレンダリングする機能が導入されました。これらの値を Hugo プロジェクトの設定ファイルに追加する方法については、[「出力形式」][Output Formats] を参照してください。

## ミニファイを設定する {#configure-minify}

デフォルト設定:

{{< code-toggle config="minify" />}}

## ファイルキャッシュを設定する {#configure-file-caches}

Hugo 0.52 以降では、`cacheDir` 以外も設定することができます。以下はデフォルトの設定です。

{{< code-toggle file="hugo" >}}
[caches]
[caches.getjson]
dir = ":cacheDir/:project"
maxAge = -1
[caches.getcsv]
dir = ":cacheDir/:project"
maxAge = -1
[caches.getresource]
dir = ":cacheDir/:project"
maxAge = -1
[caches.images]
dir = ":resourceDir/_gen"
maxAge = -1
[caches.assets]
dir = ":resourceDir/_gen"
maxAge = -1
[caches.modules]
dir = ":cacheDir/modules"
maxAge = -1
{{< /code-toggle >}}

これらのキャッシュ設定は、あなた自身の `hugo.toml` でオーバーライドすることができます。

### キーワードの説明 {#the-keywords-explained}

`:cacheDir`
: これは `cacheDir` 設定オプションが設定されている場合の値です (OS 環境変数 `HUGO_CACHEDIR` からも設定できます)。Netlify では `/opt/build/cache/hugo_cache/` に、それ以外では OS の一時ディレクトリの下にある `hugo_cache_$USER` ディレクトリにフォールバックします。つまり、Netlify 上でビルドを実行すると、`:cacheDir` で設定されたすべてのキャッシュが保存され、次のビルドでリストアされます。他の CI ベンダーについては、それぞれのドキュメントを読んでください。CircleCI の例としては、[この設定](https://github.com/bep/hugo-sass-test/blob/6c3960a8f4b90e8938228688bc49bdcdd6b2d99e/.circleci/config.yml) を参照してください。

`:project`
: 現在の Hugo プロジェクトのベースディレクトリ名です。これは、デフォルトの設定では、すべてのプロジェクトでファイルキャッシュが分離され、`hugo --gc` を実行したときに、同じ PC で動作している他の Hugo プロジェクトに関連するファイルに触れないことを意味します。

`:resourceDir`
: これは `resourceDir` 設定オプションの値です。

maxAge
: これはキャッシュが削除されるまでの時間で、-1 は永久、0 はキャッシュを削除します。Go の `time.Duration` を使用するので、有効な値は `"10s"` (10秒)、 `"10m"` (10分)、 `"10h"` (10時間) です。

dir
: このキャッシュのファイルが保存される場所への絶対パス。 許可されている開始プレースホルダーは `:cacheDir` と `:resourceDir` (上記を参照) です。

## 設定ファイルのフォーマット仕様 {#Configuration-format-specs}

- [TOML 仕様][toml]
- [YAML 仕様][yaml]
- [JSON 仕様][json]


## 訳注

[^1]: 「スネークケース」とは、プログラミングなどで英語の複合語やフレーズ（句）、文を一語に繋げて表記する際に、単語間のスペース（空白文字）をアンダースコア（_）に置き換える方式。小文字のみの平板な様子を蛇（snake）になぞらえたもので、 “array_change_key_case” のような表記がこれに当たる。([IT用語辞典](https://e-words.jp/w/%E3%82%B9%E3%83%8D%E3%83%BC%E3%82%AF%E3%82%B1%E3%83%BC%E3%82%B9.html) より引用)


[`.Site.Params`]: /variables/site/
[directory structure]: /getting-started/directory-structure
[json]: https://www.ecma-international.org/publications/files/ECMA-ST/ECMA-404.pdf "Specification for JSON, JavaScript Object Notation"
[lookup order]: /templates/lookup-order/
[Output Formats]: /templates/output-formats/
[templates]: /templates/
[toml]: https://toml.io/en/
[yaml]: https://yaml.org/spec/
[static-files]: /content-management/static-files/
