---
aliases:
- /functions/index/
categories:
- functions
date: "2017-02-01"
deprecated: false
description: 渡されたデータ構造のインデックスまたはキーを検索します。
draft: false
hugoversion: null
keywords: []
lastmod: "2017-02-01"
linktitle: index
menu:
  docs:
    parent: functions
needsexample: true
publishdate: "2017-02-01"
relatedfuncs: []
signature:
- index COLLECTION INDEXES
- index COLLECTION KEYS
title: index
workson: []
---

`index` 関数は、最初の引数を以下の引数でインデックス付けした結果を返します。 インデックス付きの各アイテムは、マップまたはスライスである必要があります。 たとえば、以下のようです。

```go-text-template
{{ $slice := slice "a" "b" "c" }}
{{ index $slice 1 }} => b
{{ $map := dict "a" 100 "b" 200 }}
{{ index $map "b" }} => 200
```

この関数は複数のインデックスを引数にとり、これを利用して、たとえば以下のように、ネストした値を得ることができます。

```go-text-template
{{ $map := dict "a" 100 "b" 200 "c" (slice 10 20 30) }}
{{ index $map "c" 1 }} => 20
{{ $map := dict "a" 100 "b" 200 "c" (dict "d" 10 "e" 20) }}
{{ index $map "c" "e" }} => 20
```

以下のように、複数のインデックスをスライスとして書くことができます。

```go-text-template
{{ $map := dict "a" 100 "b" 200 "c" (dict "d" 10 "e" 20) }}
{{ $slice := slice "c" "e" }}
{{ index $map $slice }} => 20
```

## 例: フロントマター パラメータに基づいて、パスからデータをロードする {#example-load-data-from-a-path-based-on-front-matter-params}

`content/vacations/` に書かれたすべての記事のフロントマターに `location = ""` フィールドを追加したいと仮定します。 このフィールドを使って、 `single.html` テンプレートの記事の一番下に場所に関する情報を入力したいと思います。 また、`data/locations/` には、以下のようなディレクトリがあります。

```
.
└── data
    └── locations
        ├── abilene.toml
        ├── chicago.toml
        ├── oslo.toml
        └── provo.toml
```

以下は、その一例です。

{{< code-toggle file="data/locations/oslo" >}}
website = "https://www.oslo.kommune.no"
pop_city = 658390
pop_metro = 1717900
{{< /code-toggle >}}

ここではオスロ (oslo) に関する記事を例にとり、そのフロントマターには `data/locations/` 内の対応するファイル名とまったく同じ名前を設定します。

```ini
title = "My Norwegian Vacation"
location = "oslo"
```

`oslo.toml` のコンテンツには、`.Site.Data.locations.oslo` というノードパスを使用してテンプレートからアクセスできます 。 ただし、フロントマターによって、必要なファイルは変わってきます。

そこで必要となるのが `index` 関数です。この使用例では、`index` は、以下の 2 つのパラメータを受け取ります。

1. ノードパス
2. 希望するデータに対応する文字列 (たとえば、&mdash;)

```go-html-template
{{ index .Site.Data.locations “oslo” }}
```

`.Params.location` の変数は文字列なので、上記の例では `oslo` に置き換えることができます。

```go-html-template
{{ index .Site.Data.locations .Params.location }}
=> map[website:https://www.oslo.kommune.no pop_city:658390 pop_metro:1717900]
```

この呼び出しは、コンテンツのフロントマターで指定された場所に応じて特定のファイルを返しますが、おそらくテンプレートに特定のプロパティを書き込むことになるでしょう。そのためには、ドット記法（`.`）でノードパスを下に進むことで、これを行うことができます。

```go-html-template
{{ (index .Site.Data.locations .Params.location).pop_city }}
=> 658390
```
