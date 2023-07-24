---
aliases:
- /contribute/docs/
categories:
- contribute
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
    weight: 30
title: Hugo ドキュメントに貢献する
toc: true
weight: 30
---

## GitHub ワークフロー {#github-workflow}

ステップ 1
: [ドキュメント リポジトリ][documentation repository] をフォークする。

ステップ 2
: フォークしたリポジトリをクローンする。

ステップ 3
: わかりやすい名前を付けて新しいブランチを作成する。

```bash
git checkout -b fix/typos-site-variables
```

ステップ 4
: 変更を加える。

ステップ 5
: 説明的なコミット メッセージ (通常は 50 文字以下) を使用して変更をコミットします。 変更により 1 つ以上の未解決の [問題][issues] が解決される場合は、"Closes" キーワードを含めます。

```bash
git commit -m "Fix typos on site variables page

Closes #1234
Closes #5678"
```

ステップ 6
: 新しいブランチをドキュメント リポジトリのフォークにプッシュします。

ステップ 7
: [ドキュメント リポジトリ][documentation repository] にアクセスし、プルリクエスト (PR) を作成します。

[documentation repository]: https://github.com/gohugoio/hugoDocs/
[issues]: https://github.com/gohugoio/hugoDocs/issues

ステップ 8
: プロジェクトのメンテナがあなたの PR をレビューし、変更を要求するかもしれません。メンテナがあなたの PR をマージした後で、ブランチを削除することもできます。

## サンプルコードを含む {#including-sample-code}

{{% note %}}
コード サンプル内にショートコード呼び出しを含めるには、以下の構文を使用します。

`{{</*/* foo */*/>}}`\
`{{%/*/* foo */*/%}}`
{{% /note %}}

### フェンス コードブロック {#fenced-code-blocks}

フェンス コードブロックを使用する場合は、以下のように記述言語を含めます。

````text
```go-html-template
{{ if eq $foo "bar" }}
  {{ print "foo is bar" }}
{{ end }}
```
````

上記のコードは、以下のようにレンダリングされます。

```go-html-template
{{ if eq $foo "bar" }}
  {{ print "foo is bar" }}
{{ end }}
```

### code ショートコード {#the-code-shortcode}

ファイル名とクリップボードへのコピーボタンを含めるには、`code` ショートコードを使用します。
このショートコードでは、以下のオプションのパラメータを使用できます。

copy
: (`bool`)  `true`の場合、クリップボードにコピーするボタンを表示しま。デフォルトは `true` です。

file
: (`string`) 表示するファイル名です。 `lang` パラメータを指定しない場合、ファイルの拡張子がコード言語を決定します。

lang
: (`string`) コードの言語です。デフォルトは `text` です。

````text
{{</* code file="layouts/_default_/single.html" */>}}
{{ if eq $foo "bar" }}
  {{ print "foo is bar" }}
{{ end }}
{{</* /code */>}}
````

上記のコードは、以下のようにレンダリングされます。

{{< code file="layouts/_default_/single.html" >}}
{{ if eq $foo "bar" }}
  {{ print "foo is bar" }}
{{ end }}
{{< /code >}}

### code-toggle ショートコード {#the-codetoggle-shortcode}

`code-toggle` ショートコードを使用して、サイト構成、フロントマター、またはデータファイルの例を表示します。
このショートコードは、以下のオプションのパラメータを受け付けます。

copy
: (`bool`)  `true` の場合、クリップボードにコピーするボタンを表示します。デフォルトは `true` です。

file
: (`string`) 表示するファイル名です。サイト構成とデータファイルの例では、ファイル拡張子を省略します。

fm
: (`bool`)  `true` の場合、コードをフロントマターとして表示します。デフォルトは `false` です。

#### サイト設定の例 {#site-configuration-example}

```text
{{</* code-toggle file="hugo" */>}}
baseURL = 'https://example.org'
languageCode = 'en-US'
title = "Example Site"
{{</* /code-toggle */>}}
```

上記のコードは、以下のようにレンダリングされます。

{{< code-toggle file="hugo" >}}
baseURL = 'https://example.org'
languageCode = 'en-US'
title = "Example Site"
{{< /code-toggle >}}

#### フロントマターの例 {#front-matter-example}

```text
{{</* code-toggle file="content/about.md" fm=true */>}}
title = "About"
date = 2023-04-02T12:47:24-07:00
draft = false
{{</* /code-toggle */>}}
```

上記のコードは、以下のようにレンダリングされます。

{{< code-toggle file="content/about.md" fm=true >}}
title = "About"
date = 2023-04-02T12:47:24-07:00
draft = false
{{< /code-toggle >}}

## アドモニション {#admonitions}

コンテンツへの注意を引くには、`note` ショートコードを使用します。
このショートコードを呼び出すときは、`{{%/* */%}}` 表記を使用してください。

```text
{{%/* note */%}}
This is **bold** text.
{{%/* /note */%}}
```
上記のコードは、以下のようにレンダリングされます。

{{% note %}}
This is **bold** text.
{{% /note %}}
