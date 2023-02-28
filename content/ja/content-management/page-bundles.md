---
categories:
- content management
date: "2018-01-24T13:09:00-05:00"
description: ページバンドルを使用したコンテンツ構成
draft: false
keywords:
- page
- bundle
- leaf
- branch
linktitle: ページバンドル
menu:
  docs:
    identifier: page-bundles
    parent: content-management
    weight: 30
title: ページバンドル
toc: true
weight: 30
---

ページバンドルは、[ページリソース](/content-management/page-resources/) をグループ化するための方法です。

ページバンドルは、以下のいずれかになります。

- リーフバンドル (「リーフ」は、子がないことを意味します)
- ブランチバンドル (ホームページ、セクション、タクソノミー用語、タクソノミーリスト)

|                        | リーフバンドル                           | ブランチバンドル                              |
|------------------------|-----------------------------------------|----------------------------------------------|
| 使用方法                | シングルページのコンテンツと添付ファイル集     | セクションページ (トップページ、セクション、タクソノミー用語、タクソノミーリスト) の添付ファイル集       |
| インデックス ファイル名  | `index.md` [^fn:1]                    | `_index.md` [^fn:1]                |
| 使用可能なリソース       | ページと非ページ (画像、PDF など) のタイプ         | 非ページ (画像、PDF など) タイプのみ        |
| リソースを置く場所       | リーフバンドルのディレクトリ内の任意のディレクトリレベル。 | ブランチバンドルのディレクトリ **の** ディレクトリレベル、つまり `_index.md` を含むディレクトリのみ ([参照](https://discourse.gohugo.io/t/question-about-content-folder-structure/11822/4?u=kaushalmodi)). |
| レイアウトタイプ         | `single`                                | `list`                                      |
| ネスト                  | その下にさらにバンドルをネストできません    | その下にリーフバンドルまたはブランチバンドルを入れ子にできます      |
| 例                      | `content/posts/my-post/index.md`        | `content/posts/_index.md`                 |
| 非インデックスページ ファイルからのコンテンツ... | ページリソースとしてのみアクセス可能    | 通常のページとしてのみアクセス可能     |


## リーフバンドル {#leaf-bundles}

_リーフバンドル_ とは、`content/` ディレクトリ内の任意の階層にある、**`index.md`** ファイルを含むディレクトリのことを指します。

### リーフバンドル構成の例 {#examples-of-leaf-bundle-organization}

```text
content/
├── about
│   ├── index.md
├── posts
│   ├── my-post
│   │   ├── content1.md
│   │   ├── content2.md
│   │   ├── image1.jpg
│   │   ├── image2.png
│   │   └── index.md
│   └── my-other-post
│       └── index.md
│
└── another-section
    ├── ..
    └── not-a-leaf-bundle
        ├── ..
        └── another-leaf-bundle
            └── index.md
```

上記の例の `content/` ディレクトリには、以下の 4 つのリーフバンドルがあります。

`about`
: このリーフバンドルはルートレベル (`content` ディレクトリの直下) にあり、`index.md` のみを持ちます。

`my-post`
: このリーフバンドルには、`index.md` と他の2つのコンテンツの Markdown ファイル、そして2つの画像ファイルが含まれています。

- image1, image2:
これらの画像は `my-post` のページリソースであり、 `my-post/index.md` リソースでのみ利用可能です。

- content1, content2:
これらのコンテンツファイルは `my-post` のページリソースであり、 `my-post/index.md` リソースでのみ利用可能です。
   これらのコンテンツファイルは、個別のページとしてレンダリングされることは **ありません** 。

`my-other-post`
: このリーフバンドルには `index.md` のみが含まれています。

`another-leaf-bundle`
: このリーフバンドルは、いくつかのディレクトリの下にネストされています。このバンドルには `index.md` のみが含まれています。

{{% note %}}
リーフバンドルが作成される階層の深さは、他の **リーフバンドル** 内にない限り、重要ではありません。
{{% /note %}}


### ヘッドレス バンドル {#headless-bundle}

ヘッドレス バンドルとは、以下のような、どこにも公開されないように設定されたバンドルのことです。

- `Permalink` を持たず、`public/` にレンダリングされた HTML を持ちません。
- `.Site.RegularPages` などの一部にはなりません。

しかし、`.Site.GetPage` で取得することができます。以下はその例です。

```go-html-template
{{ $headless := .Site.GetPage "/some-headless-bundle" }}
{{ $reusablePages := $headless.Resources.Match "author*" }}
<h2>Authors</h2>
{{ range $reusablePages }}
    <h3>{{ .Title }}</h3>
    {{ .Content }}
{{ end }}
```

_この例では、`some-headless-bundle` は、`.Name` が `"author*` に一致する 1 つ以上の **ページ** リソースを含むヘッドレス バンドルであると想定しています。_

上記の例の説明::

1. `some-headless-bundle` ページの "object" を取得します。
2. この _ページバンドル_ に含まれるリソースのうち、 `.Resources.Match` を使って `"author*"` にマッチするものを _スライス_ として収集します。
3. ネストされたページの _スライス_ をループして、その `.Title` と `.Content` を出力します。

---

リーフバンドルは、フロントマター (`index.md` 内) に以下を追加することでヘッドレス バンドルにすることができます。

```toml
headless = true
```

このようなヘッドレス ページバンドルには、さまざまな使用例があります。

- メディアギャラリーの共有
- 再利用可能なページコンテンツ "スニペット"

## ブランチバンドル {#branch-bundles}

_ブランチバンドル_ とは、`content/` ディレクトリ内の任意の階層にある、少なくとも **`_index.md`** ファイルを含むディレクトリのことを指します。

この `_index.md` は、 `content/` ディレクトリの直下に置くこともできます。

{{% note %}}
ここでは例として md (markdown) を使用します。 Hugo によって認識されるコンテンツ タイプである限り、任意のファイル タイプをコンテンツ リソースとして使用できます。
{{% /note %}}


### ブランチバンドル構成の例 {#examples-of-branch-bundle-organization}

```text
content/
├── branch-bundle-1
│   ├── branch-content1.md
│   ├── branch-content2.md
│   ├── image1.jpg
│   ├── image2.png
│   └── _index.md
└── branch-bundle-2
    ├── _index.md
    └── a-leaf-bundle
        └── index.md
```

上記の例の `content/` ディレクトリには、2つのブランチバンドル(とリーフバンドル)があります。

`branch-bundle-1`
: このブランチバンドルには、`_index.md`、その他 2つのコンテンツの Markdown ファイル、2つの画像ファイルが含まれています。

`branch-bundle-2`
: このブランチバンドルは `_index.md` とネストしたリーフバンドルが含まれています。

{{% note %}}
ブランチバンドルが作成される階層の深さは重要ではありません。
{{% /note %}}

[^fn:1]: `.md` 拡張子 はほんの一例です。拡張子は `.html` や `.json` など、有効な MIME タイプであれば何でも構いません。
