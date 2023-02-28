---
aliases:
- /layouts/introduction/
- /layout/introduction/
- /templates/go-templates/
categories:
- templates
- fundamentals
date: "2017-02-01"
description: Hugo はテンプレート作成の基礎として、Go の `html/template` ライブラリと `text/template` ライブラリを使用します。
draft: false
keywords:
- go
lastmod: "2022-09-20"
linktitle: テンプレート入門
menu:
  docs:
    parent: templates
    weight: 10
publishdate: "2017-02-01"
sections_weight: 10
title: Hugo テンプレート入門
toc: true
weight: 10
---

{{% note %}}
以下は、Go テンプレートについての入門書です。 Go テンプレートについての詳細については、公式の [Go ドキュメント](https://golang.org/pkg/text/template/) を確認してださい。
{{% /note %}}

Go テンプレートは、最も基本的なロジックのみがテンプレートまたはビュー層に属するという信念に基づき、極めてシンプルなテンプレート言語を提供します。

## 基本構文 {#basic-syntax}

Go テンプレートは、[変数][variables] と [関数][functions] が追加された HTML ファイルです。 Go テンプレートの変数と関数は `{{ }}` 内でアクセスできます。

### 定義済み変数にアクセスする {#access-a-predefined-variable}

_定義済み変数_ とは、現在のスコープに既に存在する変数 (以下の [変数]({{< relref "#variables" >}}) セクションの `.Title` の例のように)、またはカスタム変数 (同じセクションの `$address` の例のように) である可能性があります。

```go-html-template
{{ .Title }}
{{ $address }}
```

関数のパラメーターはスペースで区切られます。 一般的な構文は、以下の通りです。

```go-html-template
{{ FUNCTION ARG1 ARG2 .. }}
```

以下の例では、`1` と `2` を入力として `add` 関数を呼び出しています。

```go-html-template
{{ add 1 2 }}
```

#### メソッドとフィールドはドット記法でアクセスする {#methods-and-fields-are-accessed-via-dot-notation}

コンテンツの [フロントマター][front matter] に定義されているページパラメーター `bar` にアクセスします。

```go-html-template
{{ .Params.bar }}
```

#### 括弧を使用してアイテムをグループ化できる {#parentheses-can-be-used-to-group-items-together}

```go-html-template
{{ if or (isset .Params "alt") (isset .Params "caption") }} Caption {{ end }}
```

#### 1 つのステートメントを複数行に分割できる {#a-single-statement-can-be-split-over-multiple-lines}

```go-html-template
{{ if or
  (isset .Params "alt")
  (isset .Params "caption")
}}
```

#### 生の文字列リテラルには改行を含めることができる {#raw-string-literals-can-include-newlines}

```go-html-template
{{ $msg := `Line one.
Line two.` }}
```

## 変数 {#variables}

各 Go テンプレートはデータオブジェクトを取得します。 Hugo では、各テンプレートに `Page` が渡されます。 以下の例では、`.Title` はその [`Page` 変数][pagevars] でアクセス可能な要素の 1 つです。

`Page` がテンプレートのデフォルトスコープであるため、現在のスコープ (`.` -- "**ドット**") にある `Title` 要素には、以下のようなドットプレフィックス (`.Title`) で簡単にアクセスできます。

```go-html-template
<title>{{ .Title }}</title>
```

また、値はカスタム変数に保存し、後で参照することもできます。

{{% note %}}
カスタム変数のプレフィックスに `$` を付ける必要があります。
{{% /note %}}

```go-html-template
{{ $address := "123 Main St." }}
{{ $address }}
```

変数は `=` 演算子を用いて再定義できます。以下の例では、ホームページに "Var is Hugo Home" と表示し、他のすべてのページには "Var is Hugo Page" と表示します。

```go-html-template
{{ $var := "Hugo Page" }}
{{ if .IsHome }}
    {{ $var = "Hugo Home" }}
{{ end }}
Var is {{ $var }}
```

## 関数 {#functions}

Go テンプレートはいくつかの基本的な関数を備えているだけでなく、アプリケーションが元のセットを拡張するためのメカニズムも提供します。

[Hugo テンプレート関数][functions] は、Web サイトを構築するために必要な機能を追加します。関数を呼び出すには、関数の名前に続けて、必要なパラメーターをスペースで区切って指定します。テンプレート関数は、Hugo を再コンパイルしないと追加できません。

### 例 1: 数字の足し算 {#example-1-adding-numbers}

```go-html-template
{{ add 1 2 }}
<!-- 3 を出力します -->
```

### 例 2：数値の比較 {#example-2-comparing-numbers}

```go-html-template
{{ lt 1 2 }}
<!-- true を出力します (つまり、 1 は 2 未満なので) -->
```

どちらの例も、Go テンプレートの [math][math] 関数を使用していることに注意してください。

{{% note "Additional Boolean Operators" %}}
[Go テンプレートのドキュメント](https://golang.org/pkg/text/template/#hdr-Functions) には、Hugo のドキュメントに掲載されている以外にも多くのブール演算子があります。
{{% /note %}}

## インクルードする (含める) {#includes}

別のテンプレートを含める場合は、アクセスする必要があるデータを渡す必要があります。

{{% note %}}
現在のコンテキストを伝えるために、末尾に **ドット** を含めることを忘れないでください。
{{% /note %}}

テンプレートの場所は、常に Hugo 内の `layouts/` ディレクトリから始まります。

### パーシャル (部分テンプレート) {#partial}

[`partial`][partials] 関数は、構文 `{{ partial "<PATH>/<PARTIAL>.<EXTENSION>" . }}` を使用して _部分_ テンプレートをインクルードするために使用されます。

以下は、`layouts/partials/header.html` パーシャルをインクルードする例です。

```go-html-template
{{ partial "header.html" . }}
```

### テンプレート {#template}

Hugo のかなり古いバージョンでは、 `template` 関数は _部分_ テンプレートをインクルードするために使用されていました。今は、[_部分_ テンプレート][internal templates] を呼び出すのにのみ有効です。この構文は、 `{{ template "_internal/<TEMPLATE>.<EXTENSION>" . }}` です。

{{% note %}}
利用可能な **内部** テンプレートは、 [ここ](https://github.com/gohugoio/hugo/tree/master/tpl/tplimpl/embedded/templates) で確認できます。
{{% /note %}}

以下は、内部テンプレート `opengraph.html` をインクルードする例です。

```go-html-template
{{ template "_internal/opengraph.html" . }}
```

## ロジック {#logic}

Go テンプレートは、最も基本的な反復処理と条件分岐のロジックを提供します。

### 反復処理 {#iteration}

Go テンプレートは、`range` を多用して _map_、_array_、または _slice_ を反復処理します。 以下は、`range` の使用方法のさまざまな例です。

#### 例 1: コンテキストの使用 (`.`) {#example-1-using-context}

```go-html-template
{{ range $array }}
    {{ . }} <!-- The . represents an element in $array -->
{{ end }}
```

#### 例 2: 配列要素の値を変数名で宣言する {#example-2-declaring-a-variable-name-for-an-array-elements-value}

```go-html-template
{{ range $elem_val := $array }}
    {{ $elem_val }}
{{ end }}
```

#### 例 3: 配列要素のインデックス _と_ 値を変数名で宣言する {#example-3-declaring-variable-names-for-an-array-elements-index-and-value}

配列またはスライスの場合、最初に宣言された変数が各要素のインデックスにマップされます。

```go-html-template
{{ range $elem_index, $elem_val := $array }}
   {{ $elem_index }} -- {{ $elem_val }}
{{ end }}
```

#### 例 4: マップ要素のキー _と_ 値を変数名で宣言する {#example-4-declaring-variable-names-for-a-map-elements-key-and-value}

マップの場合、最初に宣言された変数が各マップ要素のキーにマップされます。

```go-html-template
{{ range $elem_key, $elem_val := $map }}
   {{ $elem_key }} -- {{ $elem_val }}
{{ end }}
```

#### 例 5: 空の _マップ_、_配列_ または _スライス_ の条件付き {#example-5-conditional-on-empty-map-array-or-slice}

`range` に渡された _map_、_array_、または _slice_ の長さがゼロの場合、else 文が評価されます。

```go-html-template
{{ range $array }}
    {{ . }}
{{else}}
    <!-- This is only evaluated if $array is empty -->
{{ end }}
```

### 条件分岐 {#conditionals}

`if`、`else`、`with`、`or`、`and`、`not` は、 Go テンプレートで条件分岐を扱うためのフレームワークを提供します。 `range` と同様に、 `if` と `with` 文は `{{ end }}` で閉じます。

Go テンプレートは、以下の値を **false** として扱います。

- `false` (boolean)
- 0 (integer)
- 長さゼロの配列、スライス、マップ、または文字列

#### 例 1: `with` {#example-1-with}

`with` を使って「何かあったらこうする」というような文を書くのが一般的です。

{{% note %}}
`with` は、そのスコープ内でコンテキスト `.` を再バインドします (`range` と同様)。
{{% /note %}}

変数が存在しない場合や、上記で説明したように "false" と評価された場合は、ブロックをスキップします。

```go-html-template
{{ with .Params.title }}
    <h4>{{ . }}</h4>
{{ end }}
```

#### 例 2: `with` .. `else` {#example-2-with-else}

以下のスニペットは、設定されている場合は "description" フロントマター パラメータの値を使用し、設定されていない場合はデフォルトの `.Summary` [ページ変数][pagevars] を使用します。

```go-html-template
{{ with .Param "description" }}
    {{ . }}
{{ else }}
    {{ .Summary }}
{{ end }}
```

詳細は、[`.Param` 関数][param] を参照してください。

#### 例 3: `if` {#example-3-if}

`with` の別の (そしてより冗長な) 書き方は、`if` を使用することです。 ここで、`.` はリバウンドしません。

以下の例は、「例 1」を `if` を使って書き直したものです。

```go-html-template
{{ if isset .Params "title" }}
    <h4>{{ index .Params "title" }}</h4>
{{ end }}
```

#### 例 4: `if` .. `else` {#example-4-if-else}

以下の例は、「例 2」を `if` ... `else` で書き換え、代わりに [`isset` 関数][isset] + `.Params` 変数 (`.Param` **関数**][param] とは異なる) を使用した例です。

```go-html-template
{{ if (isset .Params "description") }}
    {{ index .Params "description" }}
{{ else }}
    {{ .Summary }}
{{ end }}
```

#### 例 5: `if` .. `else if` .. `else` {#example-5-if-else-if-else}

`with` とは異なり、 `if` には `else if` 節を含めることもできます。

```go-html-template
{{ if (isset .Params "description") }}
    {{ index .Params "description" }}
{{ else if (isset .Params "summary") }}
    {{ index .Params "summary" }}
{{ else }}
    {{ .Summary }}
{{ end }}
```

#### 例 6: `and` および `or` {#example-6-and-or}

```go-html-template
{{ if (and (or (isset .Params "title") (isset .Params "caption")) (isset .Params "attr")) }}
```

## パイプ {#pipes}

Go テンプレートの最も強力なコンポーネントの 1 つは、アクションを次々に積み重ねることができることです。これはパイプを使うことで実現されます。 Unix のパイプから借りたもので、コンセプトは単純です。つまり、各パイプラインの出力が次のパイプの入力になります。

Go テンプレートの構文は非常に単純であるため、関数呼び出しを連鎖させるにはパイプが不可欠です。 パイプの制限の 1 つは、単一の値しか扱えず、その値が次のパイプラインの最後のパラメータになることです。

いくつかの簡単な例で、パイプの使用方法を説明します。

### 例 1: `shuffle` {#example-1-shuffle}

以下の 2 つの例は、機能的に同じです。

```go-html-template
{{ shuffle (seq 1 5) }}
```

```go-html-template
{{ (seq 1 5) | shuffle }}
```

### 例 2: `index` {#example-2-index}

以下は "disqus_url" というページパラメータにアクセスし、HTML をエスケープしています。この例では、Go テンプレートに組み込まれている [`index` 関数](/functions/index-function/) も使用しています。

```go-html-template
{{ index .Params "disqus_url" | html }}
```

### 例 2: `isset` を持つ `or` {#example-3-or-with-isset}

```go-html-template
{{ if or (or (isset .Params "title") (isset .Params "caption")) (isset .Params "attr") }}
Stuff Here
{{ end }}
```

上記は、以下のように書き換えることができます。

```go-html-template
{{ if isset .Params "caption" | or isset .Params "title" | or isset .Params "attr" }}
Stuff Here
{{ end }}
```

## コンテキスト (別名「ドット」) {#the-dot}

Go テンプレートについて理解する上で最も見落としやすい概念は、 `{{ . }}` が常に **現在のコンテキスト** を参照しているということです。

- テンプレートのトップレベルでは、これが利用可能になったデータセットになります。
- ただし、反復処理の内部では、ループ内の現在のアイテムの値を持つようになります。つまり、`{{ . }}` は、もはやページ全体で利用可能なデータを参照しなくなります。

ループの中からページレベルのデータ (たとえば、フロントマターで設定されたページパラメータ) にアクセスする必要がある場合、おそらく以下のいずれかを実行する必要があります。

### 1. コンテキストに依存しない変数を定義する {#1-define-a-variable-independent-of-context}

以下は、コンテキストに依存しない変数を定義する方法を示しています。

{{< code file="tags-range-with-page-variable.html" >}}
{{ $title := .Site.Title }}
<ul>
{{ range .Params.tags }}
    <li>
        <a href="/tags/{{ . | urlize }}">{{ . }}</a>
        - {{ $title }}
    </li>
{{ end }}
</ul>
{{< /code >}}

{{% note %}}
ループ (つまり `range`) に入った時点で、 `{{ . }}` の値が変化していることに注意してください。 ループの外側で変数 (`{$title}}`) を定義して値を代入しているので、ループの内側からもその値にアクセスできます。
{{% /note %}}

### 2. `$.` を使用してグローバル コンテキストにアクセスする {#2-use-to-access-the-global-context}

`$` は、テンプレートで特別な意味を持ちます。 `$` は、デフォルトで `.` (「ドット」) の開始値に設定されます。 これは [Go text/template の文書化された機能][dotdoc] です。 これは、どこからでもグローバル コンテキストにアクセスできることを意味します。 以下は、前述のコードブロックと同等の例ですが、`$` を使用してグローバル コンテキストから `.Site.Title` を取得しています。

{{< code file="range-through-tags-w-global.html" >}}
<ul>
{{ range .Params.tags }}
  <li>
    <a href="/tags/{{ . | urlize }}">{{ . }}</a>
            - {{ $.Site.Title }}
  </li>
{{ end }}
</ul>
{{< /code >}}

{{% warning "Don't Redefine the Dot" %}}
たとえば、 `{{ $ := .Site }}` のように、誰かがいたずらで特殊文字を再定義してしまうと、 `$` の組み込みマジックは動作しなくなります。*やらないでください。* もちろん、グローバルコンテキストで `{{ $ := . }}` を使って `$` をデフォルト値に戻すことで、このいたずらから回復できます。
{{% /warning %}}

## 空白文字 {#whitespace}

Go 1.6 には、対応する `{{` または `}}` 区切り文字のすぐ横にハイフン (`-`) とスペースを含めることで、Go タグの両側から空白を削除する機能が含まれています。

たとえば、以下の Go テンプレートには、HTML 出力に改行と水平タブが含まれます。

```go-html-template
<div>
  {{ .Title }}
</div>
```

上記のコードは、以下を出力します。

```html
<div>
  Hello, World!
</div>
```

以下の例で `-` を利用すると、`.Title` 変数を囲む余分な空白が削除され、改行も除されます。

```go-html-template
<div>
  {{- .Title -}}
</div>
```

上記のコードは、以下を出力します。

```html
<div>Hello, World!</div>
```

Go は以下の文字を _空白文字_ とみなしています。

* <kbd>スペース</kbd>
* 水平 <kbd>タブ</kbd>
* キャリッジ <kbd>リターン</kbd>
* 改行

## コメント {#comments}

テンプレートを整理し、チーム全体で情報を共有するために、テンプレートにコメントを追加できます。 Hugo でそれを行うには 2 つの方法があります。

### Go テンプレートのコメント {#go-templates-comments}

Go テンプレートは、コメントブロックを開いたり閉じたりするための `{{/*` と `*/}}` をサポートしています。そのブロック内は何もレンダリングされません。

たとえば、

```go-html-template
Bonsoir, {{/* {{ add 0 + 2 }} */}}Eliott.
```

上記のコードは、`Bonsoir, Eliott.` をレンダリングし、コメントブロックのシンタックスエラー (`add 0 + 2`) は気にしません。

### HTML のコメント {#html-comments}

テンプレートから HTML コメントを生成する必要があるなら、[Internet Explorer の条件付きコメント]({{< relref "introduction.md#ie-conditional-comments" >}}) の例を見てみてください。このような HTML コメントを作成するために変数が必要な場合は、 `printf` を `safeHTML` にパイプするだけです。たとえば、以下のコードです。

```go-html-template
{{ printf "<!-- Our website is named: %s -->" .Site.Title | safeHTML }}
```

#### Go テンプレートを含む HTML コメント {#htlml-comments-containing-go-templates}

HTML コメントはデフォルトで削除されますが、その内容は引き続き評価されます。つまり、HTML コメントは最終的な HTML ページにコンテンツをレンダリングすることはありませんが、コメント内に含まれるコードはビルドプロセスで失敗する可能性があります。

{{% note %}}
HTML コメントを使用して Go テンプレートコードをコメントアウトしようと **しないでください**。
{{% /note %}}

```go-html-template
<!-- {{ $author := "Emma Goldman" }} was a great woman. -->
{{ $author }}
```

テンプレートエンジンは HTML コメント内のコンテンツを削除しますが、Go テンプレートコードが存在する場合は最初に評価します。つまり、上記の例では HTML コメントの中で `$author` 変数が評価されるので、`Emma Goldman` がレンダリングされます。しかし、HTML コメント内のコードにエラーがあれば、ビルドは失敗します。

## Hugo パラメータ {#hugo-parameters}

Hugo は、[サイト設定][config] (つまり、サイト全体の値) または特定のコンテンツの各部分のメタデータ (つまり、[フロントマター][front matter]) を介してテンプレート レイヤーに値を渡すオプションを提供します。 [フロントマターのフォーマット]({{< ref "front-matter.md#front-matter-formats" >}}) がサポートしている値であれば、どのようなタイプの値でも定義して、テンプレートで好きなように使用できます。

## コンテンツ (`Page`) パラメータを使用する {#use-content-page-parameters}

個々のコンテンツの [フロントマター][front matter] で、テンプレートで使用する変数を指定できます。

この例は、Hugo ドキュメントで使用されています。 ほとんどのページでは、目次を提供することでメリットが得られますが、目次があまり意味をなさない場合もあります。 フロントマターで `notoc` 変数を定義し、特に `true` に設定されている場合、目次がレンダリングされないようにします。

以下は、（YAML）フロントマターの例です。

```yml
---
title: Roadmap
lastmod: 2017-03-05
date: 2013-11-18
notoc: true
---
```

以下は、`toc.html` [部分テンプレート][partials] の内部で使用できる対応するコードの例です。

{{< code file="layouts/partials/toc.html" download="toc.html" >}}
{{ if not .Params.notoc }}
<aside>
  <header>
    <a href="#{{.Title | urlize}}">
    <h3>{{.Title}}</h3>
    </a>
  </header>
  {{.TableOfContents}}
</aside>
<a href="#" id="toc-toggle"></a>
{{ end }}
{{< /code >}}

特に指定がない限り、ページには目次 (TOC) を含めるという *デフォルト* の動作をさせたいと考えています。このテンプレートは、このページのフロントマターの `notoc:` フィールドが `true` でないことを確認します。

## サイト設定パラメータを使用する {#use-site-configuration-parameters}

[サイト設定ファイル][config] には、必要な数のサイトレベルのパラメータを任意に定義できます。これらのパラメータは、テンプレートでグローバルに使用できます。

たとえば、以下のように宣言します。

{{< code-toggle file="config" >}}
params:
  copyrighthtml: "Copyright &#xA9; 2017 John Doe. All Rights Reserved."
  twitteruser: "spf13"
  sidebarrecentlimit: 5
{{< /code >}}

フッターレイアウト内で、`copyrighthtml` パラメータが指定されている場合にのみレンダリングされる `<footer>` を宣言できます。 提供されている場合は、HTML エンティティが再度エスケープされないように、[`safeHTML` 関数][safehtml] を使用して文字列が安全に使用できることを宣言する必要があります。 これにより、テンプレートを探し回る代わりに、毎年 1 月 1 日にトップレベルの設定ファイルだけを簡単に更新できます。

```go-html-template
{{ if .Site.Params.copyrighthtml }}
    <footer>
        <div class="text-center">{{.Site.Params.CopyrightHTML | safeHTML}}</div>
    </footer>
{{ end }}
```

"`if`" を書いてから同じ値を参照する別の方法として、代わりに [`with`][with] を使う方法があります。 以下のコードは、`with` はそのスコープ内のコンテキスト (`.`) を再バインドし、変数がない場合はブロックをスキップします。

{{< code file="layouts/partials/twitter.html" >}}
{{ with .Site.Params.twitteruser }}
    <div>
        <a href="https://twitter.com/{{.}}" rel="author">
        <img src="/images/twitter.png" width="48" height="48" title="Twitter: {{.}}" alt="Twitter"></a>
    </div>
{{ end }}
{{< /code >}}

最後に、レイアウトから「魔法の定数」を引き出すこともできます。 以下では、[`first`][first] 関数、[`.RelPermalink`][relpermalink] ページ変数、および [`.Site.Pages`][sitevars] サイト変数を使用しています。

```go-html-template
<nav>
  <h1>Recent Posts</h1>
  <ul>
  {{- range first .Site.Params.SidebarRecentLimit .Site.Pages -}}
      <li><a href="{{.RelPermalink}}">{{.Title}}</a></li>
  {{- end -}}
  </ul>
</nav>
```

## 例: 将来のイベントを表示する {#example-show-future-events}

以下のようなコンテンツ構造と [フロントマター][front matter] が与えられた場合:

```text
content/
└── events/
    ├── event-1.md
    ├── event-2.md
    └── event-3.md
```

{{< code-toggle file="content/events/event-1.md" copy="false" >}}
title = 'Event 1'
date = 2021-12-06T10:37:16-08:00
draft = false
start_date = 2021-12-05T09:00:00-08:00
end_date = 2021-12-05T11:00:00-08:00
{{< /code-toggle >}}

以下の [部分テンプレート][partials] は、将来のイベントをレンダリングします。

{{< code file="layouts/partials/future-events.html" >}}
<h2>Future Events</h2>
<ul>
  {{ range where site.RegularPages "Type" "events" }}
    {{ if gt (.Params.start_date | time.AsTime) now }}
      {{ $startDate := .Params.start_date | time.Format ":date_medium" }}
      <li>
        <a href="{{ .RelPermalink }}">{{ .LinkTitle }}</a> - {{ $startDate }}
      </li>
    {{ end }}
  {{ end }}
</ul>
{{< /code >}}

フロントマターを TOML 形式に限定し、日付フィールドを囲む引用符を省略すると、キャストなしで日付比較を行うことができます。

{{< code file="layouts/partials/future-events.html" >}}
<h2>Future Events</h2>
<ul>
  {{ range where (where site.RegularPages "Type" "events") "Params.start_date" "gt" now }}
    {{ $startDate := .Params.start_date | time.Format ":date_medium" }}
    <li>
      <a href="{{ .RelPermalink }}">{{ .LinkTitle }}</a> - {{ $startDate }}
    </li>
  {{ end }}
</ul>
{{< /code >}}

[config]: {{< relref "getting-started/configuration" >}}
[dotdoc]: https://golang.org/pkg/text/template/#hdr-Variables
[first]: {{< relref "functions/first" >}}
[front matter]: {{< relref "content-management/front-matter" >}}
[functions]: {{< relref "functions" >}}
[internal templates]: {{< relref "templates/internal" >}}
[isset]: {{< relref "functions/isset" >}}
[math]: {{< relref "functions/math" >}}
[pagevars]: {{< relref "variables/page" >}}
[param]: {{< relref "functions/param" >}}
[partials]: {{< relref "templates/partials" >}}
[relpermalink]: {{< relref "variables/page#page-variables" >}}
[safehtml]: {{< relref "functions/safehtml" >}}
[sitevars]: {{< relref "variables/site" >}}
[variables]: {{< relref "variables" >}}
[with]: {{< relref "functions/with" >}}
