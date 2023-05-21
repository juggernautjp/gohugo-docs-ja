---
aliases: []
categories:
- functions
date: "2017-02-01"
deprecated: false
description: 任意の配列、スライス、マップをループし、すべての値を区切り文字で区切った文字列を返します。
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
signature:
- delimit COLLECTION DELIMIT LAST
title: delimit
toc: false
workson:
- lists
- taxonomies
- terms
---

テンプレートで呼び出される `delimit` は、以下のような形式をとります。

```go-html-template
{{ delimit array/slice/map delimiter optionallastdelimiter}}
```

`delimit` は任意の配列、スライス、またはマップをループして、すべての値を区切り文字 (関数呼び出しの第 2 引数) で区切った文字列を返します。 オプションの第 3 パラメータで、ループの最後の 2 つの値の間に別の区切り文字を指定できます。

一貫した出力順序を維持するために、マップはキーでソートされ、値のスライスのみが返されます。

以下の `delimit` の例では、すべて同じフロントマターを使用しています。

{{< code file="delimit-example-front-matter.toml" nocopy="true" >}}
+++
title: I love Delimit
tags: [ "tag1", "tag2", "tag3" ]
+++
{{< /code >}}

{{< code file="delimit-page-tags-input.html" >}}
<p>Tags: {{ delimit .Params.tags ", " }}</p>
{{< /code >}}

{{< output file="delimit-page-tags-output.html" >}}
<p>Tags: tag1, tag2, tag3</p>
{{< /output >}}

以下は同じ例ですが、オプションで「最後の」区切り文字を使用しています。

{{< code file="delimit-page-tags-final-and-input.html" >}}
Tags: {{ delimit .Params.tags ", " ", and " }}
{{< /code >}}

{{< output file="delimit-page-tags-final-and-output.html" >}}
<p>Tags: tag1, tag2, and tag3</p>
{{< /output >}}


[lists]: /templates/lists/
[taxonomies]: /templates/taxonomy-templates/#taxonomy-list-templates
[terms]: /templates/taxonomy-templates/#terms-list-templates
