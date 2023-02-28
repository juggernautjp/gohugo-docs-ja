---
aliases:
- /templates/lookup/
categories:
- templates
- fundamentals
date: "2017-02-01"
description: Hugo は、指定されたページに使用するレイアウトを、最も具体的なものから定義された順序で検索します。
draft: false
keywords:
- templates
lastmod: "2017-07-05"
linktitle: テンプレートの検索順序
menu:
  docs:
    parent: templates
    weight: 15
  quicklinks: null
publishdate: "2017-02-01"
sections_weight: 15
title: Hugo の検索順序
toc: true
weight: 15
---

## Hugo レイアウトの検索順序ルール {#hugo-layouts-lookup-rules}

Hugo は、特定のページのレイアウトを選択する際に、以下に示すパラメータを考慮します。これらは優先順位の高い順に並んでいます。これは自然に感じられるはずですが、さまざまなパラメータのバリエーションの具体例については、下の表を見てください。


Kind (種類)
: ページ `Kind` (ホームページは 1 つ)。種類ごとに以下の表の例を参照してください。これはまた、それが **シングルページ** (つまり、通常のコンテンツページ。その後、HTML 用の `_default/single.html` にあるテンプレートを探します)、または **リストページ** (セクションリスト、ホームページ、タクソノミーリスト、タクソノミー用語。その後、HTML 用の `_default/list.html` にあるテンプレートを探します)。

Layout (レイアウト)
: フロントマターのページに設定できます。

Output Format (出力形式)
: [カスタム出力形式](/templates/output-formats) を参照してください。 出力形式には、`name` (たとえば、 `rss`、`amp`、`html`) と `suffix` (たとえば、 `xml`、`html`) の両方があります。 両方の一致を優先します (たとえば、 `index.amp.html`) ですが、あまり具体的でないテンプレートを探します。

出力形式のメディアタイプに複数のサフィックスが定義されている場合、最初のサフィックスのみが考慮されることに注意してください。

Language (言語)
: テンプレート名の中に言語コードがあることを考慮します。サイトの言語が `fr` であれば、`index.fr.amp.html` が `index.amp.html` に優先しますが、 `index.amp.html` は `index.fr.html` よりも先に選ばれることになります。

Type (タイプ)
: フロントマターで設定されている場合は `type` の値、そうでない場合はルートセクションの名前です (たとえば、 "blog")。 常に値を持つので、設定されていない場合、値は "page" になります。

Section (セクション)
: `section`、`taxonomy`、`term` タイプに関連します。

{{% note %}}
**ヒント:** 以下の例は長くて複雑に見えますが、これは柔軟性のためです。ほとんどの Hugo サイトには、ほんの一握りのテンプレートしかありません。

```bash
├── _default
│   ├── baseof.html
│   ├── list.html
│   └── single.html
└── index.html
```
{{% /note %}}


## Hugo レイアウトのテーマ別検索ルール {#hugo-layouts-lookup-rules-with-theme}

Hugo では、レイアウトはプロジェクトまたはテーマのレイアウトフォルダーのいずれかに置くことができ、最も具体的なレイアウトが選択されます。 Hugo は、以下の検索順序を織り交ぜて、プロジェクトまたはテーマの中から最も具体的なものを探します。

## 例: 通常ページのレイアウトの検索 {#examples-layout-lookup-for-regular-pages}

{{< datatable-filtered-ja "output" "layouts" "Kind == page" "Example" "OutputFormat" "Suffix" "Template Lookup Order" >}}

## 例: ホームページのレイアウトの検索 {#examples-layout-lookup-for-home-page}

{{< datatable-filtered-ja "output" "layouts" "Kind == home" "Example" "OutputFormat" "Suffix" "Template Lookup Order" >}}

## 例: セクションページのレイアウトの検索 {#examples-layout-lookup-for-section-pages}

{{< datatable-filtered-ja "output" "layouts" "Kind == section" "Example" "OutputFormat" "Suffix" "Template Lookup Order" >}}

## 例: タクソノミー ページのレイアウトの検索 {#examples-layout-lookup-for-taxonomy-pages}

{{< datatable-filtered-ja "output" "layouts" "Kind == taxonomy" "Example" "OutputFormat" "Suffix" "Template Lookup Order" >}}

## 例: 用語ページのレイアウトの検索 {#examples-layout-lookup-for-term-pages}

{{< datatable-filtered-ja "output" "layouts" "Kind == term" "Example" "OutputFormat" "Suffix" "Template Lookup Order" >}}
