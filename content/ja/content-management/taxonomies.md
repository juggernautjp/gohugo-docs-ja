---
aliases:
- /taxonomies/overview/
- /taxonomies/usage/
- /indexes/overview/
- /doc/indexes/
- /extras/indexes
categories:
- content management
date: "2017-02-01"
description: Hugo は、ユーザー定義のタクソノミーをサポートしています。
draft: false
keywords:
- taxonomies
- metadata
- front matter
- terms
linktitle: null
menu:
  docs:
    parent: content-management
    weight: 150
publishdate: "2017-02-01"
title: タクソノミー
toc: true
weight: 150
---

## タクソノミーとは? {#what-is-a-taxonomy}

Hugo では、**タクソノミー** と呼ばれるユーザー定義のコンテンツのグループ分けをサポートしています。タクソノミーとは、コンテンツ間の論理的な関係を分類したものです。

### 定義 {#definitions}

タクソノミー
: コンテンツを分類するために使用される分類法

用語
: タクソノミー内のキー

値
: 用語に割り当てられたコンテンツの一部


## タクソノミーの例: 映画の Web サイト {#example-taxonomy-movie-website}

映画に関する Web サイトを作成しているとします。 以下のタクソノミーを含めることができます。

* Actors (俳優)
* Directors (監督)
* Studios (スタジオ)
* Genre (ジャンル)
* Year (年)
* Awards (賞)

次に、それぞれの映画で、これらのタクソノミーの用語を指定します (つまり、それぞれの映画コンテンツファイルの [フロントマター][front matter] に記述します)。これらの用語から、Hugo は自動的に各俳優、監督、スタジオ、ジャンル、年、賞のページを作成し、それぞれが特定の俳優、監督、スタジオ、ジャンル、年、賞に一致するすべての映画のリストを作成します。

### 映画タクソノミーの構成 {#movie-taxonomy-organization}

映画サイトの例で続けると、以下はタクソノミーの観点からのコンテンツの関係を示しています。

```txt
俳優                             <- タクソノミー
    ブルース・ウィリス            <- 用語
        シックスセンス            <- 値
        アンブレイカブル          <- 値
        ムーンライズ・キングダム   <- 値
    サミュエル・L・ジャクソン      <- 用語
        アンブレイカブル          <- 値
        アベンジャーズ            <- 値
        トリプル X                <- 値
```

コンテンツから見れば、使用するデータやラベルは同じでも、関係性が違って見えるはずです。

```txt
アンブレイカブル                   <- 値
    俳優                          <- タクソノミー
        ブルース・ウィリス         <- 用語
        サミュエル・L・ジャクソン   <- 用語
    監督                          <- タクソノミー
        M・ナイト・シャマラン      <- 用語
    ...
ムーンライズ・キングダム            <- 値
    俳優                          <- タクソノミー
        ブルース・ウィリス         <- 用語
        ビル・マーレイ             <- 用語
    監督                          <- タクソノミー
        ウェス・アンダーソン        <- 用語
    ...
```

## Hugo タクソノミーのデフォルト {#default-taxonomies}

Hugo はタクソノミーをネイティブにサポートしています。

[サイト設定][config] ファイルに一行も追加しなくても、Hugo は自動的に `tags` と `categories` にタクソノミーを作成します。これは、以下のように手動で [タクソノミーを設定する](#configure-taxonomies) のと同じことになります。

{{< code-toggle copy="false" >}}
[taxonomies]
  tag = "tags"
  category = "categories"
{{</ code-toggle >}}

Hugo にタクソノミーを作成させたくない場合は、[サイト設定][config] で `disableKinds` を以下のように設定します。

{{< code-toggle copy="false" >}}
disableKinds = ["taxonomy","term"]
{{</ code-toggle >}}

{{% page-kinds-ja %}}

### デフォルトの宛先 {#default-destinations}

タクソノミーが使用され、[タクソノミー テンプレート][taxonomy templates] が提供されると、Hugo は自動的にタクソノミーのすべての用語をリストしたページと、各用語に関連するコンテンツのリストを含む個々のページの両方を作成することになります。たとえば、`categories` タクソノミーを設定で宣言し、コンテンツのフロントマターで使用すると、以下のページが作成されます。

* `example.com/categories/` に、すべての [タクソノミー内の用語][terms within the taxonomy] を一覧表示する 1 つのページを作成します。
* [個々のタクソノミーのリストページ][taxonomy templates] (たとえば、`/categories/development/`) は、それぞれの用語に対して、任意のコンテンツファイルの [フロントマター][front matter] の中でそのタクソノミーの一部としてマークされたすべてのページのリストを表示します。

## タクソノミーを設定する {#configure-taxonomies}

[デフォルト]({{< relref "taxonomies.md#default-taxonomies" >}}) 以外のカスタム タクソノミーをサイト全体で使用する前に、[サイト設定][config] で定義する必要があります。各タクソノミーの複数形と単数形のラベルを指定する必要があります。 たとえば、TOML では `singular key = "plural value"`、YAML では `singular key: "plural value"` となります。

### 例 "シリーズ" という名前のカスタム タクソノミーを追加する {#example-adding-a-custom-taxonomy-named-series}

{{% note %}}
カスタムタクソノミーを追加する際に、 _カスタムタクソノミーを残しておきたい場合は_、デフォルト タクソノミーにそれらを入れる必要があります。
{{% /note %}}

{{< code-toggle copy="false" >}}
[taxonomies]
  tag = "tags"
  category = "categories"
  series = "series"
{{</ code-toggle >}}

### 例: デフォルトのタクソノミーを削除する {#example-removing-default-taxonomies}

デフォルトの `tags` タクソノミーのみを使用し、 サイトの `categories` タクソノミーを削除したい場合は、 [サイト設定][config] の `taxonomies` 値を変更することで実行できます。

{{< code-toggle copy="false" >}}
[taxonomies]
  tag = "tags"
{{</ code-toggle >}}

すべてのタクソノミーを完全に無効にしたい場合は、[Hugo タクソノミーのデフォルト]({{< relref "taxonomies.md#default-taxonomies" >}}) の `disableKinds` の使い方を参照してください。

{{% note %}}
タクソノミーのリストとタクソノミーの用語のページには、コンテンツとフロントマターを追加できます。この目的のために `_index.md` を追加する方法については、[「コンテンツ構成」](/content-management/organization/) を参照してください。

通常のページと同様に、タクソノミーのリストの [パーマリンク](/content-management/urls/) は設定可能ですが、タクソノミー用語ページのパーマリンクは設定できません。
{{% /note %}}

{{% warning %}}
設定オプション `preserveTaxonomyNames` は、 Hugo 0.55 で削除されました。

これで、関連するタクソノミー ノードで `.Page.Title` を使用すれば、元の値を取得できるようになりました。
{{% /warning %}}

## コンテンツにタクソノミーを追加する {#add-taxonomies-to-content}

サイトレベルでタクソノミーを定義すると、[コンテンツタイプ][content type] や [コンテンツセクション][content section] に関係なく、どんなコンテンツもタクソノミーに割り当てることができるようになります。

タクソノミーへのコンテンツの割り当ては、[フロントマター][front matter] で行われます。タクソノミーの *複数形* の名前を持つ変数を作成し、コンテンツタイプのインスタンスに適用したいすべての用語を割り当てるだけです。

{{% note %}}
あらかじめ設定されたタクソノミーや用語を含むコンテンツファイルをすばやく生成する機能が必要な場合は、[「Hugo アーキタイプ」](/content-management/archetypes/) のドキュメントを参照してください。
{{% /note %}}

### 例: タクソノミーを使ったフロントマター {#example-front-matter-with-taxonomies}

{{< code-toggle copy="false">}}
title = "Hugo: A fast and flexible static site generator"
tags = [ "Development", "Go", "fast", "Blogging" ]
categories = [ "Development" ]
series = [ "Go Web Dev" ]
slug = "hugo"
project_url = "https://github.com/gohugoio/hugo"
{{</ code-toggle >}}

## タクソノミーの順序付け {#order-taxonomies}

コンテンツファイルは、関連するタクソノミーのそれぞれに対して重みを割り当てることができます。 タクソノミーの重みは、[タクソノミーリスト テンプレート][taxonomy list templates] のコンテンツのソートや順序付けに使用でき、コンテンツファイルの [フロントマター][front matter] で宣言されます。 タクソノミーの重みを宣言するための規則は、`taxonomyname_weight` です。

以下の TOML と YAML の例では、コンテンツが 22 の重みを持ち、 `tags` タクソノミーの "a"、"b"、"c" の値に割り当てられたページをレンダリングする際に、順序付けの目的で使用されます。また、"d" カテゴリページをレンダリングする際には、44 の重みが割り当てられています。

### 例: タクソノミーの `weight` (重み) {#example-taxonomic-weight}

{{< code-toggle copy="false" >}}
title = "foo"
tags = [ "a", "b", "c" ]
tags_weight = 22
categories = ["d"]
categories_weight = 44
{{</ code-toggle >}}

タクソノミーの重みを使用することで、同じコンテンツが異なるタクソノミーの中で異なる位置に表示されることがあります。

{{% note "Limits to Ordering Taxonomies" %}}
現在、タクソノミーは、 [リストコンテンツのデフォルトの `weight => date` の順序](/templates/lists/#default-weight--date--linktitle--filepath) のみをサポートしています。より詳しい情報については、[「タクソノミー テンプレート」](/templates/taxonomy-templates/) のドキュメントを参照してください。
{{% /note %}}

## タクソノミーまたは用語にカスタム メタデータを追加する {#add-custom-metadata-to-a-taxonomy-or-term}

タクソノミーの用語にカスタム メタデータを追加する必要がある場合、その用語のページを `/content/<TAXONOMY>/<TERM>/_index.md` に作成し、そのフロントマターにメタデータを追加する必要があります。「俳優」の例を続けて、各俳優にウィキペディアのページへのリンクを追加したいとします。用語ページは以下のようになります。

{{< code file="/content/actors/bruce-willis/_index.md" >}}
---
title: "Bruce Willis"
wikipedia: "https://en.wikipedia.org/wiki/Bruce_Willis"
---
{{< /code >}}


[`urlize` template function]: /functions/urlize/
[content section]: /content-management/sections/
[content type]: /content-management/types/
[documentation on archetypes]: /content-management/archetypes/
[front matter]: /content-management/front-matter/
[taxonomy list templates]: /templates/taxonomy-templates/#taxonomy-list-templates
[taxonomy templates]: /templates/taxonomy-templates/
[terms within the taxonomy]: /templates/taxonomy-templates/#taxonomy-terms-templates "タクソノミーに関連する用語の順序を確認する"
[config]: /getting-started/configuration/
