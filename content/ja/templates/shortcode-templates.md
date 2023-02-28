---
aliases: []
categories:
- templates
date: "2017-02-01"
description: シングルページやリストページと同じテンプレート構文を使用して独自のショートコードを作成することで、Hugo の組み込みショートコードを拡張できます。
draft: false
keywords:
- shortcodes
- templates
lastmod: "2017-02-01"
linktitle: ショートコード テンプレート
menu:
  docs:
    parent: templates
    weight: 100
publishdate: "2017-02-01"
sections_weight: 100
title: 独自のショートコードを作成する
toc: true
weight: 100
---

ショートコードは、テンプレートを小さく再利用可能なスニペットに統合し、コンテンツ内に直接埋め込むことができる手段です。この意味で、ショートコードは、[ページとリストのテンプレート][templates] と [基本コンテンツファイル][basic content files] の仲介物と考えることができます。

{{% note %}}
Hugo には、一般的な使用例に対応した組み込みのショートコードも用意されています。 (詳細は [コンテンツ管理: ショートコード](/content-management/shortcodes/) を参照してください)。 
{{% /note %}}

## カスタム ショートコードを作成する {#create-custom-shortcodes}

Hugo の組み込みショートコードは、多くの一般的な使用例をカバーしていますが、すべての使用例ではありません。 幸いなことに、Hugo には、Web サイトのニーズを満たすカスタム ショートコードを簡単に作成する機能があります。

{{< youtube Eu4zSaKOY4A >}}

### ファイルの場所 {#file-location}

ショートコードを作成するには、[ソース構成][source organization] の `layouts/shortcodes` ディレクトリに HTML テンプレートを配置します。 ショートコードの名前は、拡張子 `.html` を除いたファイルの名前と同じになるので、ファイル名には十分注意してください。 たとえば、`layouts/shortcodes/myshortcode.html` は、あなたが選んだパラメータの種類に応じて、`{{</* myshortcode /*/>}}` または `{%/* myshortcode /*/%}}` で呼び出されます。

ショートコードは、サブフォルダー (たとえば、`layouts/shortcodes/boxes`) に整理することができます。これらのショートコードは、相対パスでアクセスできます。

```go-html-template
{{</* boxes/square */>}}
```

フォワードスラッシュ (`/`) に注意してください。

### ショートコード テンプレートの検索順序 {#shortcode-template-lookup-order}

ショートコード テンプレートには、以下のような、シンプルな [検索順序][lookup order] があります。

1. `/layouts/shortcodes/<SHORTCODE>.html`
2. `/themes/<THEME>/layouts/shortcodes/<SHORTCODE>.html`

### 位置指定パラメータと名前付きパラメータ {#positional-vs-named-parameters}

以下の種類のパラメータを使用して、ショートコードを作成できます。

* 位置指定パラメータ
* 名前付きパラメータ
* 位置指定パラメータ *または* 名前付きパラメータ (つまり、「柔軟な」)

位置指定パラメータを持つショートコードでは、パラメータの順序が重要です。 ショートコードに必要な値が 1 つしかない場合 (たとえば、以下の `youtube` ショートコード)、位置指定パラメータは非常にうまく機能し、コンテンツ作成者の入力作業を軽減することができます。

複数のパラメータまたはオプションのパラメータを使用する、より複雑なレイアウトの場合、名前付きパラメータが最適に機能します。 簡潔ではありませんが、名前付きパラメータはコンテンツ作成者が記憶する必要が少なく、任意の順序でショートコード宣言に追加できます。

両方のタイプのパラメータを許可する (つまり、「柔軟な」ショートコード) と、ユーザーが簡単にオーバーライドできるデフォルト値を設定したい複雑なレイアウトに役立ちます。

### パラメータにアクセスする {#access-parameters}

すべてのショートコード パラメータは、 `.Get` メソッドでアクセスできます。`.Get` メソッドにキー (つまり文字列) と数値のどちらを渡すかは、それぞれ名前付きパラメータと位置指定パラメータのどちらにアクセスするかによって異なります。

名前でパラメーターにアクセスするには、以下のように、その後に名前付きパラメータを引用符で囲んだ文字列を付けた `.Get` メソッドを使用します。

```go-html-template
{{ .Get "class" }}
```

位置でパラメータにアクセスするには、`.Get` に続けて数値位置を使用します。位置指定パラメータのインデックスは、以下のようにゼロインデックスになることに注意してください。

```go-html-template
{{ .Get 0 }}
```

2 番目の位置のためには、以下のように使用します。

```go-html-template
{{ .Get 1 }}
```

`with` は、以下のように、出力が設定されたパラメータに依存する場合に最適です。

```go-html-template
{{ with .Get "class" }} class="{{ . }}"{{ end }}
```

`.Get` は、パラメータが提供されているかどうかを確認するためにも使用できます。これは、以下のように、条件がどちらかの値、または両方に依存している場合に最も役に立ちます。

```go-html-template
{{ if or (.Get "title") (.Get "alt") }} alt="{{ with .Get "alt" }}{{ . }}{{ else }}{{ .Get "title" }}{{ end }}"{{ end }}
```

#### `.Inner`

終了ショートコードが使用されている場合、`.Inner` 変数には、開始ショートコードと終了ショートコードの間のコンテンツが入力されます。 終了ショートコードが必要な場合は、その存在の指標として `.Inner` の長さを確認できます。

`.Inner` 変数によって宣言されたコンテンツを持つショートコードは、自己終了構文 (self-closing syntax) を使用することによって、コンテンツなし、終了なしで宣言することもできます。

```go-html-template
{{</* innershortcode /*/>}}
```

{{% warning %}}
`.Inner` を参照するすべてのショートコードは、クローズドまたはセルフクローズドである必要があります。

{{% /warning %}}

#### `.Params`

ショートコードの `.Params` 変数には、より複雑な使用例のためにショートコードに渡されるリストパラメータが含まれています。 以下のロジックを使用して、よりスコープの広いパラメータにアクセスすることもできます。

`$.Params`
: これらは、ショートコード宣言に直接渡されるパラメータです (たとえば、YouTube ビデオ ID など)。

`$.Page.Params`
: ページのパラメーターを参照します。 この場合の「ページ」は、ショートコードが宣言されているコンテンツファイルを指します (たとえば、コンテンツのフロントマターの `shortcode_color` フィールドは、`$.Page.Params.shortcode_color` でアクセスできます)。

`$.Page.Site.Params`
: [サイトの設定ファイル][config] で定義されているグローバル変数を参照します。

#### `.IsNamedParams`

`.IsNamedParams` 変数は、ショートコード宣言が名前付きパラメータを使用しているかどうかをチェックし、ブール値を返します。

たとえば、コンテンツの作成者の好みに応じて、 `src` という名前のパラメータまたは最初の位置指定パラメータのいずれかを取ることができる `image` ショートコードを作成できます。 ここでは、 `image` ショートコードを以下のように呼び出すと仮定します。

```go-html-template
{{</* image src="images/my-image.jpg" */>}}
```

次に、ショートコード テンプレートの一部として以下を含めることができます。

```go-html-template
{{ if .IsNamedParams }}
<img src="{{ .Get "src" }}" alt="">
{{ else }}
<img src="{{ .Get 0 }}" alt="">
{{ end }}
```

`.IsNamedParams` の動作については、以下の [Vimeo ショートコードの例][vimeoexample] を参照してください。

{{% warning %}}
位置指定パラメータと名前付きパラメータの両方を受け付けるショートコード テンプレートを作成することはできますが、パラメータタイプが混在するコンテンツでショートコードを宣言することは *できません*。したがって、`{{</* image src="images/my-image.jpg" "This is my alt text" */>}}` のように宣言されたショートコードは、エラーを返します。
{{% /warning %}}

また、`.Page` 変数を使用して、通常のすべての [ページ変数][pagevars] にアクセスすることもできます。

ショートコードはネストすることもできます。 ネストされたショートコードでは、[`.Parent` 変数][shortcodesvars] を使用して親ショートコード コンテキストにアクセスできます。 これは、ルートから共通のショートコード パラメータを継承するために非常に便利です。

### 存在を確認する {#checking-for-existence}

あるページで特定のショートコードが使用されているかどうかを確認するには、そのページのテンプレートで `.HasShortcode` を呼び出し、ショートコードの名前を指定します。これは、そのショートコードによってのみ使用される特定のスクリプトまたはスタイルをヘッダーに含めたい場合に便利です。

## カスタム ショートコードの例 {#custom-shortcode-examples}

以下は、`/layouts/shortcodes` にあるショートコード テンプレートファイルで作成できる、さまざまなタイプのショートコードの例です。

### 単一語の例: `year` {#singleword-example-year}

Markdown を継続的に確認することなく、コンテンツファイル内の著作権年に関する記述を最新の状態に保ちたいと仮定してみます。あなたの目標は、以下のようにショートコードを呼び出すことができるようにすることです。

```go-html-template
{{</* year */>}}
```

{{< code file="/layouts/shortcodes/year.html" >}}
{{ now.Format "2006" }}
{{< /code >}}

### 単一の位置の例: `youtube` {#single-positional-example-youtube}

埋め込み動画は Markdown コンテンツによくされるものですが、すぐに見苦しくなってしまいます。以下は、[Hugo の組み込み YouTube ショートコード][youtubeshortcode] で使用されるコードです。

```go-html-template
{{</* youtube 09jf3ow9jfw */>}}
```

上記のコードは、以下のように、 `/layouts/shortcodes/youtube.html` にあるテンプレートをロードします。

{{< code file="/layouts/shortcodes/youtube.html" >}}
<div class="embed video-player">
<iframe class="youtube-player" type="text/html" width="640" height="385" src="https://www.youtube.com/embed/{{ index .Params 0 }}" allowfullscreen frameborder="0">
</iframe>
</div>
{{< /code >}}

{{< code file="youtube-embed.html" copy="false" >}}
<div class="embed video-player">
    <iframe class="youtube-player" type="text/html"
        width="640" height="385"
        src="https://www.youtube.com/embed/09jf3ow9jfw"
        allowfullscreen frameborder="0">
    </iframe>
</div>
{{< /code >}}

### 単一の名前付きの例: `image` {#single-named-example-image}

Hugo の組み込みの [`figure` ショートコード][figure] を使用するのではなく、独自の `img` ショートコードを作成したいとします。 目標は、コンテンツファイルで以下のようにショートコードを呼び出せるようにすることです。

{{< code file="content-image.md" >}}
{{</* img src="/media/spf13.jpg" title="Steve Francia" */>}}
{{< /code >}}

`/layouts/shortcodes/img.html` にショートコードを作成し、以下のように、ショートコード テンプレートをロードするようにしましました。

{{< code file="/layouts/shortcodes/img.html" >}}
<!-- image -->
<figure {{ with .Get "class" }}class="{{.}}"{{ end }}>
    {{ with .Get "link" }}<a href="{{ . }}">{{ end }}
        <img src="{{ .Get "src" }}" {{ if or (.Get "alt") (.Get "caption") }}alt="{{ with .Get "alt" }}{{ . }}{{ else }}{{ .Get "caption" }}{{ end }}"{{ end }} />
    {{ if .Get "link" }}</a>{{ end }}
    {{ if or (or (.Get "title") (.Get "caption")) (.Get "attr") }}
    <figcaption>{{ if isset .Params "title" }}
        <h4>{{ .Get "title" }}</h4>{{ end }}
        {{ if or (.Get "caption") (.Get "attr") }}<p>
        {{ .Get "caption" }}
        {{ with .Get "attrlink" }}<a href="{{ . }}"> {{ end }}
            {{ .Get "attr" }}
        {{ if .Get "attrlink" }}</a> {{ end }}
        </p> {{ end }}
    </figcaption>
    {{ end }}
</figure>
<!-- image -->
{{< /code >}}

上記のコードは、以下のようにレンダリングされます。

{{< code file="img-output.html" copy="false" >}}
<figure>
    <img src="/media/spf13.jpg"  />
    <figcaption>
        <h4>Steve Francia</h4>
    </figcaption>
</figure>
{{< /code >}}

### 単一の柔軟な例: `vimeo` {#single-flexible-example-vimeo}

```go-html-template
{{</* vimeo 49718712 */>}}
{{</* vimeo id="49718712" class="flex-video" */>}}
```

上記のコードは、以下のように、`/layouts/shortcodes/vimeo.html` にあるテンプレートをロードします。

{{< code file="/layouts/shortcodes/vimeo.html" >}}
{{ if .IsNamedParams }}
  <div class="{{ if .Get "class" }}{{ .Get "class" }}{{ else }}vimeo-container{{ end }}">
    <iframe src="https://player.vimeo.com/video/{{ .Get "id" }}" allowfullscreen></iframe>
  </div>
{{ else }}
  <div class="{{ if len .Params | eq 2 }}{{ .Get 1 }}{{ else }}vimeo-container{{ end }}">
    <iframe src="https://player.vimeo.com/video/{{ .Get 0 }}" allowfullscreen></iframe>
  </div>
{{ end }}
{{< /code >}}

上記のコードは、以下のようにレンダリングされます。

{{< code file="vimeo-iframes.html" copy="false" >}}
<div class="vimeo-container">
  <iframe src="https://player.vimeo.com/video/49718712" allowfullscreen></iframe>
</div>
<div class="flex-video">
  <iframe src="https://player.vimeo.com/video/49718712" allowfullscreen></iframe>
</div>
{{< /code >}}

### ペアの例: `highlight` {#paired-example-highlight}

以下は、Hugo に同梱されている [組み込みのショートコード][built-in shortcode] である `highlight` からの抜粋です。

{{< code file="highlight-example.md" >}}
{{</* highlight html */>}}
  <html>
    <body> This HTML </body>
  </html>
{{</* /highlight */>}}
{{< /code >}}

`highlight` ショートコードのためのテンプレートは、Hugo に既に含まれている以下のコードを使用します。

```go-html-template
{{ .Get 0 | highlight .Inner }}
```

HTML サンプルのコードブロックのレンダリング出力は、以下のようになります。

{{< code file="syntax-highlighted.html" copy="false" >}}
<div class="highlight" style="background: #272822"><pre style="line-height: 125%"><span style="color: #f92672">&lt;html&gt;</span>
    <span style="color: #f92672">&lt;body&gt;</span> This HTML <span style="color: #f92672">&lt;/body&gt;</span>
<span style="color: #f92672">&lt;/html&gt;</span>
</pre></div>
{{< /code >}}

### ネストされたショートコード: 画像ギャラリー {#nested-shortcode-image-gallery}

Hugo の [`.Parent` ショートコード変数][parent] は、問題のショートコードが *親* ショートコードのコンテキスト内で呼び出されたときに、親ショートコード コンテキストへのアクセスを提供します。 これにより、共通のショートコード パラメータのための継承モデルを提供します。

以下の例は不自然ですが、この概念を示しています。 `class` パラメータという名前の 1 つを必要とする `gallery` ショートコードがあるとします。

{{< code file="layouts/shortcodes/gallery.html" >}}
<div class="{{ .Get "class" }}">
  {{ .Inner }}
</div>
{{< /code >}}

以下のような、親が各 `img` のコンテキストを定義するように、 `gallery` およびその他のショートコード内で呼び出したい単一の名前付き `src` パラメータを持つ `img` ショートコードもあります。

{{< code file="layouts/shortcodes/img.html" >}}
{{- $src := .Get "src" -}}
{{- with .Parent -}}
  <img src="{{$src}}" class="{{ .Get "class" }}-image">
{{- else -}}
  <img src="{{$src}}">
{{- end -}}
{{< /code >}}

次に、以下のようにコンテンツ内でショートコードを呼び出すことができます。

```go-html-template
{{</* gallery class="content-gallery" */>}}
  {{</* img src="/images/one.jpg" */>}}
  {{</* img src="/images/two.jpg" */>}}
{{</* /gallery */>}}
{{</* img src="/images/three.jpg" */>}}
```

これにより、以下のような HTML が出力されます。最初の 2 つの `img` ショートコードは、親の `gallery` を呼び出して設定した `content-gallery` の `class` 値を継承していますが、3番目の `img` は `src` のみを使用していることに注意してください。

```html
<div class="content-gallery">
    <img src="/images/one.jpg" class="content-gallery-image">
    <img src="/images/two.jpg" class="content-gallery-image">
</div>
<img src="/images/three.jpg">
```

## ショートコードでのエラー処理 {#error-handling-in-shortcodes}

[errorf](/functions/errorf) テンプレート関数と [.Position](/variables/shortcodes/) 変数を使用して、ショートコードで有用なエラーメッセージを取得できます。

```bash
{{ with .Get "name" }}
{{ else }}
{{ errorf "missing value for param 'name': %s" .Position }}
{{ end }}
```

上記コードが失敗すると、以下のような `ERROR` ログが表示されます。

```bash
ERROR 2018/11/07 10:05:55 missing value for param name: "/Users/bep/dev/go/gohugoio/hugo/docs/content/en/variables/shortcodes.md:32:1"
```

## その他のショートコードの例 {#more-shortcode-examples}

その他のショートコードの例は、[spf13.com の shortcodes ディレクトリ][spfscs] と [Hugo ドキュメントの shortcodes ディレクトリ][docsshortcodes] で見つけることができます。

## インライン ショートコード {#inline-shortcodes}

ショートコードをインラインで、たとえば、コンテンツファイル内でそれらを使用する場所で、実装できます。これは、1 か所だけで必要なスクリプト作成に役立ちます。

この機能はデフォルトで無効になっていますが、以下のようなサイト設定で有効にすることができます:

{{< code-toggle file="config">}}
enableInlineShortcodes = true
{{< /code-toggle >}}

セキュリティ上の理由から、デフォルトでは無効になっています。Hugo のテンプレート処理で使用されているセキュリティモデルは、テンプレートの作成者は信頼できるが、コンテンツファイルは信頼できないことを想定しているので、テンプレートは不正な入力データからインジェクションセーフ (injection-safe) になっています。しかし、ほとんどの場合、コンテンツも完全に制御できるため、`enableInlineShortcodes = true` は安全とみなされます。ただし、注意しなければならないことがあります。コンテンツファイルからアドホックな [Go Text テンプレート](https://golang.org/pkg/text/template/) を実行することができるようになるのです。

そして、一度有効にすると、コンテンツファイルでもこれを実行できるようになります。

 ```go-text-template
 {{</* time.inline */>}}{{ now }}{{</* /time.inline */>}}
 ```

上記のコードは、現在の日付と時刻を出力します。

インライン ショートコードの内部コンテンツは、通常のショートコード テンプレートと同じコンテキストを持つ Go テキスト テンプレートとして解析および実行されることに注意してください。

これは、`.Page.Title` などを介して現在のページにアクセスできることを意味します。さらに、「ネストされたインライン ショートコード」の概念がないことも意味します。

同じインライン ショートコードは、同じコンテンツファイル内で、必要に応じて異なるパラメータを指定して自己終了構文で後から再利用できます。

```go-text-template
{{</* time.inline /*/>}}
```

[basic content files]: /content-management/formats/ "Hugo が Markdown (およびその他のサポートされている形式) を利用して Web サイトのコンテンツを作成する方法を参照してください。"
[built-in shortcode]: /content-management/shortcodes/
[config]: /getting-started/configuration/ "Hugo に組み込まれている設定変数について、また、サイトの設定ファイルにレンダリングされた Web サイト全体で使用できるグローバルなキー値を含める方法について詳しく説明します。"
[Content Management: Shortcodes]: /content-management/shortcodes/#using-hugo-s-built-in-shortcodes "ショートコードとは何かという定義がよくわからない場合や、コンテンツファイルに Hugo の組み込みショートコードを使用する方法についてよくわからない場合は、このセクションを確認してください。"
[source organization]: /getting-started/directory-structure/#directory-structure-explained "Hugo が新しいサイトを足場かけ (スキャフォールディング) する方法と、各ディレクトリで何を見つけることが期待されているかを学びます。"
[docsshortcodes]: https://github.com/gohugoio/hugo/tree/master/docs/layouts/shortcodes "現在読んでいるドキュメントサイトのショートコードのソースディレクトリを参照してください。"
[figure]: /content-management/shortcodes/#figure
[hugosc]: /content-management/shortcodes/#using-hugo-s-built-in-shortcodes
[lookup order]: /templates/lookup-order/ "Hugo がテンプレートファイルをトラバースして、ビルド時にコンテンツをどこでどのようにレンダリングするかを決定する順序を確認します。"
[pagevars]: /variables/page/ "ページテンプレートとリストテンプレートで、どの変数を活用できるかを確認します。"
[parent]: /variables/shortcodes/
[shortcodesvars]: /variables/shortcodes/ "一部の変数はショートコードに固有ですが、ほとんどの .Page 変数はショートコード テンプレート内でアクセスできます。"
[spfscs]: https://github.com/spf13/spf13.com/tree/master/layouts/shortcodes "Hugo の生みの親である Steve Francia 氏のブログ spf13.com のソースのショートコード ディレクトリで、より多くのショートコードの例を見ることができます。"
[templates]: /templates/ "Hugo ドキュメントのテンプレート セクションです。"
[vimeoexample]: #single-flexible-example-vimeo
[youtubeshortcode]: /content-management/shortcodes/#youtube "Hugo の組み込み YouTube ショートコードの使用方法を参照してください。"
