---
categories:
- asset management
date: "2018-07-14"
description: 指定されたリソースを処理し、リソースのコンテンツのハッシュ文字列を追加します。
draft: false
keywords: []
menu:
  docs:
    parent: hugo-pipes
    weight: 100
publishdate: "2018-07-14"
title: フィンガープリント
linkTitle: フィンガープリントと SRI ハッシュ
weight: 100
---

## 使用方法 {#usage}

フィンガープリントと [サブリソース完全性 (SRI)](https://developer.mozilla.org/ja/docs/Web/Security/Subresource_Integrity) は、リソースオブジェクトとオプションの [ハッシュ アルゴリズム](https://en.wikipedia.org/wiki/Cryptographic_Hash_Algorithms) の 2 つの引数を取る `resources.Fingerprint` を使って、任意のアセットファイルに適用できます。

デフォルトのハッシュ アルゴリズムは `sha256` で、他に利用可能なアルゴリズムは、 `sha384` (Hugo `0.55` 以降)、 `sha512` および `md5` です。

このように処理されたアセットには、`.Data.Integrity` プロパティとして、ハッシュ アルゴリズム、ハイフン 1 つ、base64 エンコードされたハッシュ値からなる integrity 文字列が設定されます。

```go-html-template
{{ $js := resources.Get "js/global.js" }}
{{ $secureJS := $js | resources.Fingerprint "sha512" }}
<script src="{{ $secureJS.Permalink }}" integrity="{{ $secureJS.Data.Integrity }}"></script>
```
