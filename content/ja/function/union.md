---
categories:
- function
date: "2017-02-01"
description: 2 つの配列またはスライスを指定すると、配列/スライスのいずれかまたは両方に属する要素またはオブジェクトを含む新しい配列を返します。
draft: false
keywords:
- collections
- intersect
- union
- complement
lastmod: "2017-03-12"
menu:
  docs:
    parent: function
publishdate: "2017-02-01"
relatedfuncs:
- intersect
- where
signature:
- union SET1 SET2
title: union
---

2 つの配列 (またはスライス) A と B を指定すると、この関数は、A または B のいずれか、または両方に属する要素またはオブジェクトを含む新しい配列を返します。 サポートされている要素は、文字列、整数、浮動小数点数 (float64 のみ) です。

```go-html-template
{{ union (slice 1 2 3) (slice 3 4 5) }}
<!-- [1 2 3 4 5] を返します -->

{{ union (slice 1 2 3) nil }}
<!-- [1 2 3] を返します -->

{{ union nil (slice 1 2 3) }}
<!-- [1 2 3] を返します -->

{{ union nil nil }}
<!-- 両方の配列/スライスが同じ型でなければならないため、エラーを返します -->
```

## where クエリでの OR フィルター {#or-filter-in-where-query}

また、以下のように、where と組み合わせて `OR` フィルターとして使用すると非常に便利です。

```go-html-template
{{ $pages := where .Site.RegularPages "Type" "not in" (slice "page" "about") }}
{{ $pages = $pages | union (where .Site.RegularPages "Params.pinned" true) }}
{{ $pages = $pages | intersect (where .Site.RegularPages "Params.images" "!=" nil) }}
```

上記は、固定されていない限り、`page` または `about` タイプでない通常ページをフェッチします。 最後に、Page パラメータに `images` が設定されていないすべてのページを除外します。

`AND `については、[intersect](/function/intersect) を参照してください。
