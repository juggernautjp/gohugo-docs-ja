---
categories:
- functions
date: "2017-09-08"
description: 第 3 引数の値に応じて、2 つの引数のうちどちらかを返す。
draft: false
hugoversion: 0.27
menu:
  docs:
    parent: functions
relatedfuncs:
- default
signature:
- cond CONTROL VAR1 VAR2
title: cond
toc: false
---

`cond` は、*CONTROL* が true の場合は *VAR1* を返し、そうでない場合は *VAR2* を返します。

例:

```go-html-template
{{ cond (eq (len $geese) 1) "goose" "geese" }}
```

上記のコードは、`$geese` 配列に項目が 1 つだけある場合は "goose" を出力し、それ以外の場合は "geese" を出力します。

{{% warning %}}
`cond` 関数を使用するときは、*両方の* 変数式が *常に* 評価されます。 つまり、`cond false (div 1 0) 27` のような使い方は、条件が false* であっても `div 1 0` が評価されるため、エラーになります。

言い換えると、`cond` 関数は [短絡評価](https://ja.wikipedia.org/wiki/%E7%9F%AD%E7%B5%A1%E8%A9%95%E4%BE%A1) を提供 *せず*、条件が `false` を返したら最初の式をパスするような通常の [三項演算子] のように機能 *しません*。
{{% /warning %}}
