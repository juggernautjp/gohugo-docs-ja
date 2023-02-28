---
categories:
- templates
date: "2017-03-11"
description: レンダーフックを使用すると、カスタムテンプレートで Markdown レンダリング機能をオーバーライドできます。
draft: false
keywords:
- markdown
linkTitle: レンダーフック
menu:
  docs:
    parent: templates
    title: Markdown レンダーフック
    weight: 20
title: Markdown レンダーフック
toc: true
---

これは、 [Goldmark](/getting-started/configuration-markup#goldmark) レンダラーでのみサポートされていることに注意してください。

`layouts/_default/_markup` にベース名 `render-{kind}` を持つテンプレートを作成することで、HTML へのデフォルトの Markdown レンダリングの特定の部分をオーバーライドできます。

また、たとえば `layouts/blog/_markup` のように、`layouts/[type/section]/_markup` にタイプ/セクション固有のフックを作成することもできます。

現在サポートされているフックの種類は、以下のとおりです。

* `image`
* `link`
* `heading`
* `codeblock`{{< new-in "0.93.0" >}}

必要に応じて、[出力形式](/templates/output-formats) および [言語](/content-management/multilingual/) 固有のテンプレートを定義できます。 `layouts` フォルダーは、以下のようになります。

```goat { class="black f7" }
layouts/
└── _default/
    └── _markup/
        ├── render-codeblock-bash.html
        ├── render-codeblock.html
        ├── render-heading.html
        ├── render-image.html
        ├── render-image.rss.xml
        └── render-link.html
```

上記のいくつかの使用例には、以下があります。

* リンクの参照は `.GetPage` を使って解決します。これにより、`./my-post.md` (および GitHub で動作する同様の構造) を `/blog/2019/01/01/my-post/` などに変換できるため、リンクが移植可能になります。
* 外部リンクに `target=_blank` を追加します。
* 画像を解決して [処理](/content-management/image-processing/) します。
* [ヘッダーリンク](https://remysharp.com/2014/08/08/automatic-permalinks-for-blog-posts) を追加します。

## 見出し、リンク、画像のレンダーフック {#render-hooks-for-headings-lLinks-and-images}

`render-link` および `render-image` テンプレートは、以下のコンテキストを受け取ります。

Page
: レンダリングされる [Page](/variables/page/) です。

Destination
: URL です。

Title
: タイトル属性です。

Text
: レンダリングされた (HTML) リンクテキストです。

PlainText
: 上記のプレーンテキストのバリアントです。

`render-heading` テンプレートは、以下のコンテキストを受け取ります。

Page
: レンダリングされる [Page](/variables/page/) です。

Level
: ヘッダーレベル (1 から 6)

Anchor
: ページ内のヘッダーに固有の自動生成された html ID です。

Text
: レンダリングされた (HTML) テキストです。

PlainText
: 上記のプレーンテキストのバリアントです。

Attributes (map) 
: 属性のマップ (たとえば、 `id`、`class`) です。現在、リンクの場合、これは常に空であることに注意してください。

また、`render-image` テンプレートは、以下のコンテキストも受け取ることになります。

IsBlock {{< new-in "0.108.0" >}}
: これがスタンドアロン画像で、設定オプション [markup.goldmark.parser.wrapStandAloneImageWithinParagraph](/getting-started/configuration-markup/#goldmark) が無効になっている場合は true を返します。

Ordinal  {{< new-in "0.108.0" >}}
: 現在のドキュメントに含まれるすべての画像のゼロから始まる序数。


### タイトル付きリンク Markdown の例 {#link-with-title-markdown-example}

```md
[Text](https://www.gohugo.io "Title")
```

以下は、render-link.html テンプレートがどのように見えるかのコード例です。

{{< code file="layouts/_default/_markup/render-link.html" >}}
<a href="{{ .Destination | safeURL }}"{{ with .Title}} title="{{ . }}"{{ end }}{{ if strings.HasPrefix .Destination "http" }} target="_blank" rel="noopener"{{ end }}>{{ .Text | safeHTML }}</a>
{{< /code >}}

### 画像 Markdown の例 {#image-markdown-example}

```md
![Text](https://gohugo.io/images/hugo-logo-wide.svg "Title")
```

以下は、render-image.html テンプレートがどのように見えるかのコード例です。

{{< code file="layouts/_default/_markup/render-image.html" >}}
<p class="md__image">
  <img src="{{ .Destination | safeURL }}" alt="{{ .Text }}" {{ with .Title}} title="{{ . }}"{{ end }} />
</p>
{{< /code >}}

### 見出しリンクの例 {#heading-link-example}

以下のテンプレートファイル、

{{< code file="layouts/_default/_markup/render-heading.html" >}}
<h{{ .Level }} id="{{ .Anchor | safeURL }}">{{ .Text | safeHTML }} <a href="#{{ .Anchor | safeURL }}">¶</a></h{{ .Level }}>
{{< /code >}}

と、以下の Markdown ファイルに対して、

```md
### Section A
```

レンダリングされた html は以下のようになります

```html
<h3 id="section-a">Section A <a href="#section-a">¶</a></h3>
```

## コードブロックのためのレンダーフック {#render-hooks-for-code-blocks}

{{< new-in "0.93.0" >}}

すべてのコードブロックまたは特定のタイプ/言語 (以下の例では `bash`) のフックテンプレートを追加できます。

```goat { class="black f7" }
layouts
└── _default
    └── _markup
        └── render-codeblock.html
        └── render-codeblock-bash.html
```

これらのコードブロックのデフォルトの動作は、[コードのハイライト表示](/content-management/syntax-highlighting/#highlighting-in-code-fences) ですが、これらのコードブロックに属性を渡すことができるので、ほとんどのことに使用できます。一例として、組み込みの [GoAT ダイアグラム](/content-management/diagrams/#goat-diagrams-ascii) や、この [Mermaid ダイアグラム コードブロック フック](/content-management/diagrams/#mermaid-diagrams) の例などがあります。

コードブロック テンプレートで受け取るコンテキスト (".") には、以下のものが含まれます。

Type (string)
: コードブロックの種類を指定します。これは、コードのハイライト表示を行う際のプログラミング言語、たとえば `bash` になります。

Attributes (map)
: Markdown から渡された属性です (たとえば、`{ attrName1=attrValue1 attrName2="attr Value 2" }`)。

Options (map)
: Chroma ハイライト処理オプションです。これは `Type` が既知の [Chroma Lexer](/content-management/syntax-highlighting/#list-of-chroma-highlighting-languages) である場合にのみ入力されます。

Inner (string)
: コード フェンス間のテキストです。

Ordinal (integer)
: 現在のドキュメントに含まれるすべてのコードブロックのゼロベースの (ゼロから始まる) 序数です。

Page
: 所有する `Page` です。

Position
: ファイル名と位置 (行番号、列) を出力するため、エラーログに役立ちます。たとえば、 `{{ errorf "error in code block: %s" .Position }}` です。
