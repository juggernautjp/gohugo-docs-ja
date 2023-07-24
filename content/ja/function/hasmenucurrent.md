---
aliases: []
categories:
- function
date: "2017-02-01"
description: メニューエントリを持つかどうかのブール値を返します。
draft: false
keywords:
- menus
lastmod: "2017-02-01"
menu:
  docs:
    parent: function
publishdate: "2017-02-01"
relatedfuncs:
- "IsMenuCurrent"
signature:
- "PAGE.HasMenuCurrent MENU MENUENTRY"
title: .HasMenuCurrent
---

`.HasMenuCurrent` は `Page` オブジェクトのメソッドで、_ブール_ 値を返します。もし、**ページ** が、指定された **メニュー** の **メニューエントリ** の下にある **子メニューエントリ** の 1 つの `.Page` と同じオブジェクトであれば、 `true` を返します。

**メニューエントリ** の `.Page` が [セクション](/content-management/sections/) の場合、Hugo `0.86.0` 以降、このメソッドはそのセクションの子孫に対しても true を返します。

[メニューテンプレート](/templates/menu-templates/) にその使用例があります。
