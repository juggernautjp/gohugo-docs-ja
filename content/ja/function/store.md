---
title: .Store
description: サーバーの再構築時にリセットされないスクラッチを返します。
categories: [function]
menu:
  docs:
    parent: function
keywords: [scratch]
signature: []
---

`.Page` の `.Store` メソッドは、データを保存および操作するための [Scratch] を返します。
`.Scratch` メソッドとは対照的に、このスクラッチはサーバーの再構築時にリセットされません。

[Scratch]: /function/scratch/

### メソッド {#methods}

#### .Set

指定されたキーの値を設定します。

```go-html-template
{{ .Store.Set "greeting" "Hello" }}
```

#### .Get

指定されたキーの値を取得します。

```go-html-template
{{ .Store.Set "greeting" "Hello" }}

{{ .Store.Get "greeting" }} → Hello
```

#### .Add

指定されたキーの既存の値に、指定された値を追加します。

単一の値の場合、 `Add` は Go の `+` 演算子をサポートする値を受け付けます
キーに対する最初の `Add` が配列またはスライスである場合、そのリストに次の `Add` が追加されます。

```go-html-template
{{ .Store.Add "greetings" "Hello" }}
{{ .Store.Add "greetings" "Welcome" }}

{{ .Store.Get "greetings" }} → HelloWelcome
```

```go-html-template
{{ .Store.Add "total" 3 }}
{{ .Store.Add "total" 7 }}

{{ .Store.Get "total" }} → 10
```

```go-html-template
{{ .Store.Add "greetings" (slice "Hello") }}
{{ .Store.Add "greetings" (slice "Welcome" "Cheers") }}

{{ .Store.Get "greetings" }} → []interface {}{"Hello", "Welcome", "Cheers"}
```

#### .SetInMap

`key`、`mapKey`、および `value` を受け取り、`mapKey` と `value` のマップを指定された `key` に追加します。

```go-html-template
{{ .Store.SetInMap "greetings" "english" "Hello" }}
{{ .Store.SetInMap "greetings" "french" "Bonjour" }}

{{ .Store.Get "greetings" }} → map[french:Bonjour english:Hello]
```

#### .DeleteInMap

`key` と `mapKey` を取得し、指定された `key` から `mapKey` のマップを削除します。

```go-html-template
{{ .Store.SetInMap "greetings" "english" "Hello" }}
{{ .Store.SetInMap "greetings" "french" "Bonjour" }}
{{ .Store.DeleteInMap "greetings" "english" }}

{{ .Store.Get "greetings" }} → map[french:Bonjour]
```

#### .GetSortedMapValues

`key` の値を `mapKey` でソートした配列を返します。

```go-html-template
{{ .Store.SetInMap "greetings" "english" "Hello" }}
{{ .Store.SetInMap "greetings" "french" "Bonjour" }}

{{ .Store.GetSortedMapValues "greetings" }} → [Hello Bonjour]
```

#### .Delete

指定されたキーを削除します。

```go-html-template
{{ .Store.Set "greeting" "Hello" }}

{{ .Store.Delete "greeting" }}
```
