---
categories:
- asset management
date: "2018-07-14"
description: Hugo パイプ、フィンガープリントとサブリソース完全性 (SRI) を可能にします。
draft: false
keywords: []
menu:
  docs:
    parent: pipes
    weight: 70
publishdate: "2018-07-14"
sections_weight: 70
title: フィンガープリントと SRI
weight: 70
---

フィンガープリントと [サブリソース完全性 (SRI)](https://developer.mozilla.org/ja/docs/Web/Security/Subresource_Integrity) は、リソースオブジェクトと [ハッシュ関数](https://en.wikipedia.org/wiki/Cryptographic_hash_function) の 2 つの引数を取る `resources.Fingerprint` を使って、任意のアセットファイルに適用できます。

デフォルトのハッシュ関数は `sha256` で、他に利用可能な関数は、 `sha384` (Hugo `0.55` 以降)、 `sha512` および `md5` です。

このように処理されたアセットには、`.Data.Integrity` プロパティとして、ハッシュ関数名、ハイフン 1 つ、base64 エンコードされたハッシュ値からなる integrity 文字列が設定されます。

```go-html-template
{{ $js := resources.Get "js/global.js" }}
{{ $secureJS := $js | resources.Fingerprint "sha512" }}
<script src="{{ $secureJS.Permalink }}" integrity="{{ $secureJS.Data.Integrity }}"></script>
```
