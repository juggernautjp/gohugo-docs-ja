---
aliases: []
categories:
- functions
date: "2017-02-01"
deprecated: false
description: マップ、配列、またはスライスを指定すると、 `apply` は関数が適用された新しいスライスを返します。
draft: false
hugoversion: null
keywords:
- advanced
lastmod: "2017-02-01"
menu:
  docs:
    parent: functions
publishdate: "2017-02-01"
relatedfuncs: []
signature:
- apply COLLECTION FUNCTION [PARAM...]
title: apply
workson: []
---

{{< todo >}}
潜在的な新しいコンテンツ: apply/sequence の議論を参照してください: https://discourse.gohugo.io/t/apply-printf-on-a-sequence/5722;
{{< /todo >}}

`apply` は、適用される関数に応じて、少なくとも以下の 3 つのパラメータを必要とします。

1. 最初のパラメーターは、操作するシーケンスです。
2. 第 2 パラメータは、文字列としての関数名で、有効な [Hugo 関数][functions] の名前でなければなりません。
3. その後には、適用する関数のパラメータを、関数を適用するシーケンスの各要素を表す文字列 `"."` とともに指定します。

以下は、フロントマター フィールドとして `names:` を持つコンテンツファイルの例です。

```ini
+++
names: [ "Derek Perkins", "Joe Bergevin", "Tanner Linsley" ]
+++
```

そして、以下のように `apply` を使用することができます。

```go-html-template
{{ apply .Params.names "urlize" "." }}
```

上記のコードの結果は、以下のようになります。

```
"derek-perkins", "joe-bergevin", "tanner-linsley"
```

これは、[range][] で以下を使用するのと*ほぼ*同等です。

```go-html-template
{{ range .Params.names }}{{ . | urlize }}{{ end }}
```

ただし、範囲の出力を [`delimit`関数][delimit] に与えることはできないので、それを `apply` する必要があります。

`post-tag-list.html` と `post-tag-link.html` が [部分テンプレート][[partials] であれば、それぞれ以下のようなスニペットを使うことが*できます。

{{< code file="layouts/partials/post-tag-list.html" copy="false" >}}
{{ with .Params.tags }}
<div class="tags-list">
  Tags:
  {{ $len := len . }}
  {{ if eq $len 1 }}
    {{ partial "post-tag-link.html" (index . 0) }}
  {{ else }}
    {{ $last := sub $len 1 }}
    {{ range first $last . }}
      {{ partial "post-tag-link.html" . }},
    {{ end }}
    {{ partial "post-tag-link.html" (index . $last) }}
  {{ end }}
</div>
{{ end }}
{{< /code >}}

{{< code file="layouts/partials/post-tag-link.html" copy="false" >}}
<a class="post-tag post-tag-{{ . | urlize }}" href="/tags/{{ . | urlize }}">{{ . }}</a>
{{< /code >}}

これは機能しますが、`post-tag-list.html` の複雑さはかなり高いです。 Hugo テンプレートは、タグが 1 つしかない場合に特別な動作を実行する必要があり、最後のタグを特別なものとして扱う必要があります。 さらに、HTML が生成され、ブラウザによって解釈される方法により、タグリストは `Tags: tag1 , tag2 , tag3` のようにレンダリングされます。

この最初のバージョンの `layouts/partials/post-tag-list.html` は、読みやすくするためにすべての操作を分離しています。 以下に、より DRY な統合バージョンを示します。

```go-html-template
{{ with .Params.tags }}
    <div class="tags-list">
      Tags:
      {{ $sort := sort . }}
      {{ $links := apply $sort "partial" "post-tag-link.html" "." }}
      {{ $clean := apply $links "chomp" "." }}
      {{ delimit $clean ", " }}
    </div>
{{ end }}
```

完成版では、タグをソートし、`layouts/partials/post-tag-link.html` でタグをリンクに変換し、 [chomp][] で不要な改行を削除し、タグを区切りリストで結合して表示することができるようになりました。先ほどの例をさらに DRY にしたものを、以下に示します。

{{< code file="layouts/partials/post-tag-list.html" download="post-tag-list.html" >}}
    {{ with .Params.tags }}
    <div class="tags-list">
      Tags:
      {{ delimit (apply (apply (sort .) "partial" "post-tag-link.html" ".") "chomp" ".") ", " }}
    </div>
    {{ end }}
{{< /code >}}

{{% note %}}
パイプラインを介してシーケンスを引数として受け取る場合、`apply` は動作しません。
{{% /note %}}

[chomp]: /functions/chomp/ "chomp 関数のドキュメントを参照してください"
[delimit]: /functions/delimit/ "delimit 関数のドキュメントを参照してください"
[functions]: /functions/ "apply 関数に引数として渡すことができるものを確認するには、Hugo 関数の完全なリストを参照してください。"
[partials]: /templates/partials/
[range]: /functions/range/ "Hugo テンプレートと Go プログラミング言語の両方の基本的なキーワードである range 関数の重要性を学びます。"
