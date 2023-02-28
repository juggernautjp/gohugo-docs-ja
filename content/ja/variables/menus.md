---
aliases:
- /variables/menu/
categories:
- variables and params
date: "2017-03-12"
description: メニュー テンプレートのメニューエントリには、メニュー管理を容易にする特定の変数と関数があります。
draft: false
keywords:
- menus
lastmod: "2017-03-12"
linktitle: メニューエントリ プロパティ
menu:
  docs:
    parent: variables
    title: メニューエントリによって定義された変数
    weight: 50
publishdate: "2017-03-12"
sections_weight: 50
title: メニューエントリ プロパティ
toc: false
weight: 50
---

**メニュー エントリ** には、[メニュー テンプレート][menu-template] で使用できる以下のプロパティがあります。

## メニューエントリ変数 {#menu-entry-variables}

.Menu
: _string_  
この **メニューエントリ** を含む **メニュー** の名前です。

.URL
: _string_  
メニューエントリが指し示す URL です。メニューエントリに `url` キーが設定されている場合、この値が設定されます。このキーが設定されていない場合、かつ、メニューエントリがページのフロントマターに設定されている場合、この値のデフォルトはそのページの `.RelPermalink` になります。

.Page
: _\*Page_  
メニューエントリに関連付けられた [ページオブジェクト][page-object] への参照です。メニューエントリがページのフロントマターを通して設定され、かつ、サイト設定を通して設定されない場合、これは非 NIL になります。

.PageRef
: _string_   
サイト設定で定義されていて、メニューエントリがページを参照している場合に設定できます。 [site.GetPage](/functions/getpage/) は、ページ検索を行うために使用されます。 これが設定されている場合、`URL` を設定する必要はありません。

.Name
: _string_  
メニューエントリの名前です。メニューエントリに `name` キーが設定されている場合、この値が設定されます。このキーが設定されていない場合、そしてメニューエントリがページのフロントマターで設定されている場合、この値はデフォルトでページの `.LinkTitle` に設定されます。

.Identifier
: _string_  
メニューエントリに設定されている場合は、`identifier` キーの値です。この値は、メニューエントリごとに一意である必要があります。**同じ `.Name` を持つメニューエントリが複数ある場合は、一意の識別子を手動で設定する必要があります**。

.Pre
: _template.HTML_  
メニューエントリに設定されている場合の `pre` キーの値です。 通常、この値には HTML を表す文字列が含まれます。

.Post
: _template.HTML_  
メニュー エントリに設定されている場合の `post` キーの値です。 通常、この値には HTML を表す文字列が含まれます。

.Weight
: _int_  
メニュー ントリに設定されている場合の `weight` キーの値です。 デフォルトでは、メニューのエントリは `weight` で昇順にソートされます。 このキーが設定されておらず、メニューエントリがページのフロントマターに設定されている場合、この値はデフォルトでページの `.Weight` になります。

.Parent
: _string_  
このメニューエントリの親の **メニューエントリ** の名前 (存在する場合は識別子) です。メニューエントリに `parent` キーが設定されている場合、この値が設定されます。このキーが設定されている場合、このメニューエントリはその親エントリの下にネストされ、それ以外の場合は、`.Menu` の下に直接ネストされます。

.Children
: _Menu_  
この値は、Hugo によって自動入力されます。これは、もしあれば、現在のメニューエントリの下にある子エントリのコレクションです。

## メニューエントリ関数 {#menu-entry-functions}

メニューには、以下の関数も用意されています。

.HasChildren
: _boolean_  
`.Children` が非 nil の場合、`true` を返します。

.KeyName
: _string_  
存在する場合は `.Identifier` を返し、存在しない場合は `.Name` を返します。

.IsEqual
: _boolean_  
比較された 2 つのメニューエントリが同じメニューエントリを表している場合は、`true` を返します。

.IsSameResource
: _boolean_  
比較された 2 つのメニューエントリが同じ `.URL` を持つ場合、`true` を返します。

.Title
: _string_  
メニューエントリの `<a>` タグの `title` 属性で使用するためのリンクタイトルです。 メニューエントリの `title` キーが設定されていれば、それを返します。そうでなく、メニューエントリがページのフロントマターから作成された場合は、そのページの `.LinkTitle` を返します。それ以外の場合は、単に空文字列を返します。

## その他のメニュー関連関数 {#other-menurelated-functions}

Aさらに、ページのメニューで使用できるいくつかの関連するメソッドを以下に示します。

.IsMenuCurrent
: _(menu string, menuEntry *MenuEntry ) boolean_  
[`.IsMenuCurrent` メソッド](/functions/ismenucurrent/) を参照してください。

.HasMenuCurrent
: _(menu string, menuEntry *MenuEntry) boolean_  
[`.HasMenuCurrent` メソッド](/functions/hasmenucurrent/) を参照してください。

[menu-template]: /templates/menu-templates/
[page-object]: /variables/page/
