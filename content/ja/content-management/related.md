---
aliases:
- /content/related/
- /related/
categories:
- content management
date: "2017-09-05"
description: 関連するコンテンツを「See Also」セクションにリストします。
draft: false
keywords:
- content
menu:
  docs:
    parent: content-management
    weight: 110
title: 関連コンテンツ
toc: true
weight: 110
---

Hugo は、フロントマターのパラメータに基づいて、ページの関連コンテンツを特定するために一連の要素を使用します。これは、希望するインデックスとパラメータのセットに調整することも、Hugoのデフォルトの [関連コンテンツ設定](#configure-related-content) のままにしておくことも可能です。

## 関連コンテンツを一覧表示する {#list-related-content}

最大 5 つの関連ページ (同じ _date_ または _keyword_ パラメータを共有する) を一覧表示するには、シングルページのテンプレートに以下のパーシャルと同様のものを含めるだけです。

{{< code file="layouts/partials/related.html" >}}
{{ $related := .Site.RegularPages.Related . | first 5 }}
{{ with $related }}
<h3>See Also</h3>
<ul>
 {{ range . }}
 <li><a href="{{ .RelPermalink }}">{{ .Title }}</a></li>
 {{ end }}
</ul>
{{ end }}
{{< /code >}}

`Related` メソッドは、 `Page` またはオプションマップを引数にとります。
オプションマップには、以下のオプションがあります。

indices
: 検索するインデックス。

document
: 関連コンテンツを検索するドキュメント。

namedSlices
: 検索するキーワード

fragments
: フラグメントは、"fragments" タイプとして設定されたインデックスに使用される 特別なキーワードのリストを保持します。これはドキュメントのフラグメント識別子と一致します。

上記のオプションをすべて使用した架空の例として、以下を挙げておきます。

```go-html-template
{{ $page := . }}
{{ $opts := 
  "indices" (slice "tags" "keywords")
  "document" $page
  "namedSlices" (slice (keyVals "tags" "hugo" "rocks") (keyVals "date" $page.Date))
  "fragments" (slice "heading-1" "heading-2")
}}
```

{{% note %}}
Hugo 0.111.0 では、この機能が改善および簡素化されました。
以前は `Related`、`RelatedTo`、`RelatedIndicies` の3つの異なるメソッドがありましたが、
現在は `Related` という1つのメソッドのみです。
古いメソッドもまだ利用できますが、非推奨です。
また、この機能のより高度な使い方については、[このブログの記事](https://regisphilibert.com/blog/2018/04/hugo-optmized-relashionships-with-related-content/) を参照してください。
{{% /note %}}

## 関連コンテンツのコンテンツ見出しにインデックスを付ける {#index-content-headings-in-related-content}

{{< new-in "0.111.0" >}}

Hugo はコンテンツ内の見出しにインデックスを付け、これを使用して関連コンテンツを検索できます。
これを有効にするには、以下のように `related` 設定に `fragments` 型のインデックスを追加します。

{{< code-toggle file="hugo" copy=false >}}
[related]
threshold    = 20
includeNewer = true
toLower      = false
[[related.indices]]
name        = "fragmentrefs"
type        = "fragments"
applyFilter = false
weight      = 80
{{< /code-toggle >}}

* `name` はオプションのフロントマターのスライス属性にマップされ、ページレベルからフラグメント/見出しレベルへリンクするために使用できます。.
* `applyFilter` が有効な場合、結果の各ページの `.HeadingsFiltered` はフィルタリングされた見出しを反映します。これは関連コンテンツのリストで見出しを表示したい、以下のような場合に便利です。

```go-html-template
{{ $related := .Site.RegularPages.Related . | first 5 }}
{{ with $related }}
  <h2>See Also</h2>
  <ul>
    {{ range $i, $p := . }}
      <li>
        <a href="{{ .RelPermalink }}">{{ .Title }}</a>
        {{ with .HeadingsFiltered }}
          <ul>
            {{ range . }}
              {{ $link := printf "%s#%s" $p.RelPermalink .ID | safeURL }}
              <li>
                <a href="{{ $link }}">{{ .Title }}</a>
              </li>
            {{ end }}
          </ul>
        {{ end }}
      </li>
    {{ end }}
  </ul>
{{ end }}
```

## 関連コンテンツを設定する {#configure-related-content}

Hugo では、関連コンテンツのデフォルトの設定を適切に行うことができますが、必要に応じて、グローバルレベルまたは言語レベルで、これを細かく設定することができます。

### デフォルト設定 {#default-configuration}

プロジェクトに `related` 設定がない場合、Hugo の Related Content (関連コンテンツ) メソッドは以下のものを使用します。

{{< code-toggle file="hugo" >}}
related:
  threshold: 80
  includeNewer: false
  toLower: false
  indices:
  - name: keywords
    weight: 100
  - name: date
    weight: 10
{{< /code-toggle >}}

なお、タクソノミーとして `tags` を設定している場合は、上記のデフォルトの設定に `tags` も `80` という重みで追加されることになります。

カスタム設定も同じ構文で設定する必要があります。

{{< note >}}
`related` 設定セクションを追加する場合、完全な設定を追加する必要があります。たとえば `includeNewer` のみ設定し、残りは Hugo のデフォルトを使用する、ということはできません。
{{< /note >}}

### トップレベルの設定オプション {#top-level-config-options}

threshold
: 0 から 100 の値です。 値が低いほど、より多くの一致が得られますが、あまり関連性がない可能性があります。

includeNewer
: true に設定すると、**現在のページより新しいページ** も関連コンテンツのリストに含まれます。これは、新しい関連コンテンツが追加されたときに、古い投稿の出力が変更される可能性があることを意味します。

toLower
: true に設定すると、インデックスとクエリの両方でキーワードを小文字にします。これにより、パフォーマンスがわずかに低下しますが、より正確な結果が得られる場合があります。 これは、インデックスごとに設定することもできます。

### インデックスごとの設定オプション {#config-options-per-index}

name
: インデックス名です。この値は、ページパラメータに直接マッピングされます。Hugo は文字列 (例では `author`) とリスト (`tags`、`keywords` など)、そして時刻と日付のオブジェクトをサポートしています。

type
: {{< new-in "0.111.0" >}}. `basic` (デフォルト) または `fragments` のいずれか。

applyFilter
: {{< new-in "0.111.0" >}}. 検索結果に `type` 固有のフィルタを適用します。これは現在のところ、`fragments` タイプにのみ使用されます。

weight
: このパラメータが他のパラメータに対してどの程度重要であるかを示す、整数の重みです。 0 を指定するとこの指数をオフにすることができ、 負の値を指定することもできます。さまざまな値を試して、自分のコンテンツに最適なものを確認してください。

cardinalityThreshold (default 0)
: {{< new-in "0.111.0" >}}. インデックスから一般的なキーワードを削除するために使用されるパーセンテージ (0 ～ 100) です。 たとえば、これを 50 に設定すると、インデックス内のドキュメントの 50% 以上で使用されているすべてのキーワードが削除されます。

pattern
: これは現在、日付にのみ関連しています。 関連コンテンツを一覧表示する場合、時間的にも近いコンテンツをリストしたい場合があります。 日付インデックスのパターンとして "2006" (日付インデックスのデフォルト値) を設定すると、同じ年に公開されたページに重みが追加されます。 より忙しいブログの場合は、"200601" (年と月) がデフォルトとして適している場合があります。

toLower
: 上記を参照してください。

## パフォーマンスに関する考慮事項 {#performance-considerations}

**Hugo のミドルネームは "Fast"** ですから、この機能が非常に高速でなければリリースしなかったでしょう。

この機能は、長い間、バックログにあり、多くの人から要望されていました。最近、以下の Twitter のスレッドから開発がスタートしました。

{{< tweet user="scott_lowe" id="898398437527363585" >}}

Scott S. Lowe は、タグの `intersect` テンプレート機能を使って構築した「関連コンテンツ」セクションを削除し、1700 コンテンツページサイズのブログのビルド時間を 30秒から 2秒未満に短縮しました。

これで、高速なライブリロードをあきらめることなく、「関連コンテンツ」セクションの改良版を追加できるはずです。 ただし、以下の点に注意してください。

* `Related` メソッドを使用しない場合は、Relate Content (関連コンテンツ) 機能を使用せず、パフォーマンスは以前と同じになります。
* `.RegularPages.Related` などを呼び出すと、同じページコレクション内の検索に再利用される 1 つの逆インデックス (投稿リストと呼ばれることもあります) が作成されます。 例として、`.Pages.Related` の呼び出しに加えてこれを行うと、期待どおりに機能しますが、追加の逆インデックスが 1 つ作成されます。 これでも非常に高速ですが、特に大規模なサイトの場合は注意が必要です。

{{< note >}}
現在、**ページコンテンツ** のインデックスは作成していません。[シャーロックの最後の事件](https://github.com/joearms/sherlock) を解決する前に、多くの人に喜んでもらえるようなものを公開しようと考えたのです。
{{< /note >}}
