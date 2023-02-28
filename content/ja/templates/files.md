---
aliases:
- /extras/localfiles/
- /templates/local-files/
categories:
- templates
date: "2017-02-01"
description: Hugo の `readDir` と `readFile` 関数を使用すると、プロジェクトのディレクトリ構造を走査して、簡単にファイルの内容をテンプレートに書き込むことができます。
draft: false
keywords:
- files
- directories
lastmod: "2017-02-01"
linktitle: ローカルファイル テンプレート
menu:
  docs:
    parent: templates
    weight: 110
publishdate: "2017-02-01"
sections_weight: 110
title: ローカルファイル テンプレート
toc: true
weight: 110
---

## ローカルファイルをトラバースする {#traverse-local-files}

Hugo の [`readDir`][readDir] および [`readFile`][readFile] テンプレート関数を使用すると、サーバー上の Web サイトのファイルをトラバースできます。

## `readDir` を使用する {#use-readdir}

[`readDir` 関数][readDir] は、 [`os.FileInfo`][osfileinfo] の配列を返します。この関数は、ファイルの `path` を 1 つの文字列の引数として受け取ります。このパスは、Web サイトの任意のディレクトリ (つまり、サーバーのファイルシステムで見つかったもの) にすることができます。

パスが絶対か相対かは重要ではありません。 なぜなら、少なくとも `readDir` では、Web サイトのルート (通常、 `./public/`) が事実上、以下 2 つの両方になるからです。

1. ファイルシステムのルート
2. 現在の作業ディレクトリ

## `readFile` を使用する {#use-readfile}

[`readfile` 関数][readFile] は、ディスクからファイルを読み取り、それを文字列に変換して、他の Hugo 関数で操作したり、そのまま追加したりします。 `readFile` は、パスを含むファイルを、関数に渡される引数として受け取ります。

テンプレートで `readFile` 関数を使用するには、パスが *Hugo プロジェクトのルートディレクトリ* からの相対パスであることを以下のように確認します。

```go-html-template
{{ readFile "/content/templates/local-file-templates" }}
```

### `readFile` の例: プロジェクトファイルをコンテンツに追加する {#readfile-example-add-a-project-file-to-content}

`readFile` は関数であるため、テンプレートでのみ使用することができ、コンテンツでは使用できません。ただし、 `readFile` を呼び出し、最初の引数を関数に通し、オプションの 2 番目の引数で Markdown プロセッサーを通してファイルを送信するシンプルな [ショートコード テンプレート][sct] を作成することが可能です。このショートコードをコンテンツに追加するパターンは以下のようになります。

```go-html-template
{{</* readfile file="/path/to/local/file.txt" markdown="true" */>}}
```

{{% warning %}}
テーマの [カスタム ショートコード](/templates/shortcode-templates/) を `readFile` で作成する場合、ショートコードの使用はプロジェクトルートを参照し、`themes` ディレクトリを参照 *しない* ことに注意してください。
{{% /warning %}}

[called directly in the Hugo docs]: https://github.com/gohugoio/hugoDocs/blob/master/content/en/templates/files.md
[dirindex]: https://github.com/gohugoio/hugo/blob/master/docs/layouts/shortcodes/directoryindex.html
[osfileinfo]: https://golang.org/pkg/os/#FileInfo
[readDir]: /functions/readdir/
[readFile]: /functions/readfile/
[sc]: /content-management/shortcodes/
[sct]: /templates/shortcode-templates/
[readfilesource]: https://github.com/gohugoio/hugoDocs/blob/master/layouts/shortcodes/readfile.html
[testfile]: https://github.com/gohugoio/hugoDocs/blob/master/content/en/readfiles/testing.txt
