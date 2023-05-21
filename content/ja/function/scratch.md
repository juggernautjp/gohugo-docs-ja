---
aliases:
- /extras/scratch/
- /doc/scratch/
categories:
- functions
date: "2017-02-01"
deprecated: false
description: データを保存および操作するための「スクラッチパッド」として機能します。
draft: false
hugoversion: null
keywords:
- iteration
lastmod: "2017-02-01"
menu:
  docs:
    parent: functions
publishdate: "2017-02-01"
relatedfuncs: []
signature: []
title: .Scratch
toc: null
workson: []
---

Scratch は、Go テンプレートの世界でデータを便利に操作するために設計された Hugo の機能です。ページやショートコードのメソッドで、結果のデータが指定されたコンテキストに添付されるか、変数に格納された一意のインスタンスとして存在できます。

{{< note >}}
Scratch は当初、0.48 より前の Hugo バージョンに影響する [Go テンプレートのスコープ制限](https://github.com/golang/go/issues/10608) の回避策として作成されたことに注意してください。 `.Scratch` の詳細な分析とコンテキストに応じた使用例については、[このブログの記事](https://regisphilibert.com/blog/2017/04/hugo-scratch-explained-variable/) を参照してください。
{{< /note >}}

### コンテキストを持つ `.Scratch` とローカルの `newScratch` の比較 {#Contexted-scratch-vs-local-newscratch}

Hugo 0.43 以降、Scratch を使用する方法には、以下の 2 つあります。

#### ページの `.Scratch` {#the-pages-scratch}

`.Scratch` はページメソッドまたはショートコード メソッドとして利用可能で、指定されたページに「スクラッチ」したデータを添付します。 `.Scratch` を使用するには、ページコンテキストまたはショートコード コンテキストが必要です。

```go-html-template
{{ .Scratch.Set "greeting" "bonjour" }}
{{ range .Pages }}
  {{ .Scratch.Set "greeting" (print "bonjour" .Title) }}
{{ end }}
```

#### ローカルの `newScratch` {#the-local-newscratch}

{{< new-in "0.43" >}} Scratch インスタンスは、 `newScratch` 関数を使用して任意の変数に代入することもできます。この場合、ページまたはショートコードのコンテキストは必要なく、スクラッチのスコープはローカルのみになります。 以下のメソッドは、Scratch インスタンスが代入された変数から利用できます。

```go-html-template
{{ $data := newScratch }}
{{ $data.Set "greeting" "hola" }}
```

### メソッド {#methods}

Scratch には、以下のメソッドがあります。

{{< note >}}
以下の例では、[ローカルの Scratch インスタンス](#the-local-newscratch) が `$scratch` に保存されていると仮定していることに注意してください。
{{< /note >}}

#### .Set

指定されたキーの値を設定します。

```go-html-template
{{ $scratch.Set "greeting" "Hello" }}
```

#### .Get

指定されたキーの値を取得します。

```go-html-template
{{ $scratch.Set "greeting" "Hello" }}
----
{{ $scratch.Get "greeting" }} > Hello
```

#### .Add

指定されたキーの既存の値 (複数可) に、指定された値を追加します。

単一の値に対して、 `Add` は Go の `+` 演算子をサポートする値を受け付けます。あるキーに対する最初の `Add` が配列またはスライスである場合、そのリストに以下の Add が追加されます。

```go-html-template
{{ $scratch.Add "greetings" "Hello" }}
{{ $scratch.Add "greetings" "Welcome" }}
----
{{ $scratch.Get "greetings" }} > HelloWelcome
```

```go-html-template
{{ $scratch.Add "total" 3 }}
{{ $scratch.Add "total" 7 }}
----
{{ $scratch.Get "total" }} > 10
```

```go-html-template
{{ $scratch.Add "greetings" (slice "Hello") }}
{{ $scratch.Add "greetings" (slice "Welcome" "Cheers") }}
----
{{ $scratch.Get "greetings" }} > []interface {}{"Hello", "Welcome", "Cheers"}
```

#### .SetInMap

`key`、`mapKey`、`value` を受け取り、指定された `key` に `mapKey` と `value` のマップを追加します。

```go-html-template
{{ $scratch.SetInMap "greetings" "english" "Hello" }}
{{ $scratch.SetInMap "greetings" "french" "Bonjour" }}
----
{{ $scratch.Get "greetings" }} > map[french:Bonjour english:Hello]
```

#### .DeleteInMap

`key` と `mapKey` を受け取り、指定された `key` から `mapKey` のマップを削除します。

```go-html-template
{{ .Scratch.SetInMap "greetings" "english" "Hello" }}
{{ .Scratch.SetInMap "greetings" "french" "Bonjour" }}
----
{{ .Scratch.DeleteInMap "greetings" "english" }}
----
{{ .Scratch.Get "greetings" }} > map[french:Bonjour]
```

#### .GetSortedMapValues

`key` から `mapKey` でソートした値の配列を返します。

```go-html-template
{{ $scratch.SetInMap "greetings" "english" "Hello" }}
{{ $scratch.SetInMap "greetings" "french" "Bonjour" }}
----
{{ $scratch.GetSortedMapValues "greetings" }} > [Hello Bonjour]
```

#### .Delete

指定されたキーを削除します。

```go-html-template
{{ $scratch.Set "greeting" "Hello" }}
----
{{ $scratch.Delete "greeting" }}
```

#### .Values

生のバッキング マップを返します。 このメソッドは、[`newScratch`](#the-local-newscratch) を介して取得したローカル スコープの Scratch インスタンスでのみ使用する必要があることに注意してください。 同時実行の問題が発生するため、`.Page.Scratch` などでは使用しないでください。


[pagevars]: /variables/page/
