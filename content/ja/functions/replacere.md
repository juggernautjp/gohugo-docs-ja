---
aliases: []
categories:
- functions
date: "2017-02-01"
deprecated: false
description: 正規表現のすべての出現箇所を置換パターンに置き換えます。
draft: false
hugoversion: null
keywords:
- replace
- regex
lastmod: "2020-09-07"
menu:
  docs:
    parent: functions
publishdate: "2017-02-01"
relatedfuncs: [replace,findRE]
signature:
- "replaceRE PATTERN REPLACEMENT INPUT [LIMIT]"
- "strings.ReplaceRE PATTERN REPLACEMENT INPUT [LIMIT]"
title: replaceRE
workson: []
---
デフォルトでは、 `replaceRE` 関数はすべてのマッチを置換します。オプションの LIMIT パラメータを指定することで、マッチの数を制限することができます。

正規表現を指定するときは、構文を簡単にするために、解釈された文字列リテラル (二重引用符) ではなく、生の [文字列リテラル][string literal] (バッククォート) を使用します。解釈された文字列リテラルを使用する場合は、バックスラッシュをエスケープする必要があります。

正規表現の構文は、Perl や Python などで使われている一般的な構文と同じです。より正確には、`\C` を除いた [RE2] で認められている構文です。

以下の例では、2 つ以上連続するハイフンを 1 つのハイフンに置き換えています。

```go-html-template
{{ $s := "a-b--c---d" }}
{{ replaceRE `(-{2,})` "-" $s }} → a-b-c-d
```

置換の数を 1 つに制限するには、以下のように書きます。

```go-html-template
{{ $s := "a-b--c---d" }}
{{ replaceRE `(-{2,})` "-" $s 1 }} → a-b-c---d
```

置換文字列内で `$1`、`$2` などを使用して、以下のように、正規表現内でキャプチャされたグループを挿入できます。

```go-html-template
{{ $s := "http://gohugo.io/docs" }}
{{ replaceRE "^https?://([^/]+).*" "$1" $s }} → gohugo.io
```

{{% note %}}
[regex101.com](https://regex101.com/) を使えば、正規表現を書いてテストすることができます。始める前に、必ず Go フレーバーを選択してください。
{{% /note %}}

[RE2]: https://github.com/google/re2/wiki/Syntax
[string literal]: https://go.dev/ref/spec#String_literals
