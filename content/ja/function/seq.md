---
aliases: []
categories:
- functions
date: "2017-02-01"
deprecated: false
description: 整数のシーケンスを作成します。
draft: false
hugoversion: null
keywords: []
lastmod: "2017-02-01"
menu:
  docs:
    parent: functions
publishdate: "2017-02-01"
relatedfuncs: []
signature:
- seq LAST
- seq FIRST LAST
- seq FIRST INCREMENT LAST
title: seq
workson: []
---

これは、[GNU の seq][GNU's seq] モデルで名前が付けられ、使用されています。

```
3 → 1, 2, 3
1 2 4 → 1, 3
-3 → -1, -2, -3
1 4 → 1, 2, 3, 4
1 -2 → 1, 0, -1, -2
```

## 例: `range` と `after` を持つ `seq` {#example-seq-with-range-and-after}

`seq` は、 `range` や `after` と組み合わせて使用できます。 以下は、19 個の要素を返します。

```go-html-template
{{ range after 1 (seq 20)}}
{{ end }}
```

ただし、インデックスで範囲を指定する場合、以下は `$indexStartingAt1` と `$num` が `1,2,3 ... 20` を返すため、混乱が少ないかもしれません。

```go-html-template
{{ range $index, $num := (seq 20) }}
$indexStartingAt1 := (add $index 1)
{{ end }}
```


[GNU's seq]: https://www.gnu.org/software/coreutils/manual/html_node/seq-invocation.html#seq-invocation
