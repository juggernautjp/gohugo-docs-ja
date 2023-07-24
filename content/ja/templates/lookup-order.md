---
aliases:
- /templates/lookup/
categories:
- templates
- fundamentals
date: "2017-02-01"
description: Hugo は以下のルールを使用して、特定のページのテンプレートを最も具体的なものから順に選択します。
draft: false
keywords:
- templates
lastmod: "2017-07-05"
menu:
  docs:
    parent: templates
    weight: 30
  quicklinks: null
publishdate: "2017-02-01"
sections_weight: 30
title: テンプレートの検索順序
toc: true
weight: 30
---

## 検索順序ルール {#lookup-rules}

Hugo は、特定のページのレイアウトを選択する際に、以下に示すパラメータを考慮します。
これらは優先順位の高い順に並んでいます。
これは自然に感じられるはずですが、さまざまなパラメータのバリエーションの具体例については、下の表を見てください。


Kind (種類)
: ページ `Kind` (ホームページは 1 つ)。種類ごとに以下の表の例を参照してください。これはまた、それが **シングルページ** (つまり、通常のコンテンツページ。その後、HTML 用の `_default/single.html` にあるテンプレートを探します)、または **リストページ** (セクションリスト、ホームページ、タクソノミーリスト、タクソノミー用語。その後、HTML 用の `_default/list.html` にあるテンプレートを探します)。

Layout (レイアウト)
: フロントマターに設定できます。

Output Format (出力形式)
: [カスタム出力形式](/templates/output-formats) を参照してください。 出力形式には、`name` (たとえば、 `rss`、`amp`、`html`) と `suffix` (たとえば、 `xml`、`html`) の両方があります。 両方の一致を優先します (たとえば、 `index.amp.html`) ですが、あまり具体的でないテンプレートを探します。

出力形式のメディアタイプに複数のサフィックスが定義されている場合、最初のサフィックスのみが考慮されることに注意してください。

Language (言語)
: テンプレート名の中に言語タグがあることを考慮します。サイトの言語が `fr` であれば、`index.fr.amp.html` が `index.amp.html` に優先しますが、 `index.amp.html` は `index.fr.html` よりも先に選ばれることになります。

Type (タイプ)
: フロントマターで設定されている場合は `type` の値、そうでない場合はルートセクションの名前です (たとえば、 "blog")。 常に値を持つので、設定されていない場合、値は "page" になります。

Section (セクション)
: `section`、`taxonomy`、`term` タイプに関連します。

{{% note %}}
テンプレートはプロジェクトのレイアウトフォルダにもテーマのレイアウトフォルダにもあり、最も具体的なテンプレートが選択されます。Hugo は以下のルックアップを織り交ぜて、プロジェクトかテーマのどちらかで最も具体的なものを見つけます。
{{% /note %}}

## 通常ページ {#regular-pages}

{{< datatable-filtered-ja "output" "layouts" "Kind == page" "Example" "OutputFormat" "Suffix" "Template Lookup Order" >}}

## ホームページ {#home-page}

{{< datatable-filtered-ja "output" "layouts" "Kind == home" "Example" "OutputFormat" "Suffix" "Template Lookup Order" >}}

## セクションページ {#section-pages}

{{< datatable-filtered-ja "output" "layouts" "Kind == section" "Example" "OutputFormat" "Suffix" "Template Lookup Order" >}}

## タクソノミー ページ {#taxonomy-pages}

{{< datatable-filtered-ja "output" "layouts" "Kind == taxonomy" "Example" "OutputFormat" "Suffix" "Template Lookup Order" >}}

## 用語ページ {#term-pages}

{{< datatable-filtered-ja "output" "layouts" "Kind == term" "Example" "OutputFormat" "Suffix" "Template Lookup Order" >}}
