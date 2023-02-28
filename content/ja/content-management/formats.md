---
aliases:
- /content/markdown-extras/
- /content/supported-formats/
- /doc/supported-formats/
categories:
- content management
date: "2017-01-10"
description: HTML と Markdown の両方のコンテンツフォーマットをサポートしています。
draft: false
keywords:
- markdown
- asciidoc
- pandoc
- content format
linktitle: コンテンツフォーマット
menu:
  docs:
    parent: content-management
    weight: 40
publishdate: "2017-01-10"
title: コンテンツフォーマット
toc: true
weight: 40
---

`content` ディレクトリには任意のファイルタイプを入れることができますが、Hugo は `markup` というフロントマターの値が設定されている場合、またはファイルの拡張子 (下のテーブルの `マークアップ識別子` を参照) を使って、マークアップを処理する必要があるかどうかを判断します。たとえば、

* HTML に変換された Markdown
* 処理済み [ショートコード](/content-management/shortcodes/)
* 適用されたレイアウト

## コンテンツフォーマットの一覧 {#list-of-content-formats}

下表は、Hugo の現在のコンテンツフォーマットの一覧です。

| 名前  | マークアップ識別子 | コメント |
| ------------- | ------------- |-------------|
| Goldmark  | md, markdown, goldmark  | `md` と `markdown` のデフォルト ハンドラーを別のものに設定できることに注意してください。[「マークアップの設定」](/getting-started/configuration-markup/) を参照してください。{{< new-in "0.60.0" >}} |
| Emacs Org-Mode | org | [go-org](https://github.com/niklasfasching/go-org) を参照してください。 |
| AsciiDoc | asciidocext, adoc, ad  | [Asciidoctor][ascii] がインストールされている必要があります。 |
| RST | rst | [RST](https://docutils.sourceforge.io/rst.html) がインストールされている必要があります。 |
| Pandoc| pandoc, pdc | [Pandoc](https://www.pandoc.org/) がインストールされている必要があります。 |
| HTML | html, htm | レイアウトやショートコードなど、コンテンツファイルとして扱うには、フロントマターが必要です。そうでない場合は、そのままコピーされます。 |

`マークアップ識別子` は、フロントマターの変数 `markup` か、ファイルの拡張子から取得されます。 マークアップ関連の設定については、 [「マークアップの設定」](/getting-started/configuration-markup/) を参照してください。

## 外部ヘルパー {#external-helpers}

上表の形式の中には、お使いの PC に外部ヘルパーをインストールする必要があるものがあります。
たとえば、AsciiDoc ファイルの場合、Hugo は `asciidoctor` コマンドを呼び出そうとします。
つまり、これらの形式を使用するには、関連するツールをマシンにインストールする必要があります。

Hugo は、デフォルトで以下のような適切なデフォルト引数をこれらの外部ヘルパーに渡します。

- `asciidoctor`: `--no-header-footer -`
- `rst2html`: `--leave-comments --initial-header-level=2`
- `pandoc`: `--mathjax`

{{% warning "Performance of External Helpers" %}}
追加のフォーマットは外部コマンドであるため、生成のパフォーマンスは、使用している外部ツールのパフォーマンスに大きく依存します。 この機能はまだ初期段階にあるため、フィードバックを歓迎します。
{{% /warning %}}

### 外部ヘルパー AsciiDoc {#external-helper-asciidoc}

[AsciiDoc](https://github.com/asciidoc/asciidoc) の実装は 2020年1月に EOL となり、サポートが終了しています。
なお、AsciiDoc の開発は [Ascidoctor](https://github.com/asciidoctor) のもとで継続されています。 
もちろん AsciiDoc のフォーマットは残ります。実装は Asciidoctor で続けてください。

### 外部ヘルパー Asciidoctor {#external-helper-asciidoctor}

Asciidoctor コミュニティは、Hugo に追加してインストールできる、AsciiDoc フォーマットのための幅広いツール群を提供しています。
[インストール方法は Asciidoctor のドキュメントを参照してください](https://asciidoctor.org/docs/install-toolchain/)。 
必要であれば、`asciidoctor-diagram` や `asciidoctor-html5s` などのオプションの拡張もすべてインストールされていることを確認してください。

{{% note %}}
外部の `asciidoctor` コマンドでは、 Hugo レンダリングが特定の宛先ディレクトリへ _disk_ するように要求します。 コマンド オプション `--destination` を指定して Hugo を実行する必要があります。
{{% /note %}}

一部の [Asciidoctor](https://asciidoctor.org/man/asciidoctor/) パラメータは、Hugo でカスタマイズできます。

パラメータ | コメント
--- | ---
backend | 自分が何をしているのか分からない限り、これを変更しないでください。
doctype | 現在、Hugo でサポートされているドキュメント タイプは `article` だけです。
extensions | 使用できる拡張子は、 `asciidoctor-html5s`、`asciidoctor-bibtex`、`asciidoctor-diagram`、`asciidoctor-interdoc-reftext`、`asciidoctor-katex`、`asciidoctor-latex`、`asciidoctor-mathematical`、`asciidoctor-question`、`asciidoctor-rouge` です。
attributes | AsciiDoc ファイルで参照する変数です。これは変数名/値マップのリストです。 [「Asciidoctor の属性」](https://asciidoctor.org/docs/asciidoc-syntax-quick-reference/#attributes-and-substitutions) を参照してください。
noHeaderOrFooter | ヘッダー、フッター、本文以外のものを除いた埋め込み可能なドキュメントを出力します。自分が何をしているのか分からない限り、これを変更しないでください。
safeMode | セーフモードのレベルを `unsafe`、`safe`、`server`、`secure` のいずれかから選択します。自分が何をしているのか分からない限り、これを変更しないでください。
sectionNumbers | セクションのタイトルに自動で番号を付けます。
verbose | 処理情報と設定ファイルのチェックを stderr (標準エラー出力) に詳細に出力します。
trace | エラー時のバックトレース情報を含めます。
failureLevel | 0以外の終了コード（失敗）をトリガーする最小のロギングレベルです。

Hugo は Asciidoctor の CLI オプションに直接マッピングされない、以下の追加設定を提供します。

workingFolderCurrent
: 作業ディレクトリを、処理中の AsciiDoc ファイルのディレクトリと同じになるように設定します。これにより、[include](https://asciidoctor.org/docs/asciidoc-syntax-quick-reference/#include-files) が相対パスで動作するようになります。この設定では、 `asciidoctor` の cli パラメータ `--base-dir` と属性 `outdir=` を使用します。 [asciidoctor-diagram](https://asciidoctor.org/docs/asciidoctor-diagram/) で図をレンダリングする場合には、 `workingFolderCurrent` を `true` に設定する必要があります。

preserveTOC
: デフォルトでは、Hugo は Asciidoctor が生成した目次を削除し、組み込み変数 [`.TableOfContents`](/content-management/toc/) を通して目次を提供し、さらなるカスタマイズとさまざまな Hugo テーマとのより良い統合を可能にします。このオプションを `true` に設定すると、生成されたページで Asciidoctor の TOC (目次) を保持できます。

以下は、Hugo における AsciiDoc 関連のすべての設定とそのデフォルト値になります。

{{< code-toggle config="markup.asciidocExt" />}}

セキュリティ上の懸念から、パス区切り文字 (`\`、`/`、または `.`) を持たない拡張子のみが許可されることに注意してください。 つまり、拡張機能は、Ruby の `$LOAD_PATH` にある場合にのみ呼び出すことができます (つまり、拡張機能がユーザーによってインストールされている可能性が最も高いです)。 Web サイトのパスに対して相対的に宣言された拡張子は受け入れられません。

以下は、拡張子や属性の設定例です。

```yml
[markup.asciidocExt]
    extensions = ["asciidoctor-html5s", "asciidoctor-diagram"]
    workingFolderCurrent = true
    [markup.asciidocExt.attributes]
        my-base-url = "https://example.com/"
        my-attribute-name = "my value"
```

複雑な Asciidoctor 環境では、外部ヘルパーをすべてのパラメータで正確に呼び出すことがデバッグに役立つことがあります。 `-v` で Hugo を実行すると、以下のような出力が得られます。

```txt
INFO 2019/12/22 09:08:48 Rendering book-as-pdf.adoc with C:\Ruby26-x64\bin\asciidoctor.bat using asciidoc args [--no-header-footer -r asciidoctor-html5s -b html5s -r asciidoctor-diagram --base-dir D:\prototypes\hugo_asciidoc_ddd\docs -a outdir=D:\prototypes\hugo_asciidoc_ddd\build -] ...
```

## Markdown を学ぶ {#learn-markdown}

Markdown の構文は一度で習得できるほどシンプルです。以下は、あなたが起動し、実行できる優れたリソースです。

* [Daring Fireball: Markdown, John Gruber (Creator of Markdown)][fireball]
* [Markdown Cheatsheet, Adam Pritchard][mdcheatsheet]
* [Markdown Tutorial (Interactive), Garen Torikian][mdtutorial]
* [The Markdown Guide, Matt Cone][mdguide]

[`emojify` function]: /functions/emojify/
[ascii]: https://asciidoctor.org/
[config]: /getting-started/configuration/
[developer tools]: /tools/
[emojis]: https://www.webpagefx.com/tools/emoji-cheat-sheet/
[fireball]: https://daringfireball.net/projects/markdown/
[gfmtasks]: https://guides.github.com/features/mastering-markdown/#syntax
[helperssource]: https://github.com/gohugoio/hugo/blob/77c60a3440806067109347d04eb5368b65ea0fe8/helpers/general.go#L65
[hl]: /content-management/syntax-highlighting/
[hlsc]: /content-management/shortcodes/#highlight
[hugocss]: /css/style.css
[ietf]: https://tools.ietf.org/html/
[mathjaxdocs]: https://docs.mathjax.org/en/latest/
[mdcheatsheet]: https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet
[mdguide]: https://www.markdownguide.org/
[mdtutorial]: https://www.markdowntutorial.com/
[org]: https://orgmode.org/
[pandoc]: https://www.pandoc.org/
[rest]: https://docutils.sourceforge.io/rst.html
[sc]: /content-management/shortcodes/
[sct]: /templates/shortcode-templates/
