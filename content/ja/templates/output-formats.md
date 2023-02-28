---
aliases:
- /templates/outputs/
- /extras/output-formats/
- /content-management/custom-outputs/
categories:
- templates
date: "2017-03-22"
description: Hugo は、カレンダーイベント、電子書籍フォーマット、Google AMP、JSON 検索インデックスなど、複数のフォーマット、または任意のカスタムテキスト形式でコンテンツを出力できます。
draft: false
keywords:
- amp
- outputs
- rss
lastmod: "2019-12-11"
linktitle: カスタム出力形式
menu:
  docs:
    parent: templates
    weight: 18
publishdate: "2017-03-22"
sections_weight: 18
title: カスタム出力形式
toc: true
weight: 18
---

このページでは、メディアタイプと出力形式を使用してサイトを適切に設定する方法と、カスタム出力用のテンプレートを作成する場所について説明します。

## メディアタイプ {#media-types}

[メディアタイプ][media type] (_MIME タイプ_ および _コンテンツタイプ_ とも呼ばれる) は、インターネット上で送信されるファイル形式とフォーマットコンテンツの 2 つの部分の識別子のことです。

以下は、Hugo の組み込みメディアタイプの完全なセットです。

{{< datatable-ja "media" "types" "type" "suffixes" >}}

**注意:**

- カスタムのメディアタイプを追加したり、デフォルトを変更したりできます。たとえば、`text/html` のサフィックスを `asp` に変更したい場合などです。
- `Suffixes` は、Hugo でそのメディアタイプの URL とファイル名に使用される値です。
- `Type` は、新しい/カスタムの `Output Formats` を定義するときに使用する必要がある識別子です (以下を参照)。
- メディアタイプの完全なセットは、Hugo の組み込み開発サーバーに登録され、ブラウザで確実に認識されます。

メディアタイプを追加または変更するには、[サイト設定][config] の `mediaTypes` セクションで、すべてのサイトまたは特定の言語に対して定義します。

{{< code-toggle file="config" >}}
[mediaTypes]
  [mediaTypes."text/enriched"]
  suffixes = ["enr"]
  [mediaTypes."text/html"]
  suffixes = ["asp"]
{{</ code-toggle >}}

上記の例では、新しいメディアタイプ `text/enriched` をひとつ追加し、組み込みのメディアタイプ `text/html` のサフィックスを変更しています。

**注意:** これらのメディアタイプは **出力形式** 用に設定されています。Hugo のデフォルトの出力形式 (たとえば `HTML`) の一つを再定義したい場合、メディアタイプも再定義する必要があります。つまり、`HTML` 出力形式のサフィックスを `html` (デフォルト) から `htm` に変更したい場合は、メディアタイプを再定義する必要があります。

```ini
[mediaTypes]
[mediaTypes."text/html"]
suffixes = ["htm"]

# Redefine HTML to update its media type.
[outputFormats]
[outputFormats.HTML]
mediaType = "text/html"
```

**注意** 上記を機能させるには、サイト設定に `outputs` 定義も追加する必要があります。

## 出力形式の定義 {#output-format-definitions}

メディアタイプといくつかの追加設定により、**出力形式** が得られます。

以下は、Hugo の組み込み出力形式の完全なセットです。

{{< datatable-ja "output" "formats" "name" "mediaType" "path" "baseName" "rel" "protocol" "isPlainText" "isHTML" "noUgly" "permalinkable" >}}

- 1 つのページを好きなだけ多くの出力形式で出力することができ、 **それらがファイルシステム上の一意なパスに解決される限り**、無限に出力形式を定義できます。上の表では、`AMP` と `HTML` の比較というのが最も良い例です。`AMP` は `Path` の値が `amp` であるため、`HTML` バージョンを上書きしません。たとえば、 `/index.html` と `/amp/index.html` の両方を定義することができます。
- `MediaType` は、既に定義されているメディアタイプの `Type` と一致する必要があります。
- 新しい出力形式を定義したり、組み込みの出力形式を再定義したりできます。 たとえば、`AMP` ページを別のパスに配置したい場合です。

出力形式を追加または変更するには、サイトの [設定ファイル](/getting-started/configuration/) の `outputFormats` セクションで、すべてのサイトまたは特定の言語に対して定義します。

{{< code-toggle file="config" >}}
[outputFormats.MyEnrichedFormat]
mediaType = "text/enriched"
baseName = "myindex"
isPlainText = true
protocol = "bep://"
{{</ code-toggle >}}

上記の例は架空のものですが、`baseURL` が `https://example.org` を持つサイトのホームページに使用すると、URL が `bep://example.org/myindex.enr` のプレーンテキストのホームページが生成されます。

### 出力形式を設定する {#configure-output-formats}

以下は、出力形式の設定オプションとそのデフォルト値の完全なリストです。

`name`
: 出力形式の識別子です。これは、ページに必要な出力形式を定義するために使用されます。

`mediaType`
: これは、定義されたメディアタイプの `Type` と一致する必要があります。

`path`
: 出力ファイルを保存するサブパスです。

`baseName`
: リストファイル名 (ホームページなど) のベースファイル名です。 **デフォルト:** `index`

`rel`
: `link` タグで `rel` 値を作成するために使用できます。 **デフォルト:** `alternate`

`protocol`
: この出力形式に対して、 `baseURL` 内の "http://" または "https://" を置き換えます。

`isPlainText`
: テンプレートに、Go のプレーンテキスト テンプレートパーサーを使用します。 **デフォルト:** `false`

`isHTML`
: `HTML` タイプの形式にのみ関連する状況、たとえば、ページのエイリアスなど、で使用されます。 **デフォルト:** `false`.

`noUgly`
: サイトで `uglyURLs` が `true` に設定されている場合、アグリー URL をオフにするために使用されます。 **デフォルト:** `false`.

`notAlternative`
: `Page` の `AlternativeOutputFormats` 形式リストにこの形式を含めることが意味をなさない場合 (たとえば、`CSS` を使用) に有効にします。 必ずしも他の形式を置き換えるとは限らないため、ここでは _alternate_ ではなく _alternative_ という用語を使用することに注意してください。 **デフォルト:** `false`.

`permalinkable`
: `.Permalink` と `.RelPermalink` がメインではなく、レンダリングの出力形式を返すようになりました ([下記参照](#link-to-output-formats))。これは、`HTML` と `AMP` に対してデフォルトで有効になっています。 **デフォルト:** `false`.

`weight`
: これをゼロ以外の値に設定すると、最初のソート基準として使用されます。

## ページの出力形式 {#output-formats-for-pages}

Hugo の `Page` は、ファイルシステム上で複数の _出力形式_ にレンダリングできます。

### デフォルトの出力形式 {#default-output-formats}

すべての `Page` には [`Kind`][page_kinds] 属性があり、それに基づいてデフォルトの出力形式が設定されます。

| 種類 (Kind)   | デフォルトの出力形式 |
| ---------- | ---------------------- |
| `page`     | HTML                   |
| `home`     | HTML、RSS              |
| `section`  | HTML、RSS              |
| `taxonomy` | HTML、RSS              |
| `term`     | HTML、RSS              |

### 出力形式をカスタマイズする {#customizing-output-formats}

これは `outputs` という出力形式のリストを `Page` のフロントマターまたはサイト設定 (すべてのサイトか言語ごとのいずれか) で定義することで変更できます。

サイト設定ファイルの例: 

{{< code-toggle file="config" >}}
[outputs]
  home = ["HTML", "AMP", "RSS"]
  page = ["HTML"]
{{</ code-toggle >}}

上記の例では、 `section`、`taxonomy`、`term` の _出力形式_ は、デフォルトの値 `["HTML", "RSS"]` のままであることに注意してください。

{{% page-kinds-ja %}}

* `outputs` の定義は、 [`Page` `Kind`][page_kinds] (`page`、`home`、`section`、`taxonomy`、または `term`) ごとに行われます。
* 使用される名前 (たとえば、 `HTML`、`AMP`) は、定義された *出力形式* の `Name` と一致する必要があります。
  * これらの名前は、大文字と小文字が区別しません。
* これらは、コンテンツファイルのフロントマターで `Page` ごとにオーバーライドできます。

以下は、レンダリングされた `Page` の出力形式を定義するコンテンツファイルの `YAML` フロントマターの例です。

```yaml
---
date: "2016-03-19"
outputs:
- html
- amp
- json
---
```

## 出力形式を一覧表示する {#list-output-formats}

それぞれの `Page` には `.OutputFormats` (現在のものを含むすべての形式) と `.AlternativeOutputFormats` 変数の両方があり、後者はサイトの `<head>` で `link rel` リストを作成するのに役立ちます。

```go-html-template
{{ range .AlternativeOutputFormats -}}
<link rel="{{ .Rel }}" type="{{ .MediaType.Type }}" href="{{ .Permalink | safeURL }}">
{{ end -}}
```

## 出力形式にリンクする {#link-to-output-formats}

`Page` の `.Permalink` と `.RelPermalink` は、そのページに定義された最初の出力形式 (他に何も定義されていない場合は、通常は `HTML`) を返します。 これは、呼び出し元のテンプレートファイルに関係ありません。

__`single.json.json` から:__
```go-html-template
{{ .RelPermalink }} > /that-page/
{{ with  .OutputFormats.Get "json" -}}
{{ .RelPermalink }} > /that-page/index.json
{{- end }}
```

現在のテンプレートファイルの出力形式を返すようにするには、指定された出力形式の `permalinkable` 設定を true にする必要があります。

**以下は、上記と同じテンプレートファイルで、json 出力形式の `permalinkable` が true に設定されています。**

```go-html-template
{{ .RelPermalink }} > /that-page/index.json
{{ with  .OutputFormats.Get "html" -}}
{{ .RelPermalink }} > /that-page/
{{- end }}
```

コンテンツファイルからは、[`ref` または `relref` ショートコード](/content-management/shortcodes/#ref-and-relref) を使用できます。

```go-html-template
[Neat]({{</* ref "blog/neat.md" "amp" */>}})
[Who]({{</* relref "about.md#who" "amp" */>}})
```

## 出力形式を指定するテンプレート {#templates-for-your-output-formats}

新しい出力形式には、有用なものをレンダリングするために、対応するテンプレートが必要です。

{{% note %}}
Hugo のバージョン 0.20 以降の主な違いは、指定された `Page` のレンダリングに使用するテンプレートを選択する際に、出力形式の `Name` と MediaType の `Suffixes` を参照することです。
{{% /note %}}

下の表は、さまざまな出力形式の例と、使用されるサフィックス、および Hugo のそれぞれのテンプレートの [検索順序][lookup order] を示しています。表のすべての例は、以下のことができます。

* [ベーステンプレート][base] を使用する。
* [部分テンプレート][partials] をインクルードする。

{{< datatable-ja "output" "layouts" "Example" "OutputFormat" "Suffix" "Template Lookup Order" >}}

Hugo は、可能であれば、パーシャルのメディアタイプと出力形式も検出し、その情報を使用して、パーシャルをプレーンテキスト テンプレートとして解析するかどうかを決定します。

Hugo は指定された名前を探すので、好きな名前を付けることができます。 ただし、プレーンテキストとして扱いたい場合は、ファイルのサフィックスと、必要であれば出力形式の名前を使用する必要があります。 パターンは、以下のとおりです。

```go-html-template
[partial name].[OutputFormat].[suffix]
```

以下のパーシャルはプレーンテキストのテンプレートです (出力形式は `CSV` で、サフィックス `csv` を持つ唯一の出力形式であるため、出力形式の `Name` を含める必要はありません)。

```go-html-template
{{ partial "mytextpartial.csv" . }}
```

[base]: /templates/base/
[config]: /getting-started/configuration/
[lookup order]: /templates/lookup/
[media type]: https://en.wikipedia.org/wiki/Media_type
[partials]: /templates/partials/
[page_kinds]: /templates/section-templates/#page-kinds
