---
aliases: []
categories:
- functions
date: "2017-02-01"
deprecated: false
description: 英語の一般的な単数化規則に従って単語を変換します。
draft: false
hugoversion: null
keywords:
- strings
- singular
lastmod: "2017-02-01"
menu:
  docs:
    parent: functions
publishdate: "2017-02-01"
relatedfuncs: []
signature:
- singularize INPUT
title: singularize
workson: []
---

`{{ "cats" | singularize }}` → "cat"

タクソノミーの名前の単数化については、 `.Data.Singular` [タクソノミー変数](/variables/taxonomy/) も参照してください。
