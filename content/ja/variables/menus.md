---
aliases:
- /variables/menu/
categories:
- variables and parameters
date: "2017-03-12"
description: これらの変数とメソッドをメニュー テンプレートで使用します。
draft: false
keywords:
- menus
lastmod: "2017-03-12"
menu:
  docs:
    parent: variables
    weight: 50
publishdate: "2017-03-12"
title: メニュー変数
weight: 50
---

## 変数 {#variables}

[メニューエントリーを定義] した後、これらの変数を使用して [メニューテンプレート] のプロパティにアクセスします。

.Children
: (`menu`) もしあれば、現在のメニューエントリの下にある子メニューエントリのコレクション。

.Identifier
: (`string`) メニューエントリの `identifier` プロパティ。メニューエントリを [自動的に] 定義した場合、ページの `.Section`。

.KeyName
: (`string`) メニューエントリの `identifier` プロパティ、それ以外の場合は `name` プロパティ。

.Menu
: (`string`) メニューエントリを含むメニューの識別子。

.Name
: (`string`) メニューエントリの `name` プロパティ。

- メニューエントリを [自動的に][automatically] 定義する場合はページの `.LinkTitle` を、そうでない場合はページの `.Title` を指定します。
- メニューを [フロントマターで][in front matter] または [サイト設定で][in site configuration] 定義すると、ページの `.LinkTitle` にフォールバックし、次にページの `.Title` にフォールバックします。

.Page
: (`page`) メニューエントリに関連付けられたページへの参照。

<!-- これは、メニューをレンダリングするときに値を提供しません。 混乱を避けるため省略しています。
.PageRef
: (`string`) メニューエントリの `pageRef` プロパティ。
-->

.Params
: (`map`) メニューエントリの `params` プロパティ。

.Parent
: (`string`) メニューエントリの `parent` プロパティ。

.Post
: (`template.HTML`) メニューエントリの `post` プロパティ。

.Pre
: (`template.HTML`) メニューエントリの `pre` プロパティ。

.Title
: (`string`) メニューエントリの `title` プロパティ。

- メニューエントリを [自動的に][automatically] 定義する場合は、ページの `.LinkTitle`、それ以外の場合はページの `.Title` を指定します。
- メニューを [フロントマターで][in front matter] または [サイト設定で][in site configuration] 定義すると、ページの`.LinkTitle`にフォールバックし、次にページの`.Title`にフォールバックします。

.URL
: (`string`) メニューエントリに関連付けられたページの `.RelPermalink` プロパティ。外部リソースを指すメニューエントリの場合は、メニューエントリの `url` プロパティ。

.Weight
: (`int`) メニューエントリの `weight` プロパティ。

- メニューエントリを [自動的に][automatically] 定義すると、ページの `.Weight` が決まります。
- [フロントマターで][in front matter] または [サイト設定で][in site configuration] メニューを定義した場合、ページの `.Weight` にフォールバックします。

## メソッド {#methods}

.HasChildren
: (`bool`) `.Children` が `nil` でない場合に `true` を返します。

.IsEqual
: (`bool`) 比較されたメニューエントリが同じメニューエントリを表していれば、 `true` を返します。

.IsSameResource
: (`bool`) 比較したメニューエントリが同じリソースを指していれば、 `true` を返します。

.Page.HasMenuCurrent
: (`bool`) アクティブなメニューエントリの祖先を決定するには、このメソッドを使います。 [詳細](/functions/hasmenucurrent/) を参照してください。

.Page.IsMenuCurrent
: (`bool`) アクティブなメニューエントリを決定するには、このメソッドを使用します。 [詳細](/functions/ismenucurrent/) を参照してください。

[automatically]: /content-management/menus/#define-automatically
[defining menu entries]: /content-management/menus/#overview
[in front matter]: /content-management/menus/#define-in-front-matter
[in site configuration]: /content-management/menus/#define-in-site-configuration
[menu templates]: /templates/menu-templates/
