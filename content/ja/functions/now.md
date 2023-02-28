---
aliases: []
categories:
- functions
date: "2017-02-01"
deprecated: false
description: 現在のローカルタイムを返します
draft: false
hugoversion: null
keywords:
- dates
- time
lastmod: "2017-04-30"
linktitle: now
menu:
  docs:
    parent: functions
publishdate: "2017-02-01"
relatedfuncs:
- Unix
- dateFormat
signature:
- now
title: now
workson: []
---

[`time.Time`](https://godoc.org/time#Time) を参照してください。

たとえば、以下のテンプレートを使用して、2017 年 6 月 24 日にサイトを構築するとします。

```go-html-template
<div>
    <small>&copy; {{ now.Format "2006"}}</small>
</div>
```

上記のコードは、以下を生成します。

```html
<div>
    <small>&copy; 2017</small>
</div>
```

上記の例では、[`.Format`関数](/functions/format) を使用しています。このページには、Go のレイアウト文字列を使用した日付フォーマットの完全なリストが含まれています。

{{% note %}}
古い Hugo テーマでは、廃止された Page の `.Now` (先頭にドットが付いた大文字) をまだ使用している可能性があり、以下のようなビルドエラーが発生します。

    ERROR ... Error while rendering "..." in "...": ...
    executing "..." at <.Now.Format>:
    can't evaluate field Now in type *hugolib.PageOutput

テンプレートには、必ず `now` (小文字で、先頭のドットが _**ない**_) を使用してください。
{{% /note %}}
