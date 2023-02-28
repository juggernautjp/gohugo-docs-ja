---
aliases: []
categories:
- functions
date: "2017-02-01"
deprecated: false
description: 正規表現にマッチする文字列のスライスを返します。
draft: false
hugoversion: null
keywords:
- regex
lastmod: "2017-02-01"
menu:
  docs:
    parent: functions
publishdate: "2017-02-01"
relatedfuncs: [replaceRE]
signature:
- "findRE PATTERN INPUT [LIMIT]"
- "strings.FindRE PATTERN INPUT [LIMIT]"
title: findRE
workson: []
---
デフォルトでは、 `findRE` 関数はすべてのマッチを検出します。オプションの LIMIT パラメータを指定することで、マッチの数を制限することができます。

正規表現を指定するときは、構文を簡単にするために、解釈された文字列リテラル (二重引用符) ではなく、生の [文字列リテラル][string literal] (バッククォート) を使用します。解釈された文字列リテラルを使用する場合は、バックスラッシュをエスケープする必要があります。

正規表現の構文は、Perl や Python などで使われている一般的な構文と同じです。より正確には、`\C` を除いた [RE2] で認められている構文です。

以下の例では、レンダリングされた `.Content` 内のすべての第 2 レベルの見出し (`h2` 要素) のスライスを返します。

```go-html-template
{{ findRE `(?s)<h2.*?>.*?</h2>` .Content }}
```

`s` フラグを指定すると、 `.` は `\n` にもマッチするようになり、改行を含む `h2` 要素を見つけることができるようになります。

マッチの数を 1 つに制限する場合は、以下のように書きます。

```go-html-template
{{ findRE `(?s)<h2.*?>.*?</h2>` .Content 1 }}
```

{{% note %}}
[regex101.com](https://regex101.com/) を使えば、正規表現を書いてテストすることができます。始める前に、必ず Go フレーバーを選択してください。
{{% /note %}}

[RE2]: https://github.com/google/re2/wiki/Syntax
[string literal]: https://go.dev/ref/spec#String_literals
