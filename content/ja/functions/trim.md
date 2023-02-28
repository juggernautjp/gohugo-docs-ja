---
categories:
- functions
date: "2017-02-01"
deprecated: false
description: 文字列のスライスから、カットセットで指定された先頭および末尾の文字を削除して返します。
draft: false
hugoversion: null
keywords:
- strings
lastmod: "2017-02-01"
menu:
  docs:
    parent: functions
publishdate: "2017-02-01"
relatedfuncs: []
signature:
- "trim INPUT CUTSET"
- "strings.Trim INPUT CUTSET"
title: trim
workson: []
---

```go-html-template
{{ trim "++Batman--" "+-" }} → "Batman"
```

`trim` は、 第 2 引数を必要とします。この引数は、最初の引数から何を取り除くかを具体的に関数に伝えます。第 2 引数にはデフォルト値がないので、**以下のような使い方はうまくいきません**。

```go-html-template
{{ trim .Inner}}
```

代わりに、以下の例では、[ショートコードの `.Inner` 変数][shortcodevars] に含まれるコンテンツから余分な改行を削除するように `trim` に指示しています。

```go-html-template
{{ trim .Inner "\n" }}
```

{{% note %}}
Go テンプレートは、ハイフン (`-`) を含めることにより、Go タグの両側から単純に [空白文字を削除する方法](/templates/introduction/#whitespace) も提供します。
{{% /note %}}


[shortcodevars]: /variables/shortcodes/
