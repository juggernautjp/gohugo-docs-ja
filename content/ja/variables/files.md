---
aliases:
- /variables/file-variables/
categories:
- variables and parameters
date: "2017-02-01"
description: "ファイル変数を使用して、ファイルによってサポートされる各ページのファイル関連の値にアクセスします。"
draft: false
keywords:
- files
lastmod: "2017-02-01"
menu:
  docs:
    parent: variables
    weight: 40
publishdate: "2017-02-01"
sections_weight: 40
title: ファイル変数
toc: false
weight: 40
---
## 変数 {#variables}

{{% note %}}
`.File.Path`、`.File.Dir`、および `.File.Filename` のパス区切り文字 (スラッシュまたはバックスラッシュ) は、OS によって異なります。 
{{% /note %}}

.File.Path
: (`string`) `content` ディレクトリからの相対パス。

.File.Dir
: (`string`) `content` ディレクトリからの相対パス (ファイル名を除く)。

.File.LogicalName
: (`string`) ファイル名。

.File.BaseFileName
: (`string`) 拡張子を除いたファイル名。

.File.TranslationBaseName
: (`string`) 拡張子と言語識別子を除いたファイル名。

.File.Ext
: (`string`) ファイル拡張子。

.File.Lang
: (`string`) 指定されたファイルに関連付けられた言語。


.File.ContentBaseName
: (`string`) ページがブランチバンドルまたはリーフバンドルの場合は、それを含むディレクトリの名前、それ以外の場合は `.TranslationBaseName`。

.File.Filename
: (`string`) 絶対ファイルパス。

.File.UniqueID
: (`string`) `.File.Path` の MD5 ハッシュ。

## 例 {#examples}

```text
content/
├── news/
│   ├── b/
│   │   ├── index.de.md   <-- leaf bundle
│   │   └── index.en.md   <-- leaf bundle
│   ├── a.de.md           <-- regular content
│   ├── a.en.md           <-- regular content
│   ├── _index.de.md      <-- branch bundle
│   └── _index.en.md      <-- branch bundle
├── _index.de.md
└── _index.en.md
```

上記のコンテンツ構造では、英語ページの `.File` オブジェクトには以下のプロパティが含まれます。

&nbsp;|通常コンテンツ|リーフバンドル|ブランチバンドル
:--|:--|:--|:--
Path|news/a.en.md|news/b/index.en.md|news/_index.en.md
Dir|news/|news/b/|news/
LogicalName|a.en.md|index.en.md|_index.en.md
BaseFileName|a.en|index.en|_index.en
TranslationBaseName|a|index|_index
Ext|md|md|md
Lang|en|en|en
ContentBaseName|a|b|news
Filename|/home/user/...|/home/user/...|/home/user/...
UniqueID|15be14b...|186868f...|7d9159d...

## 防御的なコーディング {#defensive-coding}

サイト上の一部のページは、ファイルによって裏付けられていない場合があります。 たとえば、以下のページです。

- トップレベル セクションページ
- タクソノミー ページ
- 用語ページ

バッキング ファイルがない場合、`.File` プロパティにアクセスしようとすると、Hugo は警告をスローします。 たとえば、以下のような警告です。

```text
WARN .File.ContentBaseName on zero object. Wrap it in if or with...
```

防御的にコーディングするには、以下のようにします。

```go-html-template
{{ with .File }}
  {{ .ContentBaseName }}
{{ end }}
```
