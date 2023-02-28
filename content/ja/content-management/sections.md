---
aliases:
- /content/sections/
categories:
- content management
date: "2017-02-01"
description: Hugo は、コンテンツにマッチした **セクションツリー** を生成します。
draft: false
keywords:
- lists
- sections
- content types
- organization
lastmod: "2017-02-01"
linktitle: セクション
menu:
  docs:
    parent: content-management
    weight: 120
publishdate: "2017-02-01"
title: コンテンツセクション
toc: true
weight: 120
---

**セクション** は、`content/` ディレクトリの下の組織構造に基づいて定義されるページのコレクションです。

デフォルトでは、[ブランチバンドル][branch bundles] を構成する場合、`content/` の下のすべての **第 1 レベル** ディレクトリは独自のセクション (**ルート セクション**) を形成します。
[リーフバンドル][leaf bundles] だけのディレクトリは、第 1 レベルのディレクトリであるにもかかわらず、独自のセクションを形成することは *ありません*。

ユーザーがより深いレベルでセクション `foo` を定義する必要がある場合には、 `_index.md` ファイルを含む `foo` という名前のディレクトリを作成する必要があります (より詳細な情報は、[ブランチバンドル][branch bundles] を参照してください)。


{{% note %}}
**セクション** は、フロントマター パラメータで定義またはオーバーライドすることはできません。 それはコンテンツ組織構造から厳密に導出されます。
{{% /note %}}

## ネストされたセクション {#nested-sections}

セクションは、必要なだけ深くネストできます。

```bash
content
└── blog        <-- content/ の下の第 1 レベルのディレクトリのため、セクション
    ├── funny-cats
    │   ├── mypost.md
    │   └── kittens         <-- _index.md を含むため、セクション
    │       └── _index.md
    └── tech                <-- _index.md を含むため、セクション
        └── _index.md
```

**理解すべき重要な点は、セクションツリーを完全にナビゲートするためには、少なくとも最下段のセクションはコンテンツファイル (たとえば、 `_index.md`) が必要であるということです。**

{{% note %}}
テンプレート選択との関連で **セクション** について話すとき、現在のところ、それは常に *ルートセクション* のみです (`/blog/funny-cats/mypost/ => blog`)。

サブセクションに特定のテンプレートが必要な場合は、フロントマターで `type` か `layout` のどちらかを調整する必要があります。
{{% /note %}}

## 例: パンくずリスト {#example-breadcrumb-navigation}

利用可能な [セクション変数とメソッド](#section-page-variables-and-methods) を使用すると、強力なナビゲーションを構築できます。一般的な例の 1 つは、パンくずリストを表示するパーシャル (部分テンプレート) です。

{{< code file="layouts/partials/breadcrumb.html" download="breadcrumb.html" >}}
<ol  class="nav navbar-nav">
  {{ template "breadcrumbnav" (dict "p1" . "p2" .) }}
</ol>
{{ define "breadcrumbnav" }}
{{ if .p1.Parent }}
{{ template "breadcrumbnav" (dict "p1" .p1.Parent "p2" .p2 )  }}
{{ else if not .p1.IsHome }}
{{ template "breadcrumbnav" (dict "p1" .p1.Site.Home "p2" .p2 )  }}
{{ end }}
<li{{ if eq .p1 .p2 }} class="active" aria-current="page" {{ end }}>
  <a href="{{ .p1.Permalink }}">{{ .p1.Title }}</a>
</li>
{{ end }}
{{< /code >}}

## セクション ページの変数とメソッド {#section-page-variables-and-methods}

[ページ変数](/variables/page/) も参照してください。

{{< readfile file="/content/ja/readfiles/sectionvars.md" markdown="true" >}}

## コンテンツセクションのリスト {#content-section-lists}

Hugo は、各 *ルートセクション* に、そのセクションのすべてのコンテンツを一覧表示するページを自動的に作成します。これらのページのレンダリングする方法のカスタマイズの詳細については、[「セクション テンプレート」][section templates] のドキュメントを参照してください。

## コンテンツ *セクション* とコンテンツ *タイプ* の違い {#content-Section-vs-content-type}

デフォルトでは、セクション内で作成されたものはすべて、*ルートセクション* 名と一致する [コンテンツ `タイプ`][content type] を使用します。 たとえば、Hugo は `posts/post-1.md` が `posts` というコンテンツ `type` を持っていると仮定します。 `posts` セクションに [アーキタイプ][archetype] を使用している場合、Hugo は `archetypes/posts.md` で見つけたものに従ってフロントマターを生成します。

[archetype]: /content-management/archetypes/
[content type]: /content-management/types/
[directory structure]: /getting-started/directory-structure/
[section templates]: /templates/section-templates/
[leaf bundles]: /content-management/page-bundles/#leaf-bundles
[branch bundles]: /content-management/page-bundles/#branch-bundles
