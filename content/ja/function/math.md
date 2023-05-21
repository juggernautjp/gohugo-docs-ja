---
aliases: []
categories:
- functions
date: "2017-02-01"
deprecated: false
description: Hugo は、テンプレートで数学演算子を提供します。
draft: false
hugoversion: null
keywords:
- math
- operators
lastmod: "2020-02-23"
menu:
  docs:
    parent: functions
publishdate: "2017-02-01"
relatedfuncs: []
signature: []
title: Math
toc: null
workson: []
---

| 関数         | 説明                                                                         | 例                              |
|--------------|-----------------------------------------------------------------------------|----------------------------------|
| `add`        | 2 つの数値を加算します。                                                      | `{{add 1 2}}` &rarr; `3`         |
|              | *数値の 1 つが float の場合、結果は float になります。*                        | `{{add 1.1 2}}` &rarr; `3.1`     |
| `sub`        | 2 つの数値を減算します。                                                      | `{{sub 3 2}}` &rarr; `1`         |
|              | *数値の 1 つが float の場合、結果は float になります。*                        | `{{sub 3 2.5}}` &rarr; `0.5`     |
| `mul`        | 2 つの数値を乗算します。                                                     | `{{mul 2 3}}` &rarr; `6`         |
|              | *数値の 1 つが float の場合、結果は float になります。*                        | `{{mul 2 3.1}}` &rarr; `6.2`     |
| `div`        | 2 つの数値を除算します。                                                      | `{{div 6 3}}` &rarr; `2`         |
|              |                                                                             | `{{div 6 4}}` &rarr; `1`         |
|              | *数値の 1 つが float の場合、結果は float になります。*                        | `{{div 6 4.0}}` &rarr; `1.5`     |
| `mod`        | 2 つの整数の剰余です。                                                         | `{{mod 15 3}}` &rarr; `0`        |
| `modBool`    | 2 つの整数の剰余を表すブール値です。結果が 0 であれば `true` と評価されます。     | `{{modBool 15 3}}` &rarr; `true` |
| `math.Ceil`  | 指定された数値以上の最小の整数値を返します。                                    | `{{math.Ceil 2.1}}` &rarr; `3`   |
| `math.Floor` | 指定された数値以下の最大の整数値を返します。                                    | `{{math.Floor 1.9}}` &rarr; `1`  |
| `math.Log`   | 指定された数値の自然対数を返します。                                           | `{{math.Log 42}}` &rarr; `3.737` |
| `math.Max`   | 2 つの数値のうち大きい方を返します。                                           | `{{math.Max 1 2}}` &rarr; `2`    |
| `math.Min`   | 2 つの数値のうち小さい方を返します。                                           | `{{math.Min 1 2}}` &rarr; `1`    |
| `math.Pow`   | 最初の数値を 2 番目の数値で累乗して返します。                                   | `{{math.Pow 2 3}}` &rarr; `8`    |
| `math.Round` | ゼロから 2 分の 1 を四捨五入して、最も近い整数を返します。                       | `{{math.Round 1.5}}` &rarr; `2`  |
| `math.Sqrt`  | 指定された数値の平方根を返します。                                             | `{{math.Sqrt 81}}` &rarr; `9`    |
