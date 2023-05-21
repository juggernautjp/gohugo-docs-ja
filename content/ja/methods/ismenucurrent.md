---
aliases: []
categories:
- functions
date: "2017-02-01"
deprecated: false
description: null
draft: false
hugoversion: null
keywords:
- menus
lastmod: "2017-02-01"
menu:
  docs:
    parent: functions
needsexample: true
publishdate: "2017-02-01"
relatedfuncs:
- HasMenuCurrent
signature:
- PAGE.IsMenuCurrent MENU MENUENTRY
title: .IsMenuCurrent
workson:
- menus
---

`.IsMenuCurrent` は `Page` オブジェクトのメソッドで、_ブール_ 値を返します。もし、**ページ** が指定された **メニュー** の **メニューエントリ** にある `.Page` と同じオブジェクトであれば、`true` を返します。

[メニューテンプレート](/templates/menu-templates/) にその使用例があります。
