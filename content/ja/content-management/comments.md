---
aliases:
- /extras/comments/
categories:
- project organization
- fundamentals
date: "2017-02-01"
description: Hugo には Disqus テンプレートが内蔵されていますが、新しい Hugo の Web サイトで使用できるコメントシステムはこれだけではありません。
draft: false
keywords:
- sections
- content
- organization
linktitle: コメント
menu:
  docs:
    parent: content-management
    weight: 220
publishdate: "2017-02-01"
title: コメント
toc: true
weight: 220
---

Hugo では、JavaScript を介して Web サイトにコメントやコミュニティの機能を提供するサードパーティ製サービスである [Disqus](https://disqus.com/) をサポートしています。

あなたのテーマはすでに Disqus をサポートしているかもしれませんが、そうでない場合は、[Hugo 内蔵の Disqus パーシャル (部分テンプレート)][disquspartial] を介してテンプレートに簡単に追加できます。

## Disqus を追加する {#add-disqus}

Hugo には Disqus をテンプレートに読み込むために必要なすべてのコードが付属しています。Disqus をあなたのサイトに追加する前に、[Disqus アカウントの設定][disqussetup] が必要です。

### Disqus を設定する {#configure-disqus}

Disqus のコメントでは、[サイトの設定ファイル][configuration] に以下のような 1 つの値を設定する必要があります。

{{< code-toggle copy="false" >}}
disqusShortname = "yourDisqusShortname"
{{</ code-toggle >}}

多くの Web サイトでは、これで十分な設定です。しかし、1つのコンテンツファイルの [フロントマター][front matter] に以下を設定するオプションも用意されています。

* `disqus_identifier`
* `disqus_title`
* `disqus_url`

### Hugo 内蔵の Disqus 部分テンプレートをレンダリングする {#render-hugos-built-in-disqus-partial-template}

Disqus は独自の [内部テンプレート](https://gohugo.io/templates/internal/#disqus) を用意しており、コメントを表示する場所に以下のコードを追加してレンダリングします。

```go-html-template
{{ template "_internal/disqus.html" . }}
```

## 代替案 {#alternatives}

以下は Disqus の代替となるものです。

* [Cactus Comments](https://cactus.chat/docs/integrations/hugo/) (オープンソース、Matrix アプリサービス、Docker インストール)
* [Commento](https://commento.io/) (オープンソース、サービス、ローカルインストール、または Docker イメージとして利用可能)
* [Graph Comment](https://graphcomment.com/)
* [Hyvor Talk](https://talk.hyvor.com/) (サービスとして利用可能)
* [IntenseDebate](https://intensedebate.com/)
* [Isso](https://posativ.org/isso/) (セルフホスティング、Python) ([チュートリアル][issotutorial])
* [Muut](https://muut.com/)
* [Remark42](https://remark42.com/) (オープンソース、Golang、簡単に実行できる docker)
* [ReplyBox](https://getreplybox.com/)
* [Staticman](https://staticman.net/)
* [Talkyard](https://blog-comments.talkyard.io/) (オープンソース、サーバーレス ホスティング)
* [Utterances](https://utteranc.es/) (オープンソース、GitHub のイシューで構築された GitHub コメントウィジェット)

[configuration]: /getting-started/configuration/
[disquspartial]: /templates/internal/#disqus
[disqussetup]: https://disqus.com/profile/signup/
[forum]: https://discourse.gohugo.io
[front matter]: /content-management/front-matter/
[kaijuissue]: https://github.com/spf13/kaiju/issues/new
[issotutorial]: https://stiobhart.net/2017-02-24-isso-comments/
[partials]: /templates/partials/
[MongoDB]: https://www.mongodb.com/
[tweet]: https://twitter.com/spf13
