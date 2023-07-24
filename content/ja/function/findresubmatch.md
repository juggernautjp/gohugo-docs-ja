---
title: findRESubmatch
description: Returns a slice of all successive matches of the regular expression. Each element is a slice of strings holding the text of the leftmost match of the regular expression and the matches, if any, of its subexpressions.
categories: [function]
menu:
  docs:
    parent: function
keywords: [regex]
signature:
  - "findRESubmatch PATTERN INPUT [LIMIT]"
  - "strings.FindRESubmatch PATTERN INPUT [LIMIT]"
relatedfuncs: [findRE, replaceRE]
---

デフォルトでは、`findRESubmatch` はすべての一致を検索します。 オプションの LIMIT パラメータを使用して、一致の数を制限できます。 戻り値 nil は一致しないことを示します。

正規表現を指定するときは、構文を簡略化するために、解釈された文字列リテラル (二重引用符) の代わりに生の [文字列リテラル][string literal] (バックティック/バッククォート) を使用します。 解釈された文字列リテラルでは、バックスラッシュをエスケープする必要があります。

[string literal]: https://go.dev/ref/spec#String_literals

この関数は [RE2] 正規表現ライブラリを使用します。 詳細については、[RE2 構文ドキュメント][RE2 syntax documentation] を参照してください。 RE2 の `\C` エスケープ シーケンスがサポートされていないことに注意してください。

[RE2]: https://github.com/google/re2/
[RE2 syntax documentation]: https://github.com/google/re2/wiki/Syntax/

{{% note %}}
RE2 構文は、大まかに言えば [PCRE] で受け入れられているもののサブセットであり、さまざまな [注意事項][caveats] があります。

[caveats]: https://swtch.com/~rsc/regexp/regexp3.html#caveats
[PCRE]: https://www.pcre.org/
{{% /note %}}

## 実証例 {#demonstrative-examples}

```go-html-template
{{ findRESubmatch `a(x*)b` "-ab-" }} → [["ab" ""]]
{{ findRESubmatch `a(x*)b` "-axxb-" }} → [["axxb" "xx"]]
{{ findRESubmatch `a(x*)b` "-ab-axb-" }} → [["ab" ""] ["axb" "x"]]
{{ findRESubmatch `a(x*)b` "-axxb-ab-" }} → [["axxb" "xx"] ["ab" ""]]
{{ findRESubmatch `a(x*)b` "-axxb-ab-" 1 }} → [["axxb" "xx"]]
```

## 実践例 {#practical-example}

以下の Markdown は、

```md
- [Example](https://example.org)
- [Hugo](https://gohugo.io)
```

下記の HTML を生成します。

```html
<ul>
  <li><a href="https://example.org">Example</a></li>
  <li><a href="https://gohugo.io">Hugo</a></li>
</ul>
```

To match the anchor elements, capturing the link destination and text:

```go-html-template
{{ $regex := `<a\s*href="(.+?)">(.+?)</a>` }}
{{ $matches := findRESubmatch $regex .Content }}
```

リンク先とテキストをキャプチャしてアンカー要素を照合するには、以下のようにします。

```json
[
  [
    "<a href=\"https://example.org\"></a>Example</a>",
    "https://example.org",
    "Example"
  ],
  [
    "<a href=\"https://gohugo.io\">Hugo</a>",
    "https://gohugo.io",
    "Hugo"
  ]
]
```

`href` 属性をレンダリングするには、以下のようにします。

```go-html-template
{{ range $matches }}
  {{ index . 1 }}
{{ end }}
```

上記のコードは、以下の結果を出力します。

```text
https://example.org
https://gohugo.io
```

{{% note %}}
[regex101.com](https://regex101.com/) を使って正規表現を書き、テストすることができます。
始める前に必ず Go フレーバーを選択してください。
{{% /note %}}
