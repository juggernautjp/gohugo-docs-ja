---
categories:
- function
date: "2017-02-01"
description: 指定されたページのメニューエントリであるかどうかを返します。
draft: false
keywords:
- menus
lastmod: "2017-02-01"
menu:
  docs:
    parent: function
needsexample: true
publishdate: "2017-02-01"
relatedfuncs:
- HasMenuCurrent
signature:
- PAGE.IsMenuCurrent MENU MENUENTRY
title: .IsMenuCurrent
---

`.IsMenuCurrent` は `Page` オブジェクトのメソッドで、_ブール_ 値を返します。もし、**ページ** が指定された **メニュー** の **メニューエントリ** にある `.Page` と同じオブジェクトであれば、`true` を返します。

[メニューテンプレート](/templates/menu-templates/) にその使用例があります。
