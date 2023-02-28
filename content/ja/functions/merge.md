---
aliases: []
categories:
- functions
date: "2019-08-08"
description: 2 つ以上のマップをマージした結果を返します。
draft: false
hugoversion: 0.56.0
keywords:
- dictionary
menu:
  docs:
    parent: functions
relatedfuncs:
- dict
- append
- reflect.IsMap
- reflect.IsSlice
signature:
- collections.Merge MAP MAP...
- merge MAP MAP...
title: merge
workson: []
---

2 つ以上のマップを左から右へマージした結果を返します。 キーがすでに存在する場合、 `merge` はその値を更新します。 キーが存在しない場合、 `merge` がその値を新しいキーの下に挿入します。

キーの処理では、大文字と小文字が区別されません。

以下の例では、これらのマップ定義を使用しています。

```go-html-template
{{ $m1 := dict "x" "foo" }}
{{ $m2 := dict "x" "bar" "y" "wibble" }}
{{ $m3 := dict "x" "baz" "y" "wobble" "z" (dict "a" "huey") }}
```

例 1

```go-html-template
{{ $merged := merge $m1 $m2 $m3 }}

{{ $merged.x }}   --> baz
{{ $merged.y }}   --> wobble
{{ $merged.z.a }} --> huey
```

例 2

```go-html-template
{{ $merged := merge $m3 $m2 $m1 }}

{{ $merged.x }}   --> foo
{{ $merged.y }}   --> wibble
{{ $merged.z.a }} --> huey
```

例 3

```go-html-template
{{ $merged := merge $m2 $m3 $m1 }}

{{ $merged.x }}   --> foo
{{ $merged.y }}   --> wobble
{{ $merged.z.a }} --> huey
```

例 4

```go-html-template
{{ $merged := merge $m1 $m3 $m2 }}

{{ $merged.x }}   --> bar
{{ $merged.y }}   --> wibble
{{ $merged.z.a }} --> huey
```

{{% note %}}
深さに関係なく、マージはマップにのみ適用されます。 スライスの場合は、 [append]({{< ref "functions/append" >}}) を使ってください。
{{% /note %}}
