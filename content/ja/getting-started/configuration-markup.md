---
categories:
- getting started
- fundamentals
date: "2019-11-15"
description: Markdown およびその他のマークアップ関連の構成を処理する方法です。
draft: false
keywords:
- configuration
- highlighting
sections_weight: 65
slug: configuration-markup
menu:
  docs:
    parent: getting-started
    weight: 65
title: マークアップの設定
toc: true
weight: 65
---

## マークアップの設定 {#configure-markup}

Hugo のデフォルトの Markdown ハンドラーに関連する設定については、[Goldmark](#goldmark) を参照してください。

以下は、Hugo のマークアップ関連の設定とその初期設定です。

{{< code-toggle config="markup" />}}

**詳細については、以下の各セクションを参照してください。**

### Goldmark

[Goldmark](https://github.com/yuin/goldmark/) は Hugo 0.60 から Markdown に使用されるデフォルトのライブラリです。 これは高速で、[CommonMark](https://spec.commonmark.org/0.29/) に準拠しており、非常に柔軟です。

以下がデフォルト設定です。

{{< code-toggle config="markup.goldmark" />}}

拡張機能の詳細については、Goldmark ドキュメントの [このセクション](https://github.com/yuin/goldmark/#built-in-extensions) を参照してください。

以下に、一部の設定について説明します。

unsafe
: デフォルトでは、Goldmark は生の HTML と潜在的に危険なリンクをレンダリングしません。 インライン HTML や JavaScript がたくさんある場合は、これをオンにする必要があるかもしれません。

typographer
: この拡張機能は、句読点を [smartypants](https://daringfireball.net/projects/smartypants/) のようなタイポグラフィの実体に置き換えます。

attribute
: タイトルとブロックのカスタム属性サポートを有効にするには、1つの中括弧内に属性リスト (`{.myclass class="class1 class2" }`) を追加し、_それを装飾する Markdown 要素の後に_ タイトルの場合は同じ行、ブロックの場合はそのすぐ下の新しい行に配置します。

Hugo ではテーブル、リスト、パラグラフなどの Markdown ブロックへの属性 (たとえば、CSS クラス) の追加をサポートしています。

CSS クラスを持つブロック引用の例:

```md
> foo
> bar
{.myclass}
```

現在のところ、いくつかの制限があります。現在のところ、テーブルの場合はテーブル全体に対してのみ、リストの場合は `ul`/`ol` ノードのみに適用できます。たとえば、以下の通りです。

```md
* Fruit
  * Apple
  * Orange
  * Banana
  {.fruits}
* Dairy
  * Milk
  * Cheese
  {.dairies}
{.list}
```

[コードフェンス](/content-management/syntax-highlighting/#highlighting-in-code-fences) の属性は、他のハイライト処理命令と一緒に、開始タグの後に配置しなければならないことに注意してください。例えば、以下の通りです。

````txt
```go {.myclass linenos=table,hl_lines=[8,"15-17"],linenostart=199}
// ... code
```
````

autoHeadingIDType ("github") {{< new-in "0.62.2" >}}
: 自動生成される ID (アンカー名) を作成する際に使用するストラテジー。利用可能なタイプは `github`、`github-ascii`、`blackfriday` です。`github` は GitHub 互換の ID を作成し、 `github-ascii` はアクセントの正規化後に非アスキー文字を削除し、`blackfriday` は Hugo 0.60 以前のデフォルト Markdown エンジンである Blackfriday と互換性のある ID を作成します。 Goldmark がデフォルトの Markdown エンジンである場合、これは [anchorize](/functions/anchorize/) テンプレート関数で使用される戦略でもあることに注意してください。

### ハイライト {#highlight}

これはデフォルトの `highlight` 設定です。これらの設定のいくつかはコードブロックごとに設定できることに注意してください。詳細は、[「シンタックスハイライト」](/content-management/syntax-highlighting/) を参照してください。

{{< code-toggle config="markup.highlight" />}}

`style` については、以下のギャラリーを参照してください。

* [ショートスニペット](https://xyproto.github.io/splash/docs/all.html)
* [ロングスニペット](https://xyproto.github.io/splash/docs/longer/all.html)

CSS については、[「シンタックスハイライト CSS の生成」](/content-management/syntax-highlighting/#generate-syntax-highlighter-css) を参照してください。

### 目次 {#table-of-contents}

{{< code-toggle config="markup.tableOfContents" />}}

以下の設定は、Goldmark レンダラーでのみ機能します。

startLevel
: 目次のレンダリングを開始する見出しレベル。値は 1 (`h1`) から始まります。

endLevel
: 目次のレンダリングを停止するための見出しレベル (含む)。

ordered
: 順序なしリストの代わりに順序付きリストを生成するかどうか。

## Markdown レンダーフック {#markdown-render-hooks}

[「Markdown レンダーフック」](/templates/render-hooks/) を参照してください。
