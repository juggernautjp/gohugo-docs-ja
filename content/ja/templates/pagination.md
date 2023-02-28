---
aliases:
- /extras/pagination
- /doc/pagination/
categories:
- templates
date: "2017-02-01"
description: Hugo は、ホームページ、セクションページ、タクソノミーのページ付け (ページネーション) をサポートしています。
draft: false
keywords:
- lists
- sections
- pagination
linktitle: ページ付け
menu:
  docs:
    parent: templates
    weight: 140
publishdate: "2017-02-01"
sections_weight: 140
title: ページ付け
toc: true
weight: 140
---

 
Hugo の [ページ付け (ページネーション)](https://developer.mozilla.org/ja/docs/Web/CSS/Layout_cookbook/Pagination) は、[`where`関数][where] や [`first`][]、[`last`][]、[`after`][] といった SQL ライクな演算子と組み合わせたときに、その真価を発揮します。 Hugo で慣れ親しんだ方法で、[コンテンツを順序付けする][lists] こともできます。

## ページ付けを設定する {#configure-pagination}

ページ付けは、[サイト設定][configuration] で設定できます。

`paginate`
: default = `10` です。この設定は、テンプレート内でオーバーライドできます。

`paginatePath`
: default = `page` です。ページ付けのページに別のパスを設定できます。

`paginate` に正の値を設定すると、ホームページ、セクション、タクソノミーのリストページが、そのサイズのチャンクに分割されます。ただし、セクション、タクソノミー、ホームページのページ付けページの生成は *遅延* であることに注意してください --- ページは、 `.Paginator` によって参照されていない場合は作成されません (下記を参照)。

`paginatePath` は `URL` をページネーターのページに適合させるために使用されます (デフォルトの設定では、 `/page/1/` 形式の URL が生成されます)。

## ページネーターのページを一覧表示する {#list-paginator-pages}

{{% warning %}}
`.Paginator` は、ページャー メニューのビルドを支援するために提供されています。 この機能は現在、ホームページとリストページ (つまり、タクソノミーとセクションリスト) でのみサポートされています。
{{% /warning %}}

`.Paginator` を設定し、使用するには以下の 2 つの方法があります。

1. 最も簡単な方法は、テンプレートから `.Paginator.Pages` を呼び出すことです。 *そのページ* のページが含まれます。
2. 利用可能なテンプレート関数と順序付けオプションで、別のページセットを選択し、そのスライスを `.Paginate` に渡します。たとえば、以下のコードです。
  * `{{ range (.Paginate ( first 50 .Pages.ByTitle )).Pages }}` または
  * `{{ range (.Paginate .RegularPagesRecursive).Pages }}`

指定された **Page** に対して、上記のオプションのいずれかを指定します。 `.Paginator` は静的なもので、一度作成すると変更できません。

同じページで `.Paginator` または `.Paginate` を複数回呼び出す場合は、すべての呼び出しが同一であることを確認する必要があります。ページの生成中に `.Paginator` または `.Paginate` の *いずれか* が呼び出されると、その結果がキャッシュされ、その後の同様の呼び出しでキャッシュされた結果が再利用されます。これは、最初の呼び出しと一致しないそのような呼び出しは、記述どおりに動作しないことを意味します。

(関数の引数は積極的に評価されることを覚えておいてください。したがって、`$paginator := cond x .Paginator (.Paginate .RegularPagesRecursive)` のような呼び出しは、*すべきではない* ことの例です。代わりに `if`/`else` を使って、正確に 1 回だけ評価されるようにします。)

グローバルなページサイズ設定 (`Paginate`) は、最後の引数に正の整数を与えることでオーバーライドできます。以下の例では、1 ページに 5 つのアイテムが表示されます。

* `{{ range (.Paginator 5).Pages }}`
* `{{ $paginator := .Paginate (where .Pages "Type" "posts") 5 }}`

また、以下のように、`GroupBy` 関数をページ付けと組み合わせて使用することも可能です。

```go-html-template
{{ range (.Paginate (.Pages.GroupByDate "2006")).PageGroups  }}
```

## ナビゲーションを構築する {#build-the-navigation}

`.Paginator` には、ページネーターのインターフェイスを構築するのに必要な情報が含まれている。

これをページに追加する最も簡単な方法は、以下のように、(`Bootstrap` と互換性のあるスタイルを使用した) 組み込みのテンプレートを含めることです。

```go-html-template
{{ template "_internal/pagination.html" . }}
```

{{% note "When to Create `.Paginator`" %}}
フィルターまたは順序付け関数を使用して `.Paginator` を作成し、**かつ**、ページリストの前にナビゲーション ボタンを表示したい場合は、使用する前に `.Paginator` を作成する必要があります。
{{% /note %}}

以下の例では、使用する前に `.Paginator` を作成する方法を示しています。

```go-html-template
{{ $paginator := .Paginate (where .Pages "Type" "posts") }}
{{ template "_internal/pagination.html" . }}
{{ range $paginator.Pages }}
   {{ .Title }}
{{ end }}
```

`where` フィルターを使用しない場合、上記の例は以下のように、さらに単純になります。

```go-html-template
{{ template "_internal/pagination.html" . }}
{{ range .Paginator.Pages }}
   {{ .Title }}
{{ end }}
```

カスタムナビゲーションを構築したい場合は、以下のプロパティを含む `.Paginator` オブジェクトを使用します。

`PageNumber`
: ページャー シーケンスにおける現在のページ番号

`URL`
: 現在のページャーへの相対 URL

`Pages`
: 現在のページャー内のページ

`NumberOfElements`
: このページの要素数

`HasPrev`
: 現在のページより前のページがあるかどうか。

`Prev`
: 前のページへのページャー

`HasNext`
: 現在のページより後ろにページがあるかどうか。

`Next`
: 次のページへのページャー

`First`
: 最初のページへのページャー

`Last`
: 最後のページへのページャー

`Pagers`
: ページ付けメニューを構築するために使用できるページャーのリスト

`PageSize`
: 各ページャーのサイズ

`TotalPages`
: ページネーターのページ数

`TotalNumberOfElements`
: このページネーターにおける全ページの要素数

## 追加情報 {#additional-information}

ページは、以下のような形式で作られています (`BLANK` は値がないことを意味します)。

```txt
[SECTION/TAXONOMY/BLANK]/index.html
[SECTION/TAXONOMY/BLANK]/page/1/index.html => [SECTION/TAXONOMY/BLANK]/index.html リダイレクトされます
[SECTION/TAXONOMY/BLANK]/page/2/index.html
....
```

[`first`]: /functions/first/
[`last`]: /functions/last/
[`after`]: /functions/after/
[configuration]: /getting-started/configuration/
[lists]: /templates/lists/
[where]: /functions/where/
