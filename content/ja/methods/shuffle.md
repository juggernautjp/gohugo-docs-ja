---
aliases: []
categories:
- functions
date: "2017-02-01"
deprecated: false
description: 指定された配列またはスライスのランダム置換を返します。
draft: false
hugoversion: null
keywords:
- ordering
lastmod: "2017-04-30"
menu:
  docs:
    parent: functions
publishdate: "2017-02-01"
relatedfuncs:
- seq
signature:
- shuffle COLLECTION
title: shuffle
workson: []
---

{{< code file="shuffle-input.html" >}}
<!-- シャッフルされたシークエンス = -->
<div>{{ shuffle (seq 1 5) }}</div>
<!-- シャッフルされたスライス =  -->
<div>{{ shuffle (slice "foo" "bar" "buzz") }}</div>
{{< /code >}}

上記の例は、以下のように返されます。

{{< output file="shuffle-output.html" >}}
<!-- シャッフルされたシークエンス =  -->
<div>2 5 3 1 4</div>
<!-- シャッフルされたスライス =  -->
<div>buzz foo bar</div>
{{< /output >}}

この例では、[slice](/functions/slice/) および [seq](/functions/seq/) 関数も使用しています。
