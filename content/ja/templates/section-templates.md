---
aliases:
- /templates/sections/
categories:
- templates
date: "2017-02-01"
description: セクションページに使用されるテンプレートは **リスト** であるため、リストページで使用できるすべての変数とメソッドを備えています。
draft: false
keywords:
- lists
- sections
- templates
lastmod: "2017-02-01"
linktitle: セクション テンプレート
menu:
  docs:
    parent: templates
    weight: 40
publishdate: "2017-02-01"
sections_weight: 40
title: セクションページ テンプレート
toc: true
weight: 40
---

## セクション テンプレートにコンテンツとフロントマターを追加する {#add-content-and-front-matter-to-section-templates}

セクションページ テンプレートを効果的に活用するには、まず Hugo の [コンテンツ構成](/content-management/organization/) を理解し、特に、セクションやその他のリストページにコンテンツやフロントマターを追加するための `_index.md` の目的を理解する必要があります。

## セクション テンプレートの検索順序 {#section-template-lookup-order}

[「テンプレートの検索順序」](/templates/lookup-order/) を参照してください。

## ページの種類 {#page-kinds}

Hugo のすべての `Page` には、 `.Kind` 属性があります。

{{% page-kinds-ja %}}

## セクションを含む `.Site.GetPage` {#sitegetpage-with-sections}

`Kind` はテンプレートの中で [`where` 関数][where] と組み合わせることで、簡単にコンテンツの種類に応じたリストを作成できます。この方法はリストを作成するのに適していますが、セクションのパスを介して、単一のセクションのインデックスページだけを取得したい場合もあります。

[`.GetPage` 関数][getpage] は、指定された `Kind` と `path` のインデックスページを検索します。

`kind` (上記の `Kind` の有効な値の 1 つ) と `kind value` の 2 つの引数を指定して、`.Site.GetPage` を呼び出すことができます。 

例:

- `{{ .Site.GetPage "section" "posts" }}`
- `{{ .Site.GetPage "page" "search" }}`

## 例: デフォルトのセクション テンプレートを作成する {#example-creating-a-default-section-template}

{{< code file="layouts/_default/section.html" download="section.html" >}}
{{ define "main" }}
  <main>
      {{ .Content }}
          <ul class="contents">
          {{ range .Paginator.Pages }}
              <li>{{.Title}}
                  <div>
                    {{ partial "summary.html" . }}
                  </div>
              </li>
          {{ end }}
          </ul>
      {{ partial "pagination.html" . }}
  </main>
{{ end }}
{{< /code >}}

### 例: `.Site.GetPage` を使用する {#example-using-sitegetpage}

この後の `.Site.GetPage` の例では、以下のようなプロジェクトのディレクトリ構造を想定しています。

```txt
.
└── content
    ├── blog
    │   ├── _index.md # "title: My Hugo Blog" in the front matter
    │   ├── post-1.md
    │   ├── post-2.md
    │   └── post-3.md
    └── events #Note there is no _index.md file in "events"
        ├── event-1.md
        └── event-2.md
```

`.Site.GetPage` は `_index.md` ページが見つからなければ、 `nil` を返します。したがって、`content/blog/_index.md` が存在しない場合、テンプレートはセクション名を出力します。

```go-html-template
<h1>{{ with .Site.GetPage "section" "blog" }}{{ .Title }}{{ end }}</h1>
```

`blog` は `content/blog/_index.md` にフロントマターのあるセクション インデックスページを持っているので、上記のコードは以下の結果を返します。

```html
<h1>My Hugo Blog</h1>
```

しかし、同じコードを `events` セクションで試すと、Hugo はセクションのタイトルをデフォルトにします。コンテンツとフロントマターを取得するための `content/events/_index.md` が存在しないためです。

```go-html-template
<h1>{{ with .Site.GetPage "section" "events" }}{{ .Title }}{{ end }}</h1>
```

上記のコードは、以下を返します。

```html
<h1>Events</h1>
```

[contentorg]: /content-management/organization/
[getpage]: /functions/getpage/
[lists]: /templates/lists/
[lookup]: /templates/lookup-order/
[where]: /functions/where/
[sections]: /content-management/sections/
