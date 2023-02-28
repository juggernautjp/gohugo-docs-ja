---
categories:
- functions
date: "2017-02-01"
deprecated: false
description: シンタックス ハイライターを使用してコードをレンダリングします。
draft: false
keywords:
- highlighting
- code blocks
- syntax
lastmod: "2021-12-06"
linktitle: highlight
menu:
  docs:
    parent: functions
publishdate: "2017-02-01"
relatedfuncs: []
signature:
- transform.Highlight INPUT LANG [OPTIONS]
- highlight INPUT LANG [OPTIONS]
title: highlight
toc: true
---
`highlight` 関数は [Chroma] シンタックス ハイライターを使用し、200 を超える言語と 40 を超える利用可能なスタイルをサポートします。

## パラメータ {#parameters}

INPUT
: ハイライト表示するコードです。

LANG
: ハイライト表示するコードの言語です。 [サポートされている言語][supported languages] のいずれかから選択します。 大文字小文字を区別しません。

OPTIONS
: 0 個以上の [オプション][options]をカンマで区切ったオプションリストです。 [サイト設定][site configuration] にデフォルト値を設定します。

## オプション {#options}

lineNos
: Boolean. デフォルトは、 `false` です。\
各行の先頭に数字を表示します。

lineNumbersInTable
: Boolean. デフォルトは、 `true` です。\
ハイライト表示されたコードを 2 つのセルを持つ HTML テーブルにレンダリングします。 左側のテーブルのセルには行番号が含まれています。 右側のテーブルのセルにはコードが表示され、ユーザは行番号のないコードを選択してコピーすることができます。lineNos` が false の場合は関係ありません。

anchorLineNos
: Boolean. デフォルトは、 `false` です。\
各行番号を HTML アンカー要素としてレンダリングし、周囲の `<span>` の `id` 属性を行番号に設定します。 `lineNos` が false の場合は、関係ありません。

lineAnchors
: String. デフォルトは、 `""` です。\
行番号を HTML アンカー要素としてレンダリングする場合、この値を周囲の `<span>` の `id` 属性の前に付けます。これにより、ページが 2 つ以上のコードブロックを含んでいる場合に、一意の `id` 属性を提供できます。 `lineNos` または `anchorLineNos` が false の場合は、関係ありません。

lineNoStart
: Integer. デフォルトは、 `1` です。\
最初の行の先頭に表示する番号です。 `lineNos` が false の場合は関係ありません。

hl_Lines
: String. デフォルトは、 `""` です。\
ハイライト表示されたコードの中で、強調したい行を空白文字で区切ったリストです。 2、3、4、7 行目を強調したい場合は、この値を `2-4 7` に設定します。 このオプションは、 `lineNoStart` オプションとは無関係です。

hl_inline
: Boolean. デフォルトは、 `false` です。\
ハイライト表示されたコードを、ラッピングコンテナなしでレンダリングします。

style
: String. デフォルトは、 `monokai` です。\
ハイライト表示されたコードに適用される CSS スタイルです。 例については、[スタイルギャラリー] を参照してください。 大文字小文字は区別されます。

noClasses
: Boolean. デフォルトは、 `true` です。\
外部 CSS ファイルの代わりに、インライン CSS スタイルを使用します。 外部 CSS ファイルを使用するには、この値を `false` に設定し、[Hugo クライアントでファイルを生成][hugo client] します。

tabWidth
: Integer. デフォルトは、 `4` です。\
ハイライト表示したコードで、各タブ文字をこの個数の空白文字に置き換えます。

guessSyntax
: Boolean. デフォルトは、 `false` です。\
`LANG` パラメータが空白または認識できない言語の場合、可能であれば言語を自動検出し、そうでなければフォールバック言語を使用します。

{{% note %}}
`lineNos` と `lineNumbersInTable` の両方を指定する代わりに、以下の省略記法を使用することができます。

`lineNos=inline`
: `lineNos=true` および `lineNumbersInTable=false` と同等です。

`lineNos=table`
: `lineNos=true` および `lineNumbersInTable=true` と同等です。
{{% /note %}}

## 例 {#examples}

```go-html-template
{{ $input := `fmt.Println("Hello World!")` }}
{{ transform.Highlight $input "go" }}

{{ $input := `console.log('Hello World!');` }}
{{ $lang := "js" }}
{{ transform.Highlight $input $lang "lineNos=table, style=api" }}

{{ $input := `echo "Hello World!"` }}
{{ $lang := "bash" }}
{{ $options := slice "lineNos=table" "style=dracula" }}
{{ transform.Highlight $input $lang (delimit $options ",") }}
```

[Chroma]: https://github.com/alecthomas/chroma
[hugo client]: {{< relref "commands/hugo_gen_chromastyles" >}}
[options]: {{< relref "#options" >}}
[site configuration]: {{< relref "getting-started/configuration-markup#highlight">}}
[style gallery]: https://xyproto.github.io/splash/docs/
[supported languages]: {{< relref "content-management/syntax-highlighting#list-of-chroma-highlighting-languages" >}}
