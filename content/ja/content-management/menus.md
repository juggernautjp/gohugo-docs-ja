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

{{% note "Lazy Blogger"%}}
セクションのシンプルなメニューだけが必要な場合は、[メニュー テンプレートの「怠惰なブロガーのためのセクション メニュー」](/templates/menu-templates/#section-menu-for-lazy-bloggers) を参照してください。
{{% /note %}}

You can do this:

* 1 つまたは複数のメニューにコンテンツを配置する
* ネストされたメニューの深さを無制限で扱える
* コンテンツに付属しないメニューエントリを作成する
* アクティブな要素 (およびアクティブなブランチ) を区別する

## Hugo におけるメニューとは? {#what-is-a-menu-in-hugo}

**メニュー** は、[`.Site.Menus` サイト変数][sitevars] を介してアクセスできるメニューエントリの名前付き配列です。たとえば、サイトの `メイン` メニューには `.Site.Menus.main` という変数でアクセスできます。

{{% note "Menus on Multilingual Sites" %}}
[多言語機能](/content-management/multilingual/) を利用すると、言語に依存しないメニューを定義できます。
{{% /note %}}

メニューエントリに関連するすべての変数と関数については、[「メニューエントリ プロパティ」][me-props] を参照してください。

## メニューにコンテンツを追加する {#add-content-to-menus}

Hugo では、コンテンツの [フロントマター](/content-management/front-matter/) を介して、メニューにコンテンツを追加することができます。

### 単純なエントリ {#simple}

メニューにエントリを追加するだけであれば、単純なフォームで十分です。

#### 単一のメニュー {#a-single-menu}

{{< code-toggle >}}
menu: "main"
{{< /code-toggle >}}

#### 複数のメニュー {#multiple-menus}

{{< code-toggle >}}
menu: ["main", "footer"]
{{< /code-toggle >}}

#### より高度なメニュー {#advanced}

{{< code-toggle >}}
menu:
  docs:
    parent: 'extras'
    weight: 20
{{< /code-toggle >}}

## メニューにコンテンツ以外のエントリを追加する {#add-non-content-entries-to-a-menu}

コンテンツに関連付けられていないメニューにエントリを追加することもできます。 これは、Hugo プロジェクトの [`config` ファイル][config] で行われます。

以下は、設定ファイルから取り出したスニペットの例です。

{{< code-toggle file="config" >}}
[[menu.main]]
    name = "about hugo"
    pre = "<i class='fa fa-heart'></i>"
    weight = -110
    identifier = "about"
    url = "/about/"
[[menu.main]]
    name = "getting started"
    pre = "<i class='fa fa-road'></i>"
    post = "<span class='alert'>New!</span>"
    weight = -100
    url = "/getting-started/"
{{< /code-toggle >}}

{{% note %}}
URL はコンテキストルートからの相対パスである必要があります。 `baseURL` が `https://example.com/mysite/` の場合、メニューの URL にはコンテキストルートである `mysite` を含んではいけません。 絶対 URL を使用すると、baseURL がオーバーライドされます。上記の例で `URL` に使用した値が `https://subdomain.example.com/` である場合、出力は `https://subdomain.example.com` となります。
{{% /note %}}

## ネスト {#nesting}

コンテンツのネストはすべて `parent` フィールドを介して行われます。

エントリの親は、別のエントリの識別子である必要があります。 識別子は (メニュー内で) 一意である必要があります。

識別子の決定には、以下の順序が使用されます。

`.Name > .LinkTitle > .Title`

つまり、 `.LinkTitle` が存在しない限り、 `.Title` が使用されるといったことです。 実際には、`.Name` と `.Identifier` は関係を構造化するためにのみ使用されるため、表示されることはありません。

この例では、メニューのトップレベルは [サイトの `config` ファイル][config] で定義されています。 すべてのコンテンツエントリは、`.Parent` フィールドを介して、これらのエントリの 1 つに関連付けられます。

## パラメータ {#params}

また、`params` フィールドを介して、メニュー項目にユーザー定義のコンテンツを追加することもできます。

一般的な使用例は、特定のメニュー項目に css クラスを追加するカスタム パラメータを定義することです。

{{< code-toggle file="config" >}}
[[menu.main]]
    name = "about hugo"
    pre = "<i class='fa fa-heart'></i>"
    weight = -110
    identifier = "about"
    url = "/about/"
    [menu.main.params]
      class = "highlight-menu-item"
{{</ code-toggle >}}

## メニューをレンダリングする {#render-menus}

テンプレート内でサイトメニューを表示する方法については、[「メニュー テンプレート」](/templates/menu-templates/) を参照してください。

[config]: /getting-started/configuration/
[multilingual]: /content-management/multilingual/
[sitevars]: /variables/
[me-props]: /variables/menus/
