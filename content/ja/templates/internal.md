---
aliases: []
categories:
- templates
date: "2017-03-06"
description: Hugo は、静的 Web サイトの最も一般的な使用例 (ユースケース) をカバーする定型 (ボイラープレート) テンプレートのグループを同梱しています。
draft: false
keywords:
- internal
- analytics
lastmod: "2017-03-06"
linktitle: 内部テンプレート
menu:
  docs:
    parent: templates
    weight: 168
publishdate: "2017-03-06"
sections_weight: 168
title: 内部テンプレート
toc: true
weight: 168
wip: true
---
<!-- reference: https://discourse.gohugo.io/t/lookup-order-for-partials/5705/6
code: https://github.com/gohugoio/hugo/blob/e445c35d6a0c7f5fc2f90f31226cd1d46e048bbc/tpl/template_embedded.go#L147 -->

{{% warning %}}
以下の内部テンプレートはパーシャル (部分テンプレート) と同様に呼ばれますが、部分テンプレートの検索順序を *守りません*。
{{% /warning %}}

## Google アナリティクス {#google-analytics}

Hugo には、[Google アナリティクス 4][GA4] (GA4) とユニバーサル アナリティクスの両方の Google アナリティクスをサポートする内部テンプレートが付属しています。

**注意:** ユニバーサル アナリティクスは非推奨となります。詳細については、[「ユニバーサル アナリティクスの廃止予定」][Universal Analytics will be going away] を参照してください。

[GA4]: https://support.google.com/analytics/answer/10089681
[Universal Analytics will be going away]: https://support.google.com/analytics/answer/11583528

### Google アナリティクスを設定する {#configure-google-analytics}

以下のように、設定ファイルにトラッキング ID を指定します。

**Google アナリティクス 4 (gtag.js)**
{{< code-toggle file="config" >}}
googleAnalytics = "G-MEASUREMENT_ID"
{{</ code-toggle >}}

**Google ユニバーサル アナリティクス (analytics.js)**
{{< code-toggle file="config" >}}
googleAnalytics = "UA-PROPERTY_ID"
{{</ code-toggle >}}

### Google アナリティクス テンプレートを使用する {#use-the-google-analytics-template}

次に、以下のように、Google アナリティクスの内部テンプレートを含めることができます。

```go-html-template
{{ template "_internal/google_analytics_async.html" . }}
```

**注意:** 非同期テンプレートは、Google アナリティクス 4 には適して *いません*。

```go-html-template
{{ template "_internal/google_analytics.html" . }}
```

独自のテンプレートを作成したい場合は、 `{{ site.Config.Services.GoogleAnalytics.ID }}` で設定された ID にアクセスできます。

## Disqus

Hugo には、[Disqus コメント][disqus] の内部テンプレートも同梱されています。これは、静的および動的 Web サイトの両方で人気のあるコメントシステムです。 Disqus を効果的に使用するには、[無料サービスにサインアップ][disqussignup] して Disqus の「ショートネーム」を確保する必要があります。

### Disqus を設定する {#configure-disqus}

Hugo の Disqus テンプレートを使用するには、まず、以下の設定値を一つ設定する必要があります。

{{< code-toggle file="config" >}}
disqusShortname = "your-disqus-shortname"
{{</ code-toggle >}}

また、特定のコンテンツのフロントマターに以下を設定するオプションもあります。

* `disqus_identifier`
* `disqus_title`
* `disqus_url`

### Disqus テンプレートを使用する {#use-the-disqus-template}

Disqus を追加するには、コメントを表示するテンプレートに以下の行を含めます。

```go-html-template
{{ template "_internal/disqus.html" . }}
```

また、`.Site.DisqusShortname` という変数も設定から公開されています。

### Disqus コメントの条件付き読み込み {#conditional-loading-of-disqus-comments}

Hugo Web サーバーをを `localhost` で実行しているときに (つまり `hugo server` 経由で)、Disqus コメントを有効にすると、関連する Disqus アカウントに不要なディスカッションが作成されることにユーザーが気づきました。

以下の `layouts/partials/disqus.html` を作成できます。

{{< code file="layouts/partials/disqus.html" download="disqus.html" >}}
<div id="disqus_thread"></div>
<script type="text/javascript">

(function() {
    // Don't ever inject Disqus on localhost--it creates unwanted
    // discussions from 'localhost:1313' on your Disqus account...
    if (window.location.hostname == "localhost")
        return;

    var dsq = document.createElement('script'); dsq.type = 'text/javascript'; dsq.async = true;
    var disqus_shortname = '{{ .Site.DisqusShortname }}';
    dsq.src = '//' + disqus_shortname + '.disqus.com/embed.js';
    (document.getElementsByTagName('head')[0] || document.getElementsByTagName('body')[0]).appendChild(dsq);
})();
</script>
<noscript>Please enable JavaScript to view the <a href="https://disqus.com/?ref_noscript">comments powered by Disqus.</a></noscript>
<a href="https://disqus.com/" class="dsq-brlink">comments powered by <span class="logo-disqus">Disqus</span></a>
{{< /code >}}

`if` 文は、`localhost` で実行している場合、 Disqus のコメント インジェクションの初期化をスキップします。

次に、カスタムの Disqus 部分テンプレートを以下のようにレンダリングできます。

```go-html-template
{{ partial "disqus.html" . }}
```

## Open Graph

[Open Graph プロトコル](https://ogp.me/) の内部テンプレートで、ページをソーシャルグラフのリッチオブジェクトにするためのメタデータです。
この形式は、Facebook や他のいくつかのサイトで使用されています。

### Open Graph を設定する {#configure-open-graph}

Hugo の Open Graph テンプレートは、個々のページで設定変数と [フロントマター](/content-management/front-matter/) を組み合わせて設定されています。

{{< code-toggle file="config" >}}
[params]
  title = "My cool site"
  images = ["site-feature-image.jpg"]
  description = "Text about my cool site"
[taxonomies]
  series = "series"
{{</ code-toggle >}}

{{< code-toggle file="content/blog/my-post" >}}
title = "Post title"
description = "Text about this post"
date = "2006-01-02"
images = ["post-cover.png"]
audio = []
videos = []
series = []
tags = []
{{</ code-toggle >}}

Hugo は、ページのタイトルと説明文をタイトルと説明文のメタデータに使用しています。
`images` 配列の最初の 6 つの URL は、画像のメタデータに使用されます。
[ページバンドル](/content-management/page-bundles/) が使用され、`images` 配列が空または未定義の場合、`*feature*` または `*cover*,*thumbnail*` に一致するファイル名を持つ画像が画像のメタデータに使用されます。

また、オプションで以下のような様々なメタデータを設定することができます。

- 日付、公開日、最終更新日データは、指定された場合、公開時刻メタデータを設定するために使用されます。
- `audio` と `videos` はそれぞれ、音声と動画のメタデータタグを表す `images` のような URL 配列です。
- ページの最初の 6 つの `tags` は、タグのメタデータに使用されます。
- `series` タクソノミーは、関連する "see also" ページを同じシリーズに配置するように指定するために使用されます。

YouTube を使用している場合、`<meta property="og:video" content="url">` のような og:video タグが生成されます。 YouTube の動画では `https://youtu.be/<id>` 形式を使用します (たとえば、 `https://youtu.be/qtIqKaDlqXo`)。

### Open Graph テンプレートを使用する {#use-the-open-graph-template}

Open Graph のメタデータを追加するには、テンプレート内の `<head>` タグの間に以下の行を含めます。

```go-html-template
{{ template "_internal/opengraph.html" . }}
```

## Twitter カード {#twitter-cards}

[Twitter カード](https://developer.twitter.com/en/docs/tweets/optimize-with-cards/overview/abouts-cards) 用の内部テンプレートで、自分のサイトへリンクするツイートにリッチメディアを添付するために使用されるメタデータになります。

### Twitter カードを設定する {#configure-twitter-cards}

Hugo の Twitter カード テンプレートは、個々のページで設定変数と [フロントマター](/content-management/front-matter/) を組み合わせて設定されています。

{{< code-toggle file="config" >}}
[params]
  images = ["site-feature-image.jpg"]
  description = "Text about my cool site"
{{</ code-toggle >}}

{{< code-toggle file="content/blog/my-post" >}}
title = "Post title"
description = "Text about this post"
images = ["post-cover.png"]
{{</ code-toggle >}}

もし `images` がページのフロントマターで指定されていなければ、hugo は `feature`、`cover` または `thumbnail` を名前に含む [画像ページのリソース](/content-management/image-processing/) を検索します。
これらの名前の画像リソースが見つからない場合、代わりに [サイト設定](/getting-started/configuration/) で定義された画像が使用されます。
画像がまったく見つからない場合は、`summary_large_image` の代わりに画像のない Twitter の `summary` カードが使用されます。

Hugo は、カードのタイトルと説明のフィールドに、ページのタイトルと説明を使用します。説明がない場合は、ページの概要が使用されます。

`.Site.Social.twitter` 変数は、設定から `twitter:site` の値として公開されます。

{{< code-toggle file="config" >}}
[social]
  twitter = "GoHugoIO"
{{</ code-toggle >}}

**注意**: `@` が追加されます

```html
<meta name="twitter:site" content="@GoHugoIO"/>
```

### Twitter カード テンプレートを使用する {#use-the-twitter-cards-template}

Twitter カードのメタデータを追加するには、テンプレート内の `<head>` 要素の直後に以下の行を含めます。

```go-html-template
{{ template "_internal/twitter_cards.html" . }}
```

## 内部テンプレート {#the-internal-templates}

以下のテンプレートのコードは、[ここ](https://github.com/gohugoio/hugo/tree/master/tpl/tplimpl/embedded/templates) にあります。

* `_internal/disqus.html`
* `_internal/google_analytics.html`
* `_internal/google_analytics_async.html`
* `_internal/opengraph.html`
* `_internal/pagination.html`
* `_internal/schema.html`
* `_internal/twitter_cards.html`

[disqus]: https://disqus.com
[disqussignup]: https://disqus.com/profile/signup/
