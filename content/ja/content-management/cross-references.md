---
aliases:
- /extras/crossreferences/
categories:
- content management
date: "2017-02-01"
description: ドキュメントへのリンクを作成するためのショートコードです。
draft: false
keywords:
- cross references
- references
- anchors
- urls
lastmod: "2017-03-31"
menu:
  docs:
    parent: content-management
    weight: 170
publishdate: "2017-02-01"
title: リンクとクロスリファレンス
toc: true
weight: 170
---

ショートコードの `ref` と `relref` は、それぞれドキュメントへの絶対パーマリンクと相対パーマリンクを表示します。

## `ref` と `relref` を使用する {#use-ref-and-relref}

`ref` および `relref` ショートコードには、コンテンツ ドキュメントへのパス、ファイル拡張子の有無、アンカーの有無、という一つのパラメータが必要です。
先頭に `/` がないパスは、最初に現在のページをからの相対パスを解決し、次にサイト内の残りのページからの相対パスを解決します。

```
.
└── content
    ├── about
    |   ├── _index.md
    |   └── credits.md
    ├── pages
    |   ├── document1.md
    |   └── document2.md    // has anchor #anchor
    ├── products
    |   └── index.md
    └── blog
        └── my-post.md
```

各ページは、以下のように参照できます。

```text
{{</* ref "document2" */>}}             // <- pages/document1.md からの相対パス
{{</* ref "document2#anchor" */>}}      
{{</* ref "document2.md" */>}}          
{{</* ref "document2.md#anchor" */>}}   
{{</* ref "#anchor" */>}}               // <- pages/document2.md から
{{</* ref "/blog/my-post" */>}}         // <- どこからでも、絶対パス
{{</* ref "/blog/my-post.md" */>}}
{{</* relref "document" */>}}
{{</* relref "document.md" */>}}
{{</* relref "#anchor" */>}}
{{</* relref "/blog/my-post.md" */>}}
```

index.md は、そのパスまたは末尾の `/` を含まないフォルダーによって参照できます。 \_index.md は、以下のように、それを含むフォルダーからのみ参照できます。

```text
{{</* ref "/about" */>}}             // <- /about/_index.md の参照
{{</* ref "/about/_index" */>}}      //    REF_NOT_FOUND エラーが発生します
{{</* ref "/about/credits.md" */>}}  // <- /about/credits.md の参照

{{</* ref "/products" */>}}          // <- /products/index.md の参照
{{</* ref "/products/index" */>}}    // <- /products/index.md の参照
```

Markdown で `ref` または `relref` を使用してハイパーリンクを生成する方法は、以下の通りです。

```md
[About]({{</* ref "/page/about" */>}} "About Us")
```

Hugo は、ドキュメントを一意に解決できない場合にエラーや警告を発します。エラーの動作は設定可能です。下記を参照してください。

### 他言語版にリンクする {#link-to-another-language-version}

別の言語版のドキュメントにリンクする場合は、以下の構文を使用します。

```go-html-template
{{</* relref path="document.md" lang="ja" */>}}
```

### 別の出力形式を取得する {#get-another-output-format}

ドキュメントの別の出力形式にリンクするには、以下の構文を使用します。

```go-html-template
{{</* relref path="document.md" outputFormat="rss" */>}}
```

### 見出し ID {#heading-ids}

Markdown ドキュメント タイプを使用する場合、Hugo はページのすべての見出しの要素 ID を生成します。 たとえば、

```md
## Reference
```

は、以下の HTML を生成します。

```html
<h2 id="reference">Reference</h2>
```

`ref` または `relref` ショートコードを使用する場合、パスに ID を追加して、見出しへのパーマリンクを取得します。

```go-html-template
{{</* ref "document.md#reference" */>}}
{{</* relref "document.md#reference" */>}}
```

属性を含めてカスタムの見出し ID を生成します。 たとえば、

```md
## Reference A {#foo}
## Reference B {id="bar"}
```

は、以下の HTML を生成します。

```html
<h2 id="foo">Reference A</h2>
<h2 id="bar">Reference B</h2>
```

同じ見出しがページに複数回表示される場合、Hugo は一意の要素 ID を生成します。 たとえば、

```md
## Reference
## Reference
## Reference
```

は、以下の HTML を生成します。

```html
<h2 id="reference">Reference</h2>
<h2 id="reference-1">Reference</h2>
<h2 id="reference-2">Reference</h2>
```

## Ref と RelRef の設定 {#ref-and-relref-configuration}

Hugo 0.45 以降では、`config.toml` で動作を設定できます。

refLinksErrorLevel ("ERROR")
: ページリンクの解決に `ref` や `relref` を使用していて、リンクが解決できなかった場合に、このログレベルでログに記録されます。有効な値は `ERROR` (デフォルト) または `WARNING` (警告) です。 `ERROR` が指定された場合は、ビルドに失敗します (`exit -1`).

refLinksNotFoundURL
: `ref` または `relref` でページ参照が見つからない場合に、プレースホルダとして使用する URL で、そのまま使用されます。


[lists]: /templates/lists/
[output formats]: /templates/output-formats/
[shortcode]: /content-management/shortcodes/
