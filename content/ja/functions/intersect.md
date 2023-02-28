---
aliases: []
categories:
- functions
date: "2017-02-01"
deprecated: false
description: 最初の配列と同じ順序で、2 つの配列またはスライスの共通要素を返します。
draft: false
hugoversion: null
keywords:
- collections
- intersect
- union
- complement
- symdiff
lastmod: "2017-02-01"
linktitle: intersect
menu:
  docs:
    parent: functions
publishdate: "2017-02-01"
relatedfuncs: []
signature:
- intersect SET1 SET2
title: intersect
workson: []
---
便利な例としては、where と組み合わせて、`AND` フィルターとして使用することができます。

## where クエリでの AND フィルター {#and-filter-in-where-query}

```go-html-template
{{ $pages := where .Site.RegularPages "Type" "not in" (slice "page" "about") }}
{{ $pages := $pages | union (where .Site.RegularPages "Params.pinned" true) }}
{{ $pages := $pages | intersect (where .Site.RegularPages "Params.images" "!=" nil) }}
```

上記は、固定されていない限り、 `page` または `about` タイプではない通常ページを取得します。 最後に、Page パラメータに `images` が設定されていないページをすべて除外します。

`OR` については [union](/functions/union) を参照してください。


[partials]: /templates/partials/
[single]: /templates/single-page-templates/
