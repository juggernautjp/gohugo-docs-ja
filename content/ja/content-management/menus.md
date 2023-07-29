---
aliases:
- /extras/menus/
categories:
- content management
date: "2017-02-01"
description: Hugo は、シンプルでありながら強力なメニューシステムを備えています。
draft: false
keywords:
- menus
lastmod: "2017-03-31"
linktitle: メニュー
menu:
  docs:
    parent: content-management
    weight: 190
publishdate: "2017-02-01"
title: メニュー
toc: true
weight: 190
---

## 概要 {#overview}

サイトのメニューを作成するには、以下のようにします。

1. メニューエントリを定義する
2. 各エントリを [ローカライズ][Localize] します
3. [テンプレート][template] を使用してメニューをレンダリングします

フラットまたはネストされた複数のメニューを作成します。 たとえば、ヘッダーにはメイン メニューを作成し、フッターには別のメニューを作成します。

メニュー エントリを定義するには、以下の 3 つの方法があります。

1. 自動的に
2. フロントマターで
3. サイト設定で

{{% note %}}
メニューを定義するとき、これらの方法を組み合わせて使用することもできますが、サイト全体を通して一つの方法を使用する方が、メニューの概念化と保守が容易になります。
{{% /note %}}

## 自動的に定義する {#define-automatically}

サイトの最上位セクションごとにメニューエントリを自動的に定義するには、サイト設定でセクション ページ メニューを有効にします。

{{< code-toggle file="hugo" copy=false >}}
sectionPagesMenu = "main"
{{< /code-toggle >}}

これにより、テンプレートの `site.Menus.main` でアクセスできるメニュー構造が作成されます。
詳細は、[メニューテンプレート][menu templates] を参照してください。

## フロントマターで定義する {#define-in-front-matter}

「メイン」メニューにページを追加するには、以下のようにします。

{{< code-toggle file="content/about.md" copy=false fm=true >}}
title = 'About'
menu = 'main'
{{< /code-toggle >}}

テンプレート内の `site.Menus.main` のエントリーにアクセスしてください。
詳細は、[メニューテンプレート][menu templates] を参照してください。

「メイン」メニューと「フッター」メニューにページを追加するには、以下のようにします。

{{< code-toggle file="content/contact.md" copy=false fm=true codeId="c2" >}}
title = 'Contact'
menu = ['main','footer']
{{< /code-toggle >}}

テンプレート内の `site.Menus.main` および `site.Menus.footer` を使用してエントリにアクセスします。 
詳細は、[メニューテンプレート][menu templates] を参照してください。

### プロパティ {#properties-front-matter}

これらのプロパティは、フロントマターでメニュー項目を定義するときに以下のように使用します。

identifier
: (`string`) 2 つ以上のメニュー項目が同じ `name` を持つとき、または翻訳テーブルを使って `name` をローカライズするときに必要です。文字で始まり、その後にアルファベット、数字、アンダースコアが続く必要があります。

name
: (`string`) メニューエントリをレンダリングするときに表示するテキストです。

params
: (`map`) メニューエントリのユーザー定義プロパティです。

parent
: (`string`) 親メニューエントリの `identifier` を指定します。 `identifier` が定義されていない場合は `name` を使用します。ネストされたメニューの子エントリに必要です。

post
: (`string`) メニューエントリをレンダリングするときに後ろに追加する HTML。

pre
: (`string`) メニューエントリをレンダリングするときに先頭に追加する HTML。

title
: (`string`) レンダリングされたメニューエントリの HTML `title` 属性。

weight
: (`int`) 0 ではない整数値で、メニューのルートからの相対的な位置、 または子エントリの場合は親からの相対的な位置を表します。軽いエントリは上に浮き、重いエントリは下に沈みます。

### 例 {#example-front-matter}

このフロントマターのメニュー エントリは、以下のような使用可能なプロパティの一部を示しています。

{{< code-toggle file="content/products/software.md" copy=false fm=true >}}
title = 'Software'
[menu.main]
parent = 'Products'
weight = 20
pre = '<i class="fa-solid fa-code"></i>'
[menu.main.params]
class = 'center'
{{< /code-toggle >}}

テンプレート内の `site.Menus.main` のエントリーにアクセスしてください。
詳細は、[メニューテンプレート][menu templates] を参照してください。


## サイト構成で定義する {#define-in-site-configuration}

「メイン」メニューのエントリを定義するには、以下のようにします。

{{< code-toggle file="hugo" copy=false codeId="h2" >}}
[[menu.main]]
name = 'Home'
pageRef = '/'
weight = 10

[[menu.main]]
name = 'Products'
pageRef = '/products'
weight = 20

[[menu.main]]
name = 'Services'
pageRef = '/services'
weight = 30
{{< /code-toggle >}}

これにより、テンプレートの `site.Menus.main` でアクセスできるメニュー構造が作成されます。
詳細は、[メニューテンプレート][menu templates] を参照してください。

「フッター」メニューのエントリを定義するには、以下のようにします。

{{< code-toggle file="hugo" copy=false codeId="h3" >}}
[[menu.footer]]
name = 'Terms'
pageRef = '/terms'
weight = 10

[[menu.footer]]
name = 'Privacy'
pageRef = '/privacy'
weight = 20
{{< /code-toggle >}}

これにより、テンプレートの `site.Menus.footer` でアクセスできるメニュー構造が作成されます。
詳細は、[メニューテンプレート][menu templates] を参照してください。

### プロパティ {#properties-site-configuration}

{{% note %}}
[フロントマターで定義されたエントリで利用可能なプロパティ][properties available to entries defined in front matter] は、サイト構成で定義されたエントリでも利用可能です。

[properties available to entries defined in front matter]: /content-management/menus/#properties-front-matter
{{% /note %}}

サイト構成で定義された各メニュー エントリには、2 つ以上のプロパティが必要です。

- 内部リンクには `name` と `pageRef` を指定します
- 外部リンクには `name` と `url` を指定します

pageRef
: (`string`) `content` ディレクトリを基準とした、ターゲット ページのファイル パスです。 言語コードとファイル拡張子を省略します。 *内部* リンクには必須です。

Kind|pageRef
:--|:--
home|`/`
page|`/books/book-1`
section|`/books`
taxonomy|`/tags`
term|`/tags/foo`

url
: (`string`) *外部* リンクには必須です。

### 例 {#example-site-configuration}

このネストされたメニューは、以下のような、利用可能なプロパティのいくつかを示しています。

{{< code-toggle file="hugo" copy=false codeId="h4" >}}
[[menu.main]]
name = 'Products'
pageRef = '/products'
weight = 10

[[menu.main]]
name = 'Hardware'
pageRef = '/products/hardware'
parent = 'Products'
weight = 1

[[menu.main]]
name = 'Software'
pageRef = '/products/software'
parent = 'Products'
weight = 2

[[menu.main]]
name = 'Services'
pageRef = '/services'
weight = 20

[[menu.main]]
name = 'Hugo'
pre = '<i class="fa fa-heart"></i>'
url = 'https://gohugo.io/'
weight = 30
[menu.main.params]
rel = 'external'
{{< /code-toggle >}}

これにより、テンプレートの `site.Menus.main` でアクセスできるメニュー構造が作成されます。
詳細は、[メニューテンプレート][menu templates] を参照してください。

## ローカライズする {#localize}

Hugo は、メニュー エントリをローカライズする 2 つの方法を提供します。
[多言語対応][multilingual] を参照してください。

## レンダリングする {#render}

[メニューテンプレート][menu templates] を参照してください。

[localize]: /content-management/multilingual/#menus
[menu templates]: /templates/menu-templates/
[multilingual]: /content-management/multilingual/#menus
[template]: /templates/menu-templates/
