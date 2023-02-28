---
aliases:
- /content/archetypes/
categories:
- content management
date: "2017-02-01"
description: アーキタイプは、新しいコンテンツを作るときに使用するテンプレートです。
draft: false
keywords:
- archetypes
- generators
- metadata
- front matter
linktitle: アーキタイプ
menu:
  docs:
    parent: content-management
    weight: 140
  quicklinks: null
publishdate: "2017-02-01"
title: アーキタイプ
toc: true
weight: 140
---

## アーキタイプとは? {#what-are-archetypes}

**アーキタイプ** は、プロジェクトの [archetypes ディレクトリ][archetypes directory] にあるコンテンツ テンプレートファイルで、あらかじめ設定された [フロントマター][front matter] と、場合によっては Web サイトの [コンテンツタイプ][content types] に対応するコンテンツ配置を含んでいます。これらは `hugo new` を実行したときに使用されます。


`hugo new` は `content-section` を使用して、プロジェクトに最適なアーキタイプ テンプレートを見つけます。 プロジェクトにアーキタイプ ファイルが含まれていない場合は、テーマの中も検索します。

{{< code file="archetype-example.sh" >}}
hugo new posts/my-first-post.md
{{< /code >}}

上記のコマンドにより、以下のテンプレートファイルで最初に見つかったアーキタイプ ファイルを使用して、`content/posts/my-first-post.md` に新しいコンテンツファイルを作成します。

1. `archetypes/posts.md`
2. `archetypes/default.md`
3. `themes/my-theme/archetypes/posts.md`
4. `themes/my-theme/archetypes/default.md`

最後の 2 つのリスト項目は、テーマを使用している場合にのみ適用され、例として `my-theme` というテーマ名が使用されます。

## 新しいアーキタイプ テンプレートを作成する {#create-a-new-archetype-template}

セクション `newsletter` とアーキタイプファイル `archetypes/newsletter.md` のための架空の例です。`archetypes/newsletter.md` に新しいファイルを作成し、テキストエディターで開いてください。

{{< code file="archetypes/newsletter.md" >}}
---
title: "{{ replace .Name "-" " " | title }}"
date: {{ .Date }}
draft: true
---

**Insert Lead paragraph here.**

## 新しいクールな投稿 {#new-cool-posts}

{{ range first 10 ( where .Site.RegularPages "Type" "cool" ) }}
* {{ .Title }}
{{ end }}
{{< /code >}}

新しいニュースレターを作成する場合は、以下のコマンドを実行します。

```bash
hugo new newsletter/the-latest-cool.stuff.md
```

アーキタイプのテンプレートに基づき、新しいニュースレター タイプのコンテンツファイルが作成されます。

**注意:** サイトは、アーキタイプ ファイルで `.Site` が使用されている場合にのみ構築されます。これは、大規模なサイトでは時間がかかる可能性があります。

上記の _newsletter タイプの archetype_ は、その可能性を示しています。Hugo の完全な `.Site` と Hugo のすべてのテンプレート関数がアーキタイプ ファイルの中で使用可能です。

## ディレクトリベースのアーキタイプ {#directory-based-archetypes}

Hugo `0.49` 以降、完全なディレクトリをアーキタイプ テンプレートとして使用できます。 以下のようなアーキタイプ ディレクトリが与えられた場合は、

```bash
archetypes
├── default.md
└── post-bundle
    ├── bio.md
    ├── images
    │   └── featured.jpg
    └── index.md
```

```bash
hugo new --kind post-bundle posts/my-post
```

上記のコマンドによって、`/content/posts/my-post` ディレクトリに `post-bundle` archetypes フォルダーと同じファイル セットを含む新しいフォルダーを作成します。 すべてのコンテンツファイル (`index.md` など) にはテンプレート ロジックを含めることができ、コンテンツの言語に対応する正しい `.Site` を受け取ります。

[archetypes directory]: /getting-started/directory-structure/
[content types]: /content-management/types/
[front matter]: /content-management/front-matter/
