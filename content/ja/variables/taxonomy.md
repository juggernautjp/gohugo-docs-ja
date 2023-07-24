---
aliases: []
categories:
- variables and parameters
date: "2017-02-01"
description: Hugo のタクソノミー システムは、タクソノミーと用語テンプレートに変数を公開します。
draft: false
keywords:
- taxonomies
- terms
lastmod: "2017-02-01"
menu:
  docs:
    parent: variables
    weight: 30
publishdate: "2017-02-01"
title: タクソノミー変数
toc: true
weight: 30
---

## タクソノミー用語ページの変数 {#taxonomy-terms-page-variables}

タクソノミー テンプレートによってレンダリングされたページは `.Kind` に `taxonomy` が設定され、`.Type` にタクソノミー名が設定されます。

タクソノミー テンプレートでは、`.Site`、`.Page`、`.Section`、`.File` 変数、および以下の _タクソノミー_ 変数にアクセスすることができます：

.Data.Singular
: タクソノミーの単数形の名前です (たとえば、 `tags => tag`)。

.Data.Plural
: タクソノミーの複数形の名前です (たとえば、 `tags => tags`)。

.Data.Pages
: この分類法に関連する用語ページのコレクション。 `.Pages` によってエイリアスされる。

.Data.Terms
: このタクソノミーに関連する用語とウェイト (重み付けされた) ページのマップ。

.Data.Terms.Alphabetical
: このタクソノミーに関連する用語とウェイト (重み付けされた) ページをアルファベットの昇順で並べたマップ。 `Data.Terms.Alphabetical.Reverse` でソート順を逆にすることができます。

.Data.Terms.ByCount
: このタクソノミーに関連する用語とウェイト (重み付けされた) ページのマップ。 ソート順を逆にするには、 `.Data.Terms.ByCount.Reverse` を使用します。

## 用語テンプレート {#term-templates}

用語テンプレートによってレンダリングされるページは、 `.Kind` が `term` に設定され、`.Type` がタクソノミー名に設定されます。

用語テンプレートでは、`.Site`、`.Page`.、`.Section`、および `.File` 変数に加えて、以下の _用語_ 変数にアクセスできます。

.Data.Singular
: タクソノミーの単数形の名前 (たとえば、`tags => tag`)。

.Data.Plural
: タクソノミーの複数形の名前 (たとえば、`tags => tags`)。

.Data.Pages
: このタクソノミーに関連するコンテンツページのコレクション。 `.Pages` によってエイリアスされます。

.Data.Term
: 用語そのもの (たとえば、`tag-one`)。

## 任意のテンプレートからタクソノミーデータにアクセスする {#taxonomy-data-from-any-template}

`site.Taxonomies` を使用して、どのテンプレートからでもタクソノミーのデータ構造全体にアクセスできます。
Tこれは、タクソノミー、用語、および各用語に関連する重み付けされたコンテンツページのコレクションのマップを返します。
たとえば、以下です。

```json
{
  "categories": {
    "news": [
      {
        "Weight": 0,
        "Page": {
          "Title": "Post 1",
          "Date": "2022-12-18T15:13:35-08:00"
          ...
          }
      },
      {
        "Weight": 0,
        "Page": {
          "Title": "Post 2",
          "Date": "2022-12-18T15:13:46-08:00",
          ...
        }
      }
    ]
  },
  "tags": {
    "international": [
      {
        "Weight": 0,
        "Page": {
          "Title": "Post 1",
          "Date": "2021-01-01T00:00:00Z"
          ... 
        }
      }
    ]
  }
}
```

1つまたは複数の識別子を連結するか、1つまたは複数のキーを持つ [`index`] 関数を使用して、タクソノミーのデータ構造のサブセットにアクセスします。
たとえば、ニュース カテゴリに関連する加重コンテンツ ページのコレクションにアクセスするには、以下のいずれかを使用します。

[`index`]: /functions/index-function/

```go-html-template
{{ $pages := site.Taxonomies.categories.news }}
{{ $pages := index site.Taxonomies "categories" "news" }}
```

たとえば、以下のコードは、タクソノミーのデータ構造全体を入れ子の順序なしリストとしてレンダリングします。

```go-html-template
<ul>
  {{ range $taxonomy, $terms := site.Taxonomies }}
    <li>
      {{ with site.GetPage $taxonomy }}
        <a href="{{ .RelPermalink }}">{{ .LinkTitle }}</a>
      {{ end }}
      <ul>
        {{ range $term, $weightedPages := $terms }}
        <li>
          {{ with site.GetPage (path.Join $taxonomy $term) }}
            <a href="{{ .RelPermalink }}">{{ .LinkTitle }}</a>
          {{ end }}
        </li>
          <ul>
            {{ range $weightedPages }}
              <li>
                <a href="{{ .RelPermalink }}"> {{ .LinkTitle }}</a>
              </li>
            {{ end }}
          </ul>
        {{ end }}
      </ul>
    </li>
  {{ end }}
</ul>
```

その他の例については、[タクソノミー テンプレート][Taxonomy Templates] を参照してください。

[Taxonomy Templates]: /templates/taxonomy-templates/
