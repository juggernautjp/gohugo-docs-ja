---
categories:
- content management
date: "2018-01-24"
description: ページリソース (画像、他のページ、ドキュメントなど) は、ページ相対 URL と独自のメタデータを持ちます。
draft: false
keywords:
- bundle
- content
- resources
linktitle: ページリソース
menu:
  docs:
    parent: content-management
    weight: 80
title: ページリソース
toc: true
weight: 80
---
ページリソースは [ページバンドル]({{< relref "/content-management/page-bundles" >}}) からしかアクセスできません。
`index.md` または `_index.md` ファイルをルートに持つディレクトリからしかアクセスできません。ページリソースは、それがバンドルされているページでのみ利用可能です。

この例では、`first-post` は音声、データ、ドキュメント、画像、動画を含む 10 のページリソースにアクセスするページバンドルです。
`second-post` もページバンドルですが、ページリソースを持たず、`first-post` に関連するページリソースに直接アクセスすることはできません。

```text
content
└── post
    ├── first-post
    │   ├── images
    │   │   ├── a.jpg
    │   │   ├── b.jpg
    │   │   └── c.jpg
    │   ├── index.md (root of page bundle)
    │   ├── latest.html
    │   ├── manual.json
    │   ├── notice.md
    │   ├── office.mp3
    │   ├── pocket.mp4
    │   ├── rating.pdf
    │   └── safety.txt
    └── second-post
        └── index.md (root of page bundle)
```

## プロパティ {#properties}

ResourceType
: リソースの [メディアタイプ](/templates/output-formats/#media-types) のメインタイプです。 たとえば、MIME タイプ `image/jpeg` のファイルは `ResourceType` が `image` となります。`Page` は `ResourceType` に `page` という値を持ちます。

Name
: デフォルト値は、ファイル名 (所有ページからの相対パス) です。フロントマターで設定できます。

Title
: デフォルト値は `.Name` と同じです。 フロントマターで設定できます。

Permalink
: リソースへの絶対 URL です。 `page` 型のリソースは値を持ちません。

RelPermalink
: リソースへの相対 URL です。 `page` 型のリソースは値を持ちません。

Content
: リソース自体のコンテンツです。 ほとんどのリソースでは、これはファイルの内容を含む文字列を返します。 これを使用してインライン リソースを作成します。

```go-html-template
{{ with .Resources.GetMatch "script.js" }}
  <script>{{ .Content | safeJS }}</script>
{{ end }}

{{ with .Resources.GetMatch "style.css" }}
  <style>{{ .Content | safeCSS }}</style>
{{ end }}

{{ with .Resources.GetMatch "img.png" }}
  <img src="data:{{ .MediaType }};base64,{{ .Content | base64Encode }}">
{{ end }}
```

MediaType
: `image/jpeg` のようなリソースの MIME タイプを指定します。

MediaType.MainType
: リソースの MIME タイプのメインタイプです。たとえば、MIME タイプが `application/pdf` のファイルは、MainType が `application` です。

MediaType.SubType
: リソースの MIME タイプのサブタイプです。たとえば、MIME タイプが `application/pdf` のファイルは、SubType が `pdf` です。 これはファイル拡張子と同じではないことに注意してください。たとえば、PowerPoint ファイルのサブタイプは `vnd.mspowerpoint` です。

MediaType.Suffixes
: リソースの MIME タイプに指定できるサフィックスのスライスです。

## メソッド {#methods}

ByType
: 指定されたタイプのページリソースを返します。

```go-html-template
{{ .Resources.ByType "image" }}
```
Match
: 指定された glob パターン ([例](https://github.com/gobwas/glob/blob/master/readme.md)) に一致する `Name` を持つすべてのページリソースを (スライスとして) 返します。 マッチングは大文字と小文字を区別しません。

```go-html-template
{{ .Resources.Match "images/*" }}
```

GetMatch
: `Match` と同じですが、最初にマッチしたものを返します。

### パターンマッチング {#pattern-matching}

```go
// Match/GetMatch を使って、この images/sunset.jpg を探しますか？
.Resources.Match "images/sun*" ✅
.Resources.Match "**/sunset.jpg" ✅
.Resources.Match "images/*.jpg" ✅
.Resources.Match "**.jpg" ✅
.Resources.Match "*" 🚫
.Resources.Match "sunset.jpg" 🚫
.Resources.Match "*sunset.jpg" 🚫

```

## ページリソースのメタデータ {#page-resources-metadata}

ページリソースのメタデータは、対応するページのフロントマターから `resources` という名前の配列/テーブル パラメータで管理されます。 [ワイルドカード](https://tldp.org/LDP/GNU-Linux-Tools-Summary/html/x11655.htm) を使って、値をバッチで割り当てることができます。

{{% note %}}
`page` タイプのリソースは、フロントマターから `Title` などを取得します。
{{% /note %}}

name
: `Name` で返される値を設定します。

{{% warning %}}
メソッド `Match`、`Get` および `GetMatch` は、リソースのマッチングに `Name` を使用します。
{{%/ warning %}}

title
: `Title` で返される値を設定します。

params
: カスタム キー/値のマップ。

### リソース メタデータの例 {#resources-metadata-example}

{{< code-toggle copy="false">}}
title: Application
date : 2018-01-25
resources :
- src : "images/sunset.jpg"
  name : "header"
- src : "documents/photo_specs.pdf"
  title : "Photo Specifications"
  params:
    icon : "photo"
- src : "documents/guide.pdf"
  title : "Instruction Guide"
- src : "documents/checklist.pdf"
  title : "Document Checklist"
- src : "documents/payment.docx"
  title : "Proof of Payment"
- src : "**.pdf"
  name : "pdf-file-:counter"
  params :
    icon : "pdf"
- src : "**.docx"
  params :
    icon : "word"
{{</ code-toggle >}}

上記の例から

- `sunset.jpg` は新しい `Name` を受け取り、`.GetMatch "header"` で見つけることができるようになりました。
- `documents/photo_specs.pdf` は `photo` アイコンを取得します。
- `documents/checklist.pdf`、`documents/guide.pdf`、`documents/payment.docx` は、 `title` で設定された `Title` を取得します。
- `documents/photo_specs.pdf` 以外のバンドル内のすべての `PDF` は、 `pdf` アイコンが表示されます。
- すべての `PDF` ファイルに、新しい `Name` が付けられます。 `name` パラメータは特別なプレースホルダ [`:counter`](#the-counter-placeholder-in-name-and-title) を含んでいるので、 `Name` は `pdf-file-1`、`pdf-file-2`、`pdf-file-3` のようになります。
- バンドル内のすべての docx は、`word` アイコンが表示されます。

{{% warning %}}
__順序が重要です__ --- `title`、`name`、`params`-**keys** の **最初の設定** 値のみが使用されます。連続したパラメータは、まだ設定されていないパラメータに対してのみ設定されます。上記の例では、`src = "documents/photo_specs.pdf"` の `.Params.icon` に、まず `"photo"` が設定されます。そのため、後で設定された `src = "**.pdf"` というルールによって、`"pdf"` にオーバーライドされることはありません。
{{%/ warning %}}

### `name` と `title` の `:counter` プレースホルダー {#the-counter-placeholder-in-name-and-title}

`:counter` は `name` と `title` パラメータの `resources` で認識される特別なプレースホルダーです。

カウンターは、`name` または `title` で最初に使用されたときに 1 から始まります。

たとえば、バンドルに `photo_specs.pdf`、`other_specs.pdf`、`guide.pdf`、`checklist.pdf` というリソースがあり、フロントマターに `resources` を指定した場合、以下のようになります。

{{< code-toggle copy="false">}}
[[resources]]
  src = "*specs.pdf"
  title = "Specification #:counter"
[[resources]]
  src = "**.pdf"
  name = "pdf-file-:counter"
{{</ code-toggle >}}

`Name` と `Title` は、以下のようにリソースファイルに割り当てられます。

| リソースファイル   | `Name`            | `Title`               |
|-------------------|-------------------|-----------------------|
| checklist.pdf     | `"pdf-file-1.pdf` | `"checklist.pdf"`     |
| guide.pdf         | `"pdf-file-2.pdf` | `"guide.pdf"`         |
| other\_specs.pdf  | `"pdf-file-3.pdf` | `"Specification #1"` |
| photo\_specs.pdf  | `"pdf-file-4.pdf` | `"Specification #2"` |
