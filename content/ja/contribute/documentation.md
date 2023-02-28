---
aliases:
- /contribute/docs/
categories:
- contribute
date: "2017-02-01"
description: ドキュメントは、どんなオープンソース プロジェクトでも必要不可欠な部分です。 Hugo のドキュメントは、それがカバーしようとするソースと同様に、進行中の作業です。
draft: false
keywords:
- docs
- documentation
- community
- contribute
linktitle: ドキュメント作成
menu:
  docs:
    parent: contribute
    weight: 20
publishdate: "2017-02-01"
sections_weight: 20
title: Hugo ドキュメントに貢献する
toc: true
weight: 20
---

## フォークを作成する {#create-your-fork}

Hugo ドキュメントをあなたのローカルマシンで変更し、一貫したビジュアル スタイルをチェックするのがベストです。GitHub で [hugoDocs](https://github.com/gohugoio/hugoDocs) のフォークを作成し、そのリポジトリをあなたのマシンのローカルにクローンしていることを確認してください。より詳しい情報は、[GitHub's documentation on "forking"][ghforking] や [Hugo's development contribution guide][hugodev] を参照してください。

その後、追加用に別のブランチを作成できます。 コンテンツの種類に最も適したわかりやすいブランチ名を選択してください。 以下は、ショーケースに新しい Web サイトを追加するために使用できるブランチ名の例です。

```bash
git checkout -b jon-doe-showcase-addition
```

## 新しいコンテンツを追加する {#add-new-content}

Hugo のドキュメントでは、Hugo の [アーキタイプ] [archetypes] 機能を多用しています。 Hugo ドキュメントのすべてのコンテンツ セクションには、アーキタイプが割り当てられています。

Hugo ドキュメントへの新しいコンテンツの追加は、以下のコマンドを用い、コンテンツ セクションに関係なく、同じパターンに従います。

```bash
hugo new <DOCS-SECTION>/<new-content-lowercase>.md
```

### 新しい関数を追加する {#add-a-new-function}

Hugo リポジトリをクローンしたら、以下のコマンドで新しい関数を作成できます。ファイル名は小文字のままにしてください。

```bash
hugo new functions/newfunction.md
```

Hugo のドキュメントによると、`functions`のアーキタイプは以下の通りです。

{{< code file="archetypes/functions.md" >}}
{{< readfile file="/archetypes/functions.md">}}
{{< /code >}}

#### 新しい関数に必須のフィールド {#new-function-required-fields}

ここでは、`hugo new functions/*` を使って自動生成されたフロントマターのフィールドをレビューします。

***`title`***
: これは、`hugo new` ジェネレーターを使用すると、すべて小文字で自動入力されます。

***`linktitle`***
: 関数の実際のケーシング (たとえば、`replacere` ではなく `replaceRE`) を指定します。

***`description`***
: [関数のクイックリファレンス](/functions/) に入力するための簡単な説明です。

`categories`
: 現在、将来性と移植性の理由から `functions` が自動入力されています。ですから、このフィールドは無視してください。

`tags`
: エンドユーザーが他の関連機能を見つけるのに役立つと思われる場合のみ指定します。

`signature`
: これは、関数を呼び出すためのシグネチャ/構文定義です (たとえば、`apply SEQUENCE FUNCTION [PARAM...]`)。

`workson`
: 使用できる値は、 `lists`、`taxonomies`、`terms`、`groups`、 そして `files` です。

`hugoversion`
: この新しい機能が搭載される予定の Hugo のバージョンです。

`relatedfuncs`
: 他の Hugo ユーザーを助けるために、あなたの新しい関数に関連すると思われる他の [テンプレート関数][templating functions] を指定します。

`{{.Content}}`
: 新しい機能の詳細な説明です。 例は歓迎されるだけでなく、奨励されます。

関数の本文では、フロントマターで使用されている短い説明を展開してください。できるだけ多くの例を含めて、Hugo のドキュメント [`code` ショートコード](#add-code-blocks) を活用してください。もし、例を追加することができないが、Hugo コミュニティから助けを求めたい場合は、フロントマターに `needsexample: true` を追加してください。

## コードブロックを追加する {#add-code-blocks}

コードブロックは、Hugo ドキュメントのエンドユーザーに Hugo の新機能の例を提供するために重要です。 可能な限り、Hugo ユーザーが自分のプロジェクトで実装できると思われる例を作成してください。

### 標準的な構文 {#standard-syntax}

Hugo ドキュメントの多くのページで、典型的なトリプルバックティックの Markdown 構文 (```` ``` ````) が使用されています。 以下のコードブロックのショートコードを実装するために余分な時間をかけたくない場合は、標準の [GitHub-flavored Markdown][gfm] を使用してください。 

````txt
```go-html-template
{{ range site.RegularPages }}
  <h2><a href="{{ .RelPermalink }}">{{ .LinkTitle }}</a></h2>
{{ end }}
```
````


### コードブロックのショートコード {#code-block-shortcode}

Hugo のドキュメントには、インタラクティブなコードブロックを追加するための非常に堅牢なショートコードが付属しています。

{{% note %}}
`code` ショートコードでは、*トリプル バックティックと言語宣言を含める必要があります*。 これは、ショートコードのラッパーをレガシーなドキュメントに簡単に追加できるようにするための設計で、将来のバージョンの Hugo ドキュメントで必要になった場合に削除しやすくなるようにするためです。
{{% /note %}}

### `code`

`code` は、最も頻繁に使用する Hugo ドキュメントのショートコードです。 `code` には、`file` という名前付きパラメータが 1 つだけ必要です。 パターンは、以下のとおりです。

```go-html-template
{{%/* code file="smart/file/name/with/path.html" download="download.html" copy="true" */%}}
A whole bunch of coding going on up in here!
{{%/* /code */%}}
```

以下は、`code` に渡される引数です。

***`file`***
: 唯一の *必須* 引数です。 `file` はスタイリングのために必要ですが、ユーザーが Hugo のディレクトリ構造に関するメンタルモデルを作成するのを助けるという重要な役割も担っています。視覚的には、これはコードブロックの左上にテキストとして表示されます。

`download`
: 省略した場合、レンダリングされたショートコードには影響しません。 `download` に値が追加されると、コードブロックのダウンロード可能なバージョンのファイル名として使用されます。

`copy`
: すべての `code` ショートコードには、[Copy (コピー)] ボタンが自動的に追加されます。 `code` のファイル名とスタイルはそのままに、読者にコードのコピーを促したくない場合 (たとえば、チュートリアルの "Do not do" スニペット) は、`copy="false"` を使用します。

#### 'code' の入力例 {#example-code-input}

この HTML コードブロックの例では、Hugo のユーザーに以下のことを伝えます。

1. このファイルは、`file` の値として `layouts/_default/single.html` で示されるように、`layouts/_default` に *存在する可能性があります*。
2. このスニペットは、`download="single.html"` で示されているように、ダウンロードして Hugo プロジェクトに実装するのに十分な完成度を持っています。

```go-html-template
{{</* code file="layouts/_default/single.html" download="single.html" */>}}
{{ define "main" }}
<main>
    <article>
        <header>
            <h1>{{.Title}}</h1>
            {{with .Params.subtitle}}
            <span>{{.}}</span>
        </header>
        <div>
            {{.Content}}
        </div>
        <aside>
            {{.TableOfContents}}
        </aside>
    </article>
</main>
{{ end }}
{{</* /code */>}}
```

##### 'code' の表示例 {#example-code-display}

この例の出力は、Hugo のドキュメントで以下のようにレンダリングされます。

{{< code file="layouts/_default/single.html" download="single.html" >}}
{{ define "main" }}
<main>
    <article>
        <header>
            <h1>{{.Title}}</h1>
            {{with .Params.subtitle}}
            <span>{{.}}</span>
        </header>
        <div>
            {{.Content}}
        </div>
        <aside>
            {{.TableOfContents}}
        </aside>
    </article>
</main>
{{ end }}
{{< /code >}}

<!-- #### Output Code Block

The `output` shortcode is almost identical to the `code` shortcode but only takes and requires `file`. The purpose of `output` is to show *rendered* HTML and therefore almost always follows another basic code block *or* and instance of the `code` shortcode:

```
{{%/* output file="posts/my-first-post/index.html" */%}}
<h1>This is my First Hugo Blog Post</h1>
<p>I am excited to be using Hugo.</p>
{{%/* /output */%}}
```

The preceding `output` example will render as follows to the Hugo docs:

{{< output file="posts/my-first-post/index.html" >}}
<h1>This is my First Hugo Blog Post</h1>
<p>I am excited to be using Hugo.</p>
{{< /output >}} -->

## ブロック引用 {#blockquotes}

ブロック引用は、[典型的な Markdown ブロック引用構文][bqsyntax] を使用して Hugo ドキュメントに追加できます。

```md
> Without the threat of punishment, there is no joy in flight.
```

上記のブロック引用は、Hugo ドキュメントで以下のようにレンダリングされます。

> Without the threat of punishment, there is no joy in flight.

ただし、メインのブロック引用と、両側に 1 つの半角スペースで囲んだ引用をハイフンで区切ることにより、すばやく簡単に `<cite>` 要素を追加できます (クライアント側で JavaScript によって追加されます)。

```md
> Without the threat of punishment, there is no joy in flight. - [Kobo Abe](https://en.wikipedia.org/wiki/Kobo_Abe)
```

上記のコードは、Hugo のドキュメントでは以下のようにレンダリングされます。

> Without the threat of punishment, there is no joy in flight. - [Kobo Abe][abe]

{{% note "Blockquotes `!=` Admonitions" %}}
Hugo ドキュメントの以前のバージョンでは、テキストに注意を引くためにブロック引用を使用していました。 これは、 [`<blockquote>` の意図された意味的使用方法](https://html5doctor.com/cite-and-blockquote-reloaded/) *ではありません*。 引用するときは、ブロック引用を使用してください。 ユーザーに特定の情報を通知または警告するには、以下の admonition ショートコードを使用します。
{{% /note %}}

## Admonition {#admonitions}

技術文書では、**Admonition** [^1] がよく使われます。最もポピュラーなのは、[reStructuredText ディレクティブ][sourceforge] に見られるものです。 以下は、SourceForge のドキュメントからの引用です。

> Admonition は特別にマークされた「トピック」であり、通常の body 要素が表示される場所ならどこにでも表示できます。 任意の body 要素が含まれています。 通常、Admonition はドキュメント内のオフセット ブロックとしてレンダリングされ、場合によってはアウトラインまたは陰影が付けられ、タイトルは Admonition のタイプと一致します。 - [SourceForge][sourceforge]

Hugo のドキュメントには、`note`、`tip`、`warning` という 3 つの Admonition が含まれています。

### `note` admonition

情報にさりげなく注目を集めたい場合は、 `note` ショートコードを使用します。 `note` は `warning` よりも、コンテンツの邪魔をしないように意図されています。

#### `note` の入力例 {#example-note-input}

{{< code file="note-with-heading.md" >}}
{{%/* note */%}}
Here is a piece of information I would like to draw your **attention** to.
{{%/* /note */%}}
{{< /code >}}

#### `note` の出力例 {#example-note-output}

{{< output file="note-with-heading.html" >}}
{{% note %}}
Here is a piece of information I would like to draw your **attention** to.
{{% /note %}}
{{< /output >}}

#### `note` の表示例 {#example-note-display}

{{% note %}}
Here is a piece of information I would like to draw your **attention** to.
{{% /note %}}

### `tip` admonition

読者にアドバイスをしたい場合は、`tip` ショートコードを使用します。 `tip` は `note` と同様に、 `warning` よりもコンテンツの邪魔にならないように意図されています。

#### `tip` の入力例 {#example-tip-input}

{{< code file="using-tip.md" >}}
{{%/* tip */%}}
Here's a bit of advice to improve your productivity with Hugo.
{{%/* /tip */%}}
{{< /code >}}

#### `tip` の出力例 {#example-tip-output}

{{< output file="tip-output.html" >}}
{{% tip %}}
Here's a bit of advice to improve your productivity with Hugo.
{{% /tip %}}
{{< /output >}}

#### `tip` の表示例 {#example-tip-display}

{{% tip %}}
Here's a bit of advice to improve your productivity with Hugo.
{{% /tip %}}

### `warning` admonition

重要なことにユーザーの注意を引きたい場合は、`warning` ショートコードを使用します。 良い使用例としは、Hugo のバージョンアップによる変更点、既知のバグ、テンプレートの「落とし穴」を明確にすることが挙げられます。

#### `warning` の入力例 {#example-warning-input}

{{< code file="warning-admonition-input.md" >}}
{{%/* warning */%}}
This is a warning, which should be reserved for *important* information like breaking changes.
{{%/* /warning */%}}
{{< /code >}}

#### `warning` の出力例 {#example-warning-output}

{{< output file="warning-admonition-output.html" >}}
{{% warning %}}
This is a warning, which should be reserved for *important* information like breaking changes.
{{% /warning %}}
{{< /output >}}

#### `warning` の表示例 {#example-warning-display}

{{% warning %}}
これは警告であり、重大な変更点などの *重要な* 情報にのみ使用されるべきものです。
{{% /warning %}}

{{% note "Pull Requests and Branches" %}}
[「Hugo の開発に貢献する」](/contribute/development/) と同様に、Hugo チームはあなたが Hugo ドキュメントに貢献する際に、別のブランチ/フォークを作成することを期待しています。
{{% /note %}}


## 訳注

[^1]: Admonition には適切な訳がつけられていないため、そのまま原語 (英語) を記載していますが、意味は、Qiita の [「Markdown 記法 チートシート」](https://qiita.com/Qiita/items/c686397e4a0f4f11683d) における、[Note - 補足説明](https://qiita.com/Qiita/items/c686397e4a0f4f11683d#note---%E8%A3%9C%E8%B6%B3%E8%AA%AC%E6%98%8E) と同じです。



[abe]: https://en.wikipedia.org/wiki/Kobo_Abe
[archetypes]: /content-management/archetypes/
[bqsyntax]: https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet#blockquotes
[charcount]: https://www.lettercount.com/
[`docs/static/images/showcase/`]: https://github.com/gohugoio/hugo/tree/master/docs/static/images/showcase/
[gfm]: https://github.blog/2017-03-14-a-formal-spec-for-github-markdown/
[ghforking]: https://help.github.com/articles/fork-a-repo/
[hugodev]: /contribute/development/
[shortcodeparams]: content-management/shortcodes/#shortcodes-without-markdown
[sourceforge]: https://docutils.sourceforge.io/docs/ref/rst/directives.html#admonitions
[templating function]: /functions/
