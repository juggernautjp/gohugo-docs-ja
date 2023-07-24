---
aliases: []
categories:
- function
date: "2017-02-01"
description: 正規表現にマッチする文字列のスライスを返します。
draft: false
keywords:
- regex
lastmod: "2017-02-01"
menu:
  docs:
    parent: function
publishdate: "2017-02-01"
relatedfuncs: [findRESubmatch, replaceRE]
signature:
- "findRE PATTERN INPUT [LIMIT]"
- "strings.FindRE PATTERN INPUT [LIMIT]"
title: findRE
---
デフォルトでは、 `findRE` 関数はすべてのマッチを検出します。オプションの LIMIT パラメータを指定することで、マッチの数を制限することができます。

正規表現を指定するときは、構文を簡単にするために、解釈された文字列リテラル (二重引用符) ではなく、生の [文字列リテラル][string literal] (バッククォート) を使用します。解釈された文字列リテラルを使用する場合は、バックスラッシュをエスケープする必要があります。

[string literal]: https://go.dev/ref/spec#String_literals

この関数は [RE2] 正規表現ライブラリを使用します。
詳細については、[RE2 構文ドキュメント][RE2 syntax documentation] を参照してください。
RE2 の `\C` エスケープ シーケンスがサポートされていないことに注意してください。

[RE2]: https://github.com/google/re2/
[RE2 syntax documentation]: https://github.com/google/re2/wiki/Syntax/

{{% note %}}
RE2 の構文は、大まかに言えば [PCRE] で認められている構文のサブセットであり、さまざまな [注意事項][caveats] があります。

[caveats]: https://swtch.com/~rsc/regexp/regexp3.html#caveats
[PCRE]: https://www.pcre.org/
{{% /note %}}

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
