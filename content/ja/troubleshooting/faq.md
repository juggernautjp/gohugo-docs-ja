---
aliases:
- /faq/
categories:
- troubleshooting
date: "2018-02-10"
description: Hugo の一般的な問題の解決策です。
draft: false
keywords:
- faqs
linktitle: FAQ
menu:
  docs:
    parent: troubleshooting
title: よくある質問
toc: true
weight: 2
---

{{% note %}}
**注意:** 以下に紹介する回答/解決策は短いものであり、あなたの問題を解決するのに十分でない可能性があります。 [Hugo Discourse](https://discourse.gohugo.io/) にアクセスし、検索を使用してください。 それでも解決しない場合は、新しいトピックを立ち上げて質問してください。
{{% /note %}}

## コンテンツが表示されません {#i-cant-see-my-content}

Markdown ファイルは、 [ドラフトモード](https://gohugo.io/content-management/front-matter/#front-matter-variables) ですか? テストするときは、`-D` または `--buildDrafts` [スイッチ](https://gohugo.io/getting-started/usage/#draft-future-and-expired-content) を指定して `hugo server` を実行します。

Markdown ファイルは、 [リーフバンドル](/content-management/page-bundles/) の一部ですか? 同じディレクトリまたは任意の親ディレクトリに `index.md` ファイルがある場合、他の Markdown ファイルは個別のページとしてレンダリングされません。

## OS 環境を介して設定変数を設定できますか? {#can-i-set-configuration-variables-via-os-environment}

はい、できます。 詳細は、[「環境変数で設定する」](/getting-started/configuration/#configure-with-environment-variables) を参照してください。

## 投稿のスケジュールはどのように設定するのですか? {#how-do-i-schedule-posts}

1. ページの [フロントマター](/content-management/front-matter/) ページにある `publishDate` に将来の日時に設定します。作成日時と公開日時を同じにしたい場合は、`date`[^date-hierarchy] のみを設定するだけでも十分です。
2. 定期的にビルドして公開します。

「定期的に公開する」部分を自動化する方法は、状況によって異なります。

* 自分の PC/サーバーからデプロイする場合は、[Cron](https://en.wikipedia.org/wiki/Cron) などで自動化できます。
* あなたのサイトが [Netlify](https://www.netlify.com/) のようなサービスでホストされている場合、以下のことが可能です。
  * [ifttt](https://ifttt.com/date_and_time) などのサービスを利用して、更新のスケジュールを設定します。
  * [cron-job.org](https://cron-job.org/) のように、一定間隔でサイトをデプロイする cron サービスで実行できるデプロイフックを設定します (Netlify と Cloudflare Pages は、どちらもデプロイフックをサポートしています)。

以下の Twitter スレッドも参照してください。

{{< tweet user="ChrisShort" id="962380712027590657" >}}

[^date-hierarchy]: 明示的に設定されていない場合、異なる日付変数が互いに補完される順序については、 [「日付を設定する」](https://gohugo.io/getting-started/configuration/#configure-dates) を参照してください。

## Netlify で Hugo の最新版を使うことができますか? {#can-i-use-the-latest-hugo-version-on-netlify}

はい、できます。 [これ](/hosting-and-deployment/hosting-on-netlify/#configure-hugo-version-in-netlify) をお読みください。

## 「... この機能は、現在の Hugo のバージョンでは利用できません」というメッセージが表示されます {#i-get-this-feature-is-not-available-in-your-current-hugo-version}

Hugo プロジェクトで `libsass` をトランスパイラとして `SCSS` または `Sass` を `CSS` に処理する場合や、画像を `webp` 形式に変換する場合は、Hugoの `extended` バージョンが必要で、そうでなければ、以下のようなエラーメッセージが表示されることがあります。

```bash
error: failed to transform resource: TOCSS: failed to transform "scss/main.scss" (text/x-scss): this feature is not available in your current Hugo version
```

技術的な理由により、2 セットのバイナリをリリースしています。 拡張バージョンは、インストール方法によっては、デフォルトでは得られないものです。 [リリースページ](https://github.com/gohugoio/hugo/releases) で、名前に `extended` が含まれるアーカイブを探します。 `hugo-extended` をビルドするには、 `go install --tags extended` を使用します。

確認するには、`hugo version` を実行して、`extended` という単語を探します。
