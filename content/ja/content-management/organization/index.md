---
aliases:
- /content/sections/
categories:
- content management
- fundamentals
date: "2017-02-01"
description: Hugo は、ソースのコンテンツを整理するのに有効なのと同じ構造を、レンダリングされるサイトの整理にも使用することを前提としています。
draft: false
keywords:
- sections
- content
- organization
- bundle
- resources
linktitle: コンテンツ構成
menu:
  docs:
    parent: content-management
    weight: 20
publishdate: "2017-02-01"
title: コンテンツ構成
toc: true
weight: 20
---

## ページバンドル {#page-bundles}

Hugo `0.32` では、ページ関連の画像やその他のリソースが `Page Bundles` にパッケージされていることが発表されました。

これらの用語は関連しており、全体像を把握するためには、[「ページリソース」](/content-management/page-resources) や [「画像処理」](/content-management/image-processing) についても読む必要があります。

{{< imgproc 1-featured Resize "300x" >}}
図では、3 つのバンドルが示されています。 ホームページバンドルには、他のコンテンツページを含めることはできませんが、他のファイル (画像など) を含めることは可能であることに注意してください。
{{< /imgproc >}}


{{% note %}}
バンドルのドキュメントは、現在、 **作業中** です。 これについては、より包括的なドキュメントを近日中に公開する予定です。
{{% /note %}}


## コンテンツソースの構成 {#organization-of-content-source}

Hugo では、レンダリングされたウェブサイトを反映するようにコンテンツを構成する必要があります。

Hugo はあらゆるレベルでネストされたコンテンツをサポートしていますが、トップレベル (つまり `content/<DIRECTORIES>`) は Hugo では特別で、レイアウトなどを決定するために使用するコンテンツタイプと見なされます。 セクションをネストする方法など、セクションの詳細については、[セクション][sections] を参照してください。

追加の設定なしで、以下が自動的に動作します。

```txt
.
└── content
    └── about
    |   └── index.md  // <- https://example.com/about/
    ├── posts
    |   ├── firstpost.md   // <- https://example.com/posts/firstpost/
    |   ├── happy
    |   |   └── ness.md  // <- https://example.com/posts/happy/ness/
    |   └── secondpost.md  // <- https://example.com/posts/secondpost/
    └── quote
        ├── first.md       // <- https://example.com/quote/first/
        └── second.md      // <- https://example.com/quote/second/
```

## Hugo のパスの内訳 {#path-breakdown-in-hugo}

以下は、コンテンツの構成と、Hugo の Web サイトのレンダリング時の出力 URL 構造との関係を示すものです。これらの例は、Hugo のデフォルトの動作である [プリティ URL][pretty] を使用していることを前提としています。また、この例では [サイトの設定ファイル][config] で `baseURL = "https://example.com"` というキーと値を指定していると仮定しています。

### インデックスページ: `_index.md` {#index-pages-indexmd}

`_index.md` は Hugo において特別な役割を担っています。これによって、[リストテンプレート][lists] にフロントマターやコンテンツを追加できます。これらのテンプレートには、[セクション テンプレート][section templates]、[タクソノミー テンプレート][taxonomy templates]、[タクソノミー用語テンプレート][taxonomy terms templates]、[ホームページ テンプレート][homepage template] が含まれます。

{{% note %}}
**ヒント:** [`.Site.GetPage` 関数](/functions/getpage/) を使用して、`_index.md` 内のコンテンツとメタデータへの参照を取得できます。
{{% /note %}}

`_index.md` はホームページに 1 つ、コンテンツセクション、タクソノミー、タクソノミー用語のそれぞれに 1 つずつ作成できます。以下は、Hugo の Web サイトの `posts` セクションのリストページのコンテンツとフロントマターを含む `_index.md` の典型的な配置を示したものです。


```txt
.         url
.       ⊢--^-⊣
.        path    slug
.       ⊢--^-⊣⊢---^---⊣
.           filepath
.       ⊢------^------⊣
content/posts/_index.md
```

ビルド時には、以下の出力先に、関連する値が出力されます。

```txt

                     url ("/posts/")
                    ⊢-^-⊣
       baseurl      section ("posts")
⊢--------^---------⊣⊢-^-⊣
        permalink
⊢----------^-------------⊣
https://example.com/posts/index.html
```

[セクション][sections] は好きなだけ深くネストすることができます。理解すべき重要なことは、セクションツリーを完全にナビゲートするためには、少なくとも一番下のセクションにはコンテンツファイル (つまり `_index.md`) を含める必要があるということです。

### セクション内のシングルページ {#single-pages-in-sections}

各セクション内の単一のコンテンツファイルは、[シングルページ テンプレート][singles] としてレンダリングされます。以下は、`posts` の中にある単一の `post` の例です。

```txt
                   path ("posts/my-first-hugo-post.md")
.       ⊢-----------^------------⊣
.      section        slug
.       ⊢-^-⊣⊢--------^----------⊣
content/posts/my-first-hugo-post.md
```

Hugo がサイトをビルドすると、コンテンツは以下の宛先に出力されます。

```txt

                               url ("/posts/my-first-hugo-post/")
                   ⊢------------^----------⊣
       baseurl     section     slug
⊢--------^--------⊣⊢-^--⊣⊢-------^---------⊣
                 permalink
⊢--------------------^---------------------⊣
https://example.com/posts/my-first-hugo-post/index.html
```


## パスの説明 {#paths-explained}

以下の概念は、プロジェクトの構成と、Web サイトの出力をビルドする際の Hugo のデフォルトの動作の関係について、より深く理解するのに役立ちます。

### `section`

デフォルトのコンテンツタイプは、コンテンツアイテムが格納されるセクションによって決定されます。 `section` はプロジェクトの `content` ディレクトリ内の位置によって決まります。`section` はフロントマターで指定したりオーバーライドしたりすることは *できません*。

### `slug`

`slug` は URL パスの最後のセグメントで、ファイル名で定義され、オプションでフロントマターの `slug` 値で上書きされる。
詳細は、[URL 管理](/content-management/urls/#slug) を参照してください。

### `path`

コンテンツの `path` は、セクションのファイルへのパスによって決定されます。ファイルの `path` は、

* コンテンツの場所へのパスに基づき、**かつ**
* スラグを含みません

### `url`

`url` は URL パス全体であり、ファイルパスによって定義され、オプションでフロントマターの `url` 値によって上書きされます。
詳細は、[URL 管理](/content-management/urls/#slug) を参照してください。

[config]: /getting-started/configuration/
[formats]: /content-management/formats/
[front matter]: /content-management/front-matter/
[getpage]: /functions/getpage/
[homepage template]: /templates/homepage/
[homepage]: /templates/homepage/
[lists]: /templates/lists/
[pretty]: /content-management/urls/#appearance
[section templates]: /templates/section-templates/
[sections]: /content-management/sections/
[singles]: /templates/single-page-templates/
[taxonomy templates]: /templates/taxonomy-templates/
[taxonomy terms templates]: /templates/taxonomy-templates/
[types]: /content-management/types/
[urls]: /content-management/urls/
