---
aliases:
- /extras/shortcodes/
categories:
- content management
date: "2017-02-01"
description: ショートコードは、コンテンツファイル内のシンプルなスニペットで、組み込みテンプレートやカスタム テンプレートを呼び出します。
draft: false
keywords:
- markdown
- content
- shortcodes
lastmod: "2019-11-07"
linktitle: null
menu:
  docs:
    parent: content-management
    weight: 100
publishdate: "2017-02-01"
testparam: Hugo Rocks!
title: ショートコード
toc: true
weight: 100
---

## ショートコードとは {#what-a-shortcode-is}

Hugo は、そのシンプルなコンテンツ形式のために Markdown を気に入っていますが、Markdown が不十分な場合もあります。 多くの場合、コンテンツの作成者は生の HTML (たとえば、動画の `<iframe>` タグ) を Markdown コンテンツに追加することを余儀なくされます。 これは、Markdown の構文の美しいシンプルさと矛盾していると思います。

Hugo は、これらの制限を回避するために **ショートコード** を作成しました。

ショートコードとは、事前定義されたテンプレートを使用して Hugo がレンダリングする、コンテンツファイル内の単純なスニペットです。 ショートコードはテンプレートファイルでは動作しないことに注意してください。ショートコードのようなドロップイン機能が必要な場合は、代わりに [パーシャル][Partials] を使用することになるでしょう。

よりきれいな Markdown に加え、ショートコードは新しいクラス、テクニック、標準を反映するためにいつでも更新することができます。サイト生成時に、Hugo ショートコードは簡単に変更をマージさせ、複雑な検索と置換の操作を避けることができます。

## ショートコードを使用する {#use-shortcodes}

{{< youtube 2xkNJL4gJ9E >}}

コンテンツファイル内で、`{%/* shortcodename parameters */%}}` を呼び出すことで、ショートコードを呼び出すことができます。ショートコードのパラメータはスペースで区切られ、内部スペースを含むパラメータは引用符で囲むことができます。

ショートコード宣言の最初の単語は、常にショートコードの名前です。 名前の後にパラメータが続きます。 ショートコードの定義方法に応じて、パラメーターは名前付き、位置指定、またはその両方になりますが、1 回の呼び出しでパラメーターの種類を混在させることはできません。 名前付きパラメーターの形式は、HTML の `name="value"` という書式に倣っています。

ショートコードの中には、終了ショートコードを使用するもの、または終了ショートコードを必要とするものがあります。これも HTML と同様に、開始ショートコードと終了ショートコードは (名前のみ) 一致し、前にスラッシュが追加されます。

ここでは、ペアとなるショートコードの例を 2 つ紹介します。

```go-html-template
{{%/* mdshortcode */%}}Stuff to `process` in the *center*.{{%/* /mdshortcode */%}}
```

```go-html-template
{{</* highlight go */>}} A bunch of code here {{</* /highlight */>}}
```

上記の例では、2 つの異なる区切り文字を使用しています。違いは、最初の `%` 文字と 2 番目の `<>` 文字です。

### 生の文字列パラメータを使用するショートコード {#shortcodes-with-raw-string-parameters}

生の文字列リテラルを使用することで、以下のように、ショートコードに複数の行をパラメータとして渡すことができます。

```go-html-template
{{</*  myshortcode `This is some <b>HTML</b>,
and a new line with a "quoted string".` */>}}
```

### Markdown を使用したショートコード {#shortcodes-with-markdown}

Hugo `0.55` では、`%` 区切り文字の動作を変更しました。 最も外側の区切り文字として `%` を使用するショートコードは、コンテンツ レンダラーに送信されると完全にレンダリングされるようになりました。 これらは、生成された目次や脚注などの一部にすることができます。

旧来の動作をさせたい場合は、ショートコード テンプレートの冒頭に以下の行を追加できます。

```go-html-template
{{ $_hugo_config := `{ "version": 1 }` }}
```

### Markdown を使用しないショートコード {#shortcodes-without-markdown}

文字 `<` は、ショートコードの内部コンテンツがさらなるレンダリングを必要と *しない* ことを示します。 Markdown を使用しないショートコードには、以下のように、しばしば内部の HTML が含まれます。

```go-html-template
{{</* myshortcode */>}}<p>Hello <strong>World!</strong></p>{{</* /myshortcode */>}}
```

### ネストされたショートコード {#nested-shortcodes}

`.Parent` 変数を利用した独自のテンプレートを作成することで、他のショートコードの中にあるショートコードを呼び出すことができます。 `.Parent` を使用すると、ショートコードが呼び出されているコンテキストを確認できます。 詳細は、[「ショートコード テンプレート」][sctemps] を参照してください。

## Hugo の組み込みショートコードを使用する {#use-hugos-built-in-shortcodes}

Hugo には非常に一般的な使用方法を示す、定義済みのショートコード一式が同梱されています。これらのショートコードは作成者の利便性と Markdown コンテンツをきれいに保つために提供されています。

### `figure`

`figure` は Markdown の画像構文の拡張であり、よりセマンティックな [HTML5 `<figure>` 要素][figureelement] の短縮形を提供しません。

`figure` ショートコードでは、以下の名前付きパラメータを使用できます。

src
: 表示する画像の URL です。

link
: 画像をハイパーリンクする必要がある場合、リンク先の URL を指定します。

target
: `link` パラメータが設定されている場合、URL のオプションの `target` 属性を指定します。

rel
: `link` パラメータが設定されている場合、URL のオプションの `rel` 属性を指定します。

alt
: 画像を表示できない場合の画像の代替テキストを指定します。

title
: 画像のタイトルです。

caption
: 画像のキャプションです。` caption` の値内の Markdown がレンダリングされます。

class
: HTML の `figure` タグの `class` 属性を指定します。

height
: 画像の `height` 属性を指定します。

width
: 画像の `width` 属性を指定します。

loading
: 画像の `loading` 属性を指定します。

attr
: 画像の属性テキスト。 `attr` の値内の Markdown がレンダリングされます。

attrlink
: 属性テキストをハイパーリンクする必要がある場合は、リンク先の URL を指定します。

#### `figure` 入力の例 {#example-figure-input}

{{< code file="figure-input-example.md" >}}
{{</* figure src="elephant.jpg" title="An elephant at sunset" */>}}
{{< /code >}}

#### `figure` 出力の例 {#example-figure-output}

```html
<figure>
 <img src="elephant.jpg">
  <figcaption>An elephant at sunset</figcaption>
</figure>
```

### `gist`

この URL で GitHub [gist] を表示するには、以下のようにします。

[gist]: https://docs.github.com/en/get-started/writing-on-github/editing-and-sharing-content-with-gists

```text
https://gist.github.com/user/50a7482715eac222e230d1e64dd9a89b
```

以下のコードをマークダウンに含めます。

```text
{{</* gist user 50a7482715eac222e230d1e64dd9a89b */>}}
```

これにより、gist 内のすべてのファイルがファイル名のアルファベット順に表示されます。

{{< gist jmooring 50a7482715eac222e230d1e64dd9a89b >}}

gist 内の特定のファイルを表示するには、以下のようにします。

```text
{{</* gist user 50a7482715eac222e230d1e64dd9a89b 1-template.html */>}}
```

上記のコードは、以下のようにレンダリングされます。

{{< gist jmooring 50a7482715eac222e230d1e64dd9a89b 1-template.html >}}

### `highlight`

ハイライトされたコードサンプルを表示するには、以下のようにします。

```text
{{</* highlight go-html-template */>}}
{{ range .Pages }}
  <h2><a href="{{ .RelPermalink }}">{{ .LinkTitle }}</a></h2>
{{ end }}
{{</* /highlight */>}}
```

上記のコードは、以下のようにレンダリングされます。

{{< highlight go-html-template >}}
{{ range .Pages }}
  <h2><a href="{{ .RelPermalink }}">{{ .LinkTitle }}</a></h2>
{{ end }}
{{< /highlight >}}

1つ以上の [ハイライト表示オプション][highlighting options] を指定するには、引用符で囲んだカンマ区切りのリストを以下のように含めます。

[highlighting options]: /functions/highlight/

```text
{{</* highlight go-html-template "lineNos=inline, lineNoStart=42" */>}}
{{ range .Pages }}
  <h2><a href="{{ .RelPermalink }}">{{ .LinkTitle }}</a></h2>
{{ end }}
{{</* /highlight */>}}
```

上記のコードは、以下のようにレンダリングされます。

{{< highlight go-html-template "lineNos=inline, lineNoStart=42" >}}
{{ range .Pages }}
  <h2><a href="{{ .RelPermalink }}">{{ .LinkTitle }}</a></h2>
{{ end }}
{{< /highlight >}}

### `instagram`

`instagram` ショートコードは Facebook の **oEmbed Read** 機能を使用しています。
Facebook の [開発者向けドキュメント][developer documentation] には、以下のように書かれています。

- この許可または機能は、アプリがライブデータにアクセスできるようになる前に、App Review プロセスを正常に完了する必要があります。 [もっと詳しく知る][Learn More]
- この権限または機能は、ビジネス認証を行った場合にのみ利用可能です。 アプリがデータにアクセスできるようになる前に、追加の契約に署名する必要がある場合もあります。 [詳細はこちら][Learn More Here]

[developer documentation]: https://developers.facebook.com/docs/features-reference/oembed-read
[Learn More]: https://developers.facebook.com/docs/app-review
[Learn More Here]: https://developers.facebook.com/docs/development/release/business-verification

`instagram` ショートコードを使用するには、アクセストークンを取得する必要があります。

サイト構成がプライベートの場合は、以下のようにします。

{{< code-toggle file="hugo" copy=false >}}
[services.instagram]
accessToken = 'xxx'
{{< /code-toggle >}}

サイト構成が非公開 _でない_ 場合は、以下のように環境変数でアクセストークンを設定します。

```text
HUGO_SERVICES_INSTAGRAM_ACCESSTOKEN=xxx hugo --gc --minify
```

{{% note %}}
クライアント アクセストークンを使用している場合は、パイプ記号 (`APPID|ACCESSTOKEN`) を使用して、アクセストークンとアプリ ID を結合する必要があります。
{{% /note %}}

以下の URL のインスタグラム投稿を表示するには、

```text
https://www.instagram.com/p/BWNjjyYFxVx/
```

以下のコードを Markdown に含めます。

```text
{{</* instagram BWNjjyYFxVx */>}}
```

### `param`

サイトパラメータ値へのフォールバックを使用して、フロントマターに設定されている現在の `Page's` パラメータから値を取得します。指定されたキーを持つパラメータがどちらにも見つからなかった場合は、 `ERROR` がログに記録されます。

```bash
{{</* param testparam */>}}
```

`testparam` はこのページのフロントマターで定義されたパラメータで、値は `Hugo Rocks!` なので、上記は以下のように表示されます。

{{< param testparam >}}

深くネストされたパラメータにアクセスするには、「ドット構文」を使用します。たとえば、以下の通りです。

```bash
{{</* param "my.nested.param" */>}}
```

### `ref` と `relref`

これらのショートコードは、相対パス (たとえば、 `blog/post.md`) または論理名 (`post.md`) でページを検索し、見つかったページのパーマリンク (`ref`) または相対パーマリンク (`relref`) を返します。

また、`ref` と `relref` は、Hugo によって生成されたヘッダーリンクに対して機能する断片的なリンクを作成することも可能にします。

{{% note %}}
[クロスリファレンス](/content-management/cross-references/) のドキュメントで、 `ref` と `relref` のより詳細な説明を読むことができます。
{{% /note %}}

`ref` と `relref` は、引用符で囲まれた `0` 位置にある _reference_ のパラメータを正確に 1 つだけ受け取ります。

#### `ref` と `relref` 入力の例 {#example-ref-and-relref-input}

```go-html-template
[Neat]({{</* ref "blog/neat.md" */>}})
[Who]({{</* relref "about.md#who" */>}})
```

#### `ref` と `relref` 出力の例 {#example-ref-and-relref-output}

標準の Hugo のプリティー URL がオンになっていると仮定します。

```html
<a href="https://example.com/blog/neat">Neat</a>
<a href="/about/#who">Who</a>
```

### `tweet`

以下の URL の Twitter 投稿を表示するには、

```txt
https://twitter.com/SanDiegoZoo/status/1453110110599868418
```

以下のコードを Markdown に含めます。

```text
{{</* tweet user="SanDiegoZoo" id="1453110110599868418" */>}}
```

上記のコードは、以下のようにレンダリングされます。

{{< tweet user="SanDiegoZoo" id="1453110110599868418" >}}

### `vimeo`

以下の URL の [Vimeo] ビデオを表示するには、

```text
https://vimeo.com/channels/staffpicks/55073825
```

以下のコードを Markdown に含めます。

```text
{{</* vimeo 55073825 */>}}
```

上記のコードは、以下のようにレンダリングされます。

{{< vimeo 55073825 >}}

{{% note %}}
YouTube や Vimeo 出力のビジュアルスタイルをさらにカスタマイズしたい場合は、ショートコードを呼び出す際に `class` という名前のパラメータを追加してください。
新しい `class` は `<iframe>` をラップする `<div>` に追加され、*かつ* インラインスタイルを削除します。 `id` も名前付きパラメータとして呼び出す必要があることに注意してください。
また、`title` で Vsimeo 動画に説明的なタイトルを付けることができます。

```go
{{</* vimeo id="146022717" class="my-vimeo-wrapper-class" title="My vimeo video" */>}}
```
{{% /note %}}

### `youtube`

`youtube` ショートコードは、[YouTube 動画][YouTube videos] のレスポンシブな動画プレーヤーを埋め込みます。 このとき、動画の ID のみが必要で、たとえば、以下のようになります。

```txt
https://www.youtube.com/watch?v=w7Ft2ymGmfc
```

#### `youtube` 入力の例 {#example-youtube-input}

動画の URL の `v=` に続く YouTube 動画 ID をコピーして、`youtube` ショートコードに渡します。

{{< code file="example-youtube-input.md" >}}
{{</* youtube w7Ft2ymGmfc */>}}
{{< /code >}}

さらに、`autoplay` パラメータを `true` に設定することで、埋め込まれた動画の再生を自動的に開始させることができます。
名前付きのパラメータと名前なしのパラメータを混在させることはできないので、まだ名前のない動画 ID をパラメータ `id` に代入する必要があることを覚えておいてください。


{{< code file="example-youtube-input-with-autoplay.md" >}}
{{</* youtube id="w7Ft2ymGmfc" autoplay="true" */>}}
{{< /code >}}

[アクセシビリティ上の理由](https://dequeuniversity.com/tips/provide-iframe-titles) により、YouTube 動画にタイトルを付けることが推奨されます。 ショートコードで `title` パラメータを指定することで、これを行うことができます。タイトルを指定しない場合、デフォルトで "YouTube Video" が使用されます。

{{< code file="example-youtube-input-with-title.md" >}}
{{</* youtube id="w7Ft2ymGmfc" title="A New Hugo Site in Under Two Minutes" */>}}
{{< /code >}}

#### `youtube` 出力の例 {#example-youtube-output}

前述の `youtube` の例では、レンダリングされた Web サイトのマークアップに以下の HTML が追加されます。

{{< code file="example-youtube-output.html" >}}
{{< youtube id="w7Ft2ymGmfc" autoplay="true" >}}
{{< /code >}}

#### `youtube` 表示の例 {#example-youtube-display}

前述の `youtube` の例 (`autoplay="true"` なし) を使用して、Web サイトの訪問者に表示される体験をシミュレートすると以下のようになります。もちろん、最終的な表示内容はスタイルシートや周辺のマークアップに依存します。この動画は、[Hugo ドキュメントのクイックスタート][quickstart] にも収録されています。

{{< youtube w7Ft2ymGmfc >}}

## プライバシー設定 {#privacy-config}

EU の新しいプライバシー規制を満たすために Hugo サイトを設定する方法については、[「Hugo と GDPR」][Hugo and the GDPR] を参照してください。

## カスタムショートコードを作成する {#create-custom-shortcodes}

カスタム ショートコードの作成についての詳細は、[「ショートコード テンプレート」のドキュメント][shortcode template documentation] を参照してください。

[`figure` shortcode]: #figure
[contentmanagementsection]: /content-management/formats/
[examplegist]: https://gist.github.com/spf13/7896402
[figureelement]: https://html5doctor.com/the-figure-figcaption-elements/ "An article from HTML5 doctor discussing the fig and figcaption elements."
[Hugo and the GDPR]: /about/hugo-and-gdpr/
[Instagram]: https://www.instagram.com/
[pagevariables]: /variables/page/
[partials]: /templates/partials/
[quickstart]: /getting-started/quick-start/
[sctemps]: /templates/shortcode-templates/
[scvars]: /variables/shortcodes/
[shortcode template documentation]: /templates/shortcode-templates/
[templatessection]: /templates/
[Vimeo]: https://vimeo.com/
[YouTube Videos]: https://www.youtube.com/
[YouTube Input shortcode]: #youtube
