---
aliases: []
categories:
- functions
date: "2017-02-01"
deprecated: false
description: 指定された `path` の `Page` を取得します。
draft: false
hugoversion: null
keywords:
- sections
- lists
- indexes
lastmod: "2017-02-01"
menu:
  docs:
    parent: functions
publishdate: "2017-02-01"
relatedfuncs: []
signature:
- .GetPage PATH
title: .GetPage
workson: []
---

`.GetPage` は指定された `path` のページを返します。 `Site` と `Page` の両方がこのメソッドを実装しています。 `Page` バリアントは、相対パス (つまり、先頭に `/` がないパス) が指定された場合、現在のページからの相対パスを探します。

{{% note %}}
**注意:** Hugo 0.45 では、`.GetPage` API を見直して簡素化しました。 それ以前は、たとえば `{{ .Site.GetPage "section" "blog" }}` のように、パスに加えて `Kind` 属性を指定する必要がありました。これは現在も有効ですが、不要になりました。
{{% /note %}}


```go-html-template
{{ with .Site.GetPage "/blog" }}{{ .Title }}{{ end }}
```

このメソッドは、ページが見つからない場合は `nil` を返すため、ブログ セクションが見つからない場合、上記は何も出力しません。

ブログ セクションで通常ページを見つけるには、以下のようにします。

```go-html-template
{{ with .Site.GetPage "/blog/my-post.md" }}{{ .Title }}{{ end }}
```

また、`Page` も `.GetPage` メソッドを提供するため、上記は以下のようになります。

```go-html-template
{{ with .Site.GetPage "/blog" }}
{{ with .GetPage "my-post.md" }}{{ .Title }}{{ end }}
{{ end }}
```

## .GetPage と多言語対応サイト {#getpage-and-multilingual-sites}

これまでの例では、投稿を検索するためにコンテンツの完全なファイル名を使用していました。コンテンツの構成によっては (ファイル名に言語コードが含まれているかどうか、たとえば `my-post.en.md` など)、拡張子なしで検索を行いたい場合があります。 これにより、ページの現在の言語バージョンが取得されます。

```go-html-template
{{ with .Site.GetPage "/blog/my-post" }}{{ .Title }}{{ end }}
```

## .GetPage の例 {#getpage-example}

このコード スニペットは --- [部分テンプレート][partials]の形式で --- 以下のことが実行できます。

1. `tags` [タクソノミー][taxonomy] のインデックス オブジェクトを取得します。
2. このオブジェクトを変数 `$t` に代入します。
3. タクソノミーに関連する用語を人気順で並べ替えます。
4. タクソノミーの中で最も人気のある上位 2 つの用語 (つまり、コンテンツに割り当てられた最も人気のある 2 つのタグ) を取得します。

{{< code file="grab-top-two-tags.html" >}}
<ul class="most-popular-tags">
{{ $t := .Site.GetPage "/tags" }}
{{ range first 2 $t.Data.Terms.ByCount }}
    <li>{{ . }}</li>
{{ end }}
</ul>
{{< /code >}}

## ページバンドルで `.GetPage` を使用する {#getpage-on-page-bundles}

`.GetPage` によって取得されたページが [リーフバンドル][leaf_bundle] であり、その中でネストされた _**ページ** リソース_ を取得する必要がある場合は、[ページリソース][page_resources] セクションで説明したように `.Resources` メソッドを使用する必要があります。

例については、ドキュメントの [「ヘッドレス バンドル」][headless_bundle] を参照してください。


[partials]: /templates/partials/
[taxonomy]: /content-management/taxonomies/
[page_kinds]: /templates/section-templates/#page-kinds
[leaf_bundle]: /content-management/page-bundles/#leaf-bundles
[headless_bundle]: /content-management/page-bundles/#headless-bundle
[page_resources]: /content-management/page-resources/
