---
aliases:
- /content/summaries/
- /content-management/content-summaries/
categories:
- content management
date: "2017-01-10"
description: Hugo はコンテンツの要約 (サマリー) を生成します。
draft: false
keywords:
- summaries
- abstracts
- read more
lastmod: "2017-01-10"
linktitle: サマリー
menu:
  docs:
    parent: content-management
    weight: 160
publishdate: "2017-01-10"
title: コンテンツサマリー
toc: true
weight: 160
---

`.Summary` [ページ変数][pagevariables] を使用すると、Hugo はコンテンツのサマリーを生成し、サマリービューで短縮版として使用することができます。

## サマリー分割のオプション {#summary-splitting-options}

* 自動サマリー分割
* 手動サマリー分割
* フロントマター サマリー

サマリー (要約) にオリジナルのコンテンツへのリンクを付けるのは自然なことで、このリンクを「続きを読む...」("Read More ...") ボタンの形で表示するのが一般的なデザインパターンとなっています。
詳細は、`RelPermalink`、`.Permalink`、`.Truncated` [ページ変数][pagevariables] を参照してください。

### 自動サマリー分割 {#automatic-summary-splitting}

デフォルトでは、Hugo はコンテンツの最初の 70 語を要約として自動的に取得し、テンプレートで使用するために `.Summary` ページ変数に保存します。
サマリーの長さは、[サイト設定](/getting-started/configuration/) で `summaryLength` を設定することでカスタマイズできます。

{{% note %}}
`plainify` や `safeHTML` などの関数を使用すると、サマリー内の HTML タグをどのように読み込むかをカスタマイズすることができます。
{{% /note %}}

{{% note %}}
Hugo で定義されたサマリーは、テキストを 1つ以上の連続した空白文字で分割して計算した語数を使用するように設定されています。
もし、`CJK` 言語でコンテンツを作成していて、Hugo の自動サマリー分割を使いたい場合は、[サイト設定](/getting-started/configuration/) で `hasCJKLanguage` を `true` に設定します。
{{% /note %}}

### 手動サマリー分割 {#manual-summary-splitting}

あるいは、記事を分割したい場所に <code>&#60;&#33;&#45;&#45;more&#45;&#62;<code> という要約区切り文字を追加することもできます。

[Org モードのコンテンツ][org] の場合、記事を分割したいところで `# more` を使います。

要約区切り文字の前に来るコンテンツは、そのコンテンツのサマリーとして使用され、すべての HTML フォーマットをそのままに `.Summary` ページ変数に保存されます。

{{% note "Summary Divider"%}}
*要約区切り文字* という概念は、Hugo 独自のものではありません。他の文献では「more tag (より多くのタグ)」や「excerpt separator (抜粋区切り)」とも呼ばれています。
{{% /note %}}

長所
: 自由で正確、そしてレンダリングの向上。 すべての HTML タグと書式は保持されます。

短所
: コンテンツ作成者は、各コンテンツファイルに <code>&#60;&#33;&#45;&#45;more&#45;&#62;</code> (または、[org コンテンツ][org] には `# more`) を追加することを覚えなければならないので、余計な仕事が増えることになります。これは、[アーキタイプ](/content-management/archetypes/) のフロントマターの下に要約区切り文字を追加することで自動化することができます。

{{% warning "Be Precise with the Summary Divider" %}}
<code>&#60;&#33;&#45;&#45;more&#45;&#62;</code> は正確に、つまりすべて小文字で空白を入れずに入力するように注意してください。
{{% /warning %}}

### フロントマター サマリー {#front-matter-summary}

要約を、記事の冒頭のテキスト以外のものにしたい場合があります。 この場合、記事のフロントマターの `summary` 変数に別の要約を指定できます。

長所
: 記事の内容に依存しない完全なテキストの自由度があります。 サマリー内でマークアップが使用できます。

短所
: コンテンツ作成者は、記事の要約として完全に別のテキストを書く必要があるため、追加の作業が必要です。

## サマリー選択順序 {#summary-selection-order}

要約を指定する方法は複数あるため、`.Summary` が返すテキストを決定する際に、Hugo が従う選択の順序を理解しておくと便利です。 それは以下のとおりです。

1. 記事の中に <code>&#60;&#33;&#45;&#45;more&#45;&#62;</code> 要約区切り文字がある場合、区切りまでのテキストは手動サマリー分割方式に準じて提供されます。
2. 記事のフロントマターの中に `summary` 変数がある場合、その変数の値はフロントマターのサマリーメソッドに従って提供されます。
3. 記事冒頭のテキストは、自動サマリー分割方式で提供されます

{{% warning "Competing selections" %}}
Hugo は、上記のステップのうち、テキストを返す _最初_ のステップを使用します。 ですから、たとえば、記事がフロントマターの `summary` 変数と <code>&#60;&#33;&#45;&#45;more&#45;&#62;</code> 要約区切り文字の両方を持つ場合、Hugo は自動サマリー分割方式を使用することにします。
{{% /warning %}}

## 例: 要約付きの最初の 10 件の記事 {#example-first-10-articles-with-summaries}

以下のコードで、コンテンツのサマリーを表示できます。たとえば、[セクション テンプレート][section template] sの中で、以下のスニペットを使うことができます。

{{< code file="page-list-with-summaries.html" >}}
{{ range first 10 .Pages }}
    <article>
      <!-- this <div> includes the title summary -->
      <div>
        <h2><a href="{{ .RelPermalink }}">{{ .Title }}</a></h2>
        {{ .Summary }}
      </div>
      {{ if .Truncated }}
      <!-- This <div> includes a read more link, but only if the summary is truncated... -->
      <div>
        <a href="{{ .RelPermalink }}">Read More…</a>
      </div>
      {{ end }}
    </article>
{{ end }}
{{< /code >}}

ブール変数 `.Truncated` を使って、コンテンツが切り捨てられないとき、つまり、要約が記事全体を含んでいるときに、「続きを読む...」("Read More ...") リンクを隠すことができることに注意してください。

[org]: /content-management/formats/
[pagevariables]: /variables/page/
[section template]: /templates/section-templates/
