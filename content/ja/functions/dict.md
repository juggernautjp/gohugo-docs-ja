---
aliases: []
categories:
- functions
date: "2017-02-01"
deprecated: false
description: キーと値のペアのリストから辞書を作成します。
draft: false
hugoversion: null
keywords:
- dictionary
menu:
  docs:
    parent: functions
publishdate: "2017-02-01"
relatedfuncs: []
signature:
- dict KEY VALUE [KEY VALUE]...
title: dict
workson: []
---

`dict` は、特に部分テンプレートに複数の値を渡す場合に便利です。

 `key` は `string` または `string slice` のどちらかであることに注意してください。後者は、たとえば以下のような、深くネストした構造を作成するのに役立ちます。

```go-text-template
{{ $m := dict (slice "a" "b" "c") "value" }}
```

## 例: `dict` を使用して複数の値を `partial` に渡す {#example-using-dict-to-pass-multiple-values-to-a-partial}

以下のパーシャルは SVG を作成し、呼び出し元から `fill`、`height`、`width` を受け取るようにします。

### 部分テンプレートの定義 {#partial-definition}

{{< code file="layouts/partials/svgs/external-links.svg" download="external-links.svg" >}}
<svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"
fill="{{ .fill }}" width="{{ .width }}" height="{{ .height }}" viewBox="0 0 32 32" aria-label="External Link">
<path d="M25.152 16.576v5.696q0 2.144-1.504 3.648t-3.648 1.504h-14.848q-2.144 0-3.648-1.504t-1.504-3.648v-14.848q0-2.112 1.504-3.616t3.648-1.536h12.576q0.224 0 0.384 0.16t0.16 0.416v1.152q0 0.256-0.16 0.416t-0.384 0.16h-12.576q-1.184 0-2.016 0.832t-0.864 2.016v14.848q0 1.184 0.864 2.016t2.016 0.864h14.848q1.184 0 2.016-0.864t0.832-2.016v-5.696q0-0.256 0.16-0.416t0.416-0.16h1.152q0.256 0 0.416 0.16t0.16 0.416zM32 1.152v9.12q0 0.48-0.352 0.8t-0.8 0.352-0.8-0.352l-3.136-3.136-11.648 11.648q-0.16 0.192-0.416 0.192t-0.384-0.192l-2.048-2.048q-0.192-0.16-0.192-0.384t0.192-0.416l11.648-11.648-3.136-3.136q-0.352-0.352-0.352-0.8t0.352-0.8 0.8-0.352h9.12q0.48 0 0.8 0.352t0.352 0.8z"></path>
</svg>
{{< /code >}}

### 部分テンプレートの呼び出し {#partial-call}

`fill`、`height`、`width` の値は `dict` を用いて 1 つのオブジェクトに格納し、部分テンプレートに渡すことができます。

{{< code file="layouts/_default/list.html" >}}
{{ partial "svgs/external-links.svg" (dict "fill" "#01589B" "width" 10 "height" 20 ) }}
{{< /code >}}

[partials]: /templates/partials/
