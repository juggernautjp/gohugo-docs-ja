---
aliases:
- /extras/highlighting/
- /extras/highlight/
- /tools/syntax-highlighting/
categories:
- content management
date: "2017-02-01"
description: Hugo には、Chroma による非常に高速なシンタックスハイライトが搭載されています。
draft: false
keywords:
- highlighting
- chroma
- code blocks
- syntax
menu:
  docs:
    parent: content-management
    weight: 240
publishdate: "2017-02-01"
title: シンタックスハイライト
toc: true
weight: 240
---

Hugo は [Chroma](https://github.com/alecthomas/chroma) をコード ハイライターとして使用します。 これは Go で構築されており、非常に高速です。また、最も重要な部分については、以前使用していた Pygments と互換性があります。

## シンタックスハイライターの設定 {#configure-syntax-highlighter}

[「ハイライトの設定」](/getting-started/configuration-markup#highlight) を参照してください。

## シンタックスハイライター CSS を生成する {#generate-syntax-highlighter-css}

サイト設定で `markup.highlight.noClasses=false` を指定して実行する場合は、スタイルシートが必要です。

以下のコマンドにより、Hugo でシンタックスハイライター CSS を生成することができます。

```bash
hugo gen chromastyles --style=monokai > syntax.css
```

その他のオプションは `hugo gen chromastyles -h` を実行してください。利用可能なスタイルのギャラリーは https://xyproto.github.io/splash/docs/ を参照してください。

## ハイライト ショートコード {#highlight-shortcode}

ハイライト表示は、組み込みの [`highlight` ショートコード](https://gohugo.io/content-management/shortcodes/#highlight) を使って行われます。ハイライト表示されるプログラミング言語の必須パラメータを 1 つだけ受け取り、終了ショートコードが必要です。なお、`highlight` はクライアント側の JavaScript のハイライトには *使用されない* ことに注意してください。

オプション:

* `linenos`: は、行番号を設定します。有効な値は `true`、`false`、`table`、`inline` のいずれかです。 サイト設定で行番号をオンに設定されている場合、`false` は行番号をオフにします。 {{< new-in "0.60.0" >}} `table` は、コピー アンド ペーストに適したコードブロックを提供します。
* `hl_lines`: は、ハイライトする行番号または行番号の範囲をリストします。
* `linenostart=199`: は、行番号のカウントを 199 から開始します。
* `anchorlinenos`: は、行番号にアンカーを設定します。有効な値は `true` または `false` です。
* `lineanchors`: は、行番号のアンカーに付けるプレフィックスを設定します。サフィックスには `-` が付くので、 `lineanchors=prefix` というオプションで行番号 1 にリンクすると、アンカー `prefix-1` がページに追加されます。  
* `hl_inline`: は、 `<code>` (インライン HTML 要素) タグの内部をハイライト表示します。有効な値は `true` または `false` です。 `code` タグは、 `code-inline` という名前のクラスを取得します。 {{< new-in "0.101.0" >}}

### ハイライト ショートコードの例 {#example-highlight-shortcode}

```go-html-template
{{</* highlight go "linenos=table,hl_lines=8 15-17,linenostart=199" */>}}
// ... code
{{</* / highlight */>}}
```

上記のコードは、以下を出力します。

{{< highlight go "linenos=table,hl_lines=8 15-17,linenostart=199" >}}
// GetTitleFunc returns a func that can be used to transform a string to
// title case.
//
// The supported styles are
//
// - "Go" (strings.Title)
// - "AP" (see https://www.apstylebook.com/)
// - "Chicago" (see https://www.chicagomanualofstyle.org/home.html)
//
// If an unknown or empty style is provided, AP style is what you get.
func GetTitleFunc(style string) func(s string) string {
  switch strings.ToLower(style) {
  case "go":
    return strings.Title
  case "chicago":
    return transform.NewTitleConverter(transform.ChicagoStyle)
  default:
    return transform.NewTitleConverter(transform.APStyle)
  }
}
{{< / highlight >}}

## Hugo/GO テンプレートコードのハイライト {#highlight-hugo-go-template-code}

Hugo/GO のテンプレートコードをページ上でハイライト表示するには、開始の二重中括弧の後に `/*` を、終了の中括弧の前に `*/` を追加します。

``` go
{{</*/* myshortcode */*/>}}
```

上記のコードは、以下を出力します。

``` go
{{</* myshortcode */>}}
```

## ハイライトテンプレート関数 {#highlight-template-func}

[「highlight 関数」](/functions/highlight/) を参照してください。

## コードフェンスでのハイライト表示 {#highlighting-in-code-fences}

コードフェンス内のハイライト表示は、デフォルトで有効になっています。{{< new-in "0.60.0" >}}

````txt
```go {linenos=table,hl_lines=[8,"15-17"],linenostart=199}
// ... code
```
````


上記のコードは、以下を出力します。

```go {linenos=table,hl_lines=[8,"15-17"],linenostart=199}
// GetTitleFunc returns a func that can be used to transform a string to
// title case.
//
// The supported styles are
//
// - "Go" (strings.Title)
// - "AP" (see https://www.apstylebook.com/)
// - "Chicago" (see https://www.chicagomanualofstyle.org/home.html)
//
// If an unknown or empty style is provided, AP style is what you get.
func GetTitleFunc(style string) func(s string) string {
  switch strings.ToLower(style) {
  case "go":
    return strings.Title
  case "chicago":
    return transform.NewTitleConverter(transform.ChicagoStyle)
  default:
    return transform.NewTitleConverter(transform.APStyle)
  }
}
```

オプションは `linenos=false` を含む [ハイライト ショートコード](/content-management/syntax-highlighting/#highlight-shortcode) と同じですが、Markdown 属性の構文がわずかに異なることに注意してください。

## Chroma ハイライト言語の一覧 {#list-of-chroma-highlighting-languages}

以下は、Chroma レキサーとそのエイリアスの完全なリストです (これは、`highlight` テンプレート関数やコードフェンスでハイライト表示を行う際に使用する識別子です)。

{{< chroma-lexers >}}
