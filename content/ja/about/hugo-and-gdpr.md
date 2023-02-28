---
aliases:
- /privacy/
- /gdpr/
date: "2018-05-25"
description: 新規制に対応するための Hugo サイトを構成する方法について。
draft: false
keywords:
- GDPR
- Privacy
- Data Protection
layout: single
linktitle: Hugo と GDPR
menu:
  docs:
    parent: about
    weight: 5
sections_weight: 5
title: Hugo と 一般データ保護規則 (GDPR)
toc: true
weight: 5
---

一般データ保護規則 ([GDPR](https://en.wikipedia.org/wiki/General_Data_Protection_Regulation)) は、欧州連合および欧州経済領域内のすべての個人のデータ保護とプライバシーに関する EU 法の規則です。 2018 年 5 月 25 日に施行されました。

**Hugo は静的サイトジェネレーターです。 Hugo を使用することで、すでに非常に強固な基盤の上に立っています。 ディスク上の静的 HTML ファイルは、サーバーやデータベース駆動型の Web サイトと比較して、はるかに簡単に推論できます。**

ただし、静的な Web サイトでも外部サービスと統合できるため、バージョン `0.41` から、Hugo は関連する組み込みテンプレートをカバーする **Privacy Config** を提供します。

注意事項:

* これらの設定は、デフォルトでは _off_ に設定されています。つまり、Hugo `0.41` 以前はどのように動作していたかということです。自分のサイトを自分で評価し、適切な設定を適用する必要があります。
* これらの設定は [内部テンプレート](/templates/internal/) で機能します。 一部のテーマには、Google アナリティクスなどのサービスを埋め込むためのカスタム テンプレートが含まれている場合があります。 その場合、これらのオプションは効果がありません。
* この作業を継続し、今後の Hugo のバージョンアップでさらに改善する予定です。

## すべてのプライバシー設定 {#all-privacy-settings}

以下は、すべてのプライバシー設定とそのデフォルト値です。これらの設定は、サイトの設定ファイル (たとえば、`config.toml`) に記述する必要があります。

{{< code-toggle file="config">}}
[privacy]
[privacy.disqus]
disable = false
[privacy.googleAnalytics]
disable = false
respectDoNotTrack = false
anonymizeIP = false
useSessionStorage = false
[privacy.instagram]
disable = false
simple = false
[privacy.twitter]
disable = false
enableDNT = false
simple = false
[privacy.vimeo]
disable = false
enableDNT = false
simple = false
[privacy.youtube]
disable = false
privacyEnhanced = false
{{< /code-toggle >}}


## すべてのサービスを無効にする {#disable-all-services}

Hugo の関連サービスをすべて無効にするプライバシー設定の例です。この設定では、他の設定は重要ではありません。

{{< code-toggle file="config">}}
[privacy]
[privacy.disqus]
disable = true
[privacy.googleAnalytics]
disable = true
[privacy.instagram]
disable = true
[privacy.twitter]
disable = true
[privacy.vimeo]
disable = true
[privacy.youtube]
disable = true
{{< /code-toggle >}}

## プライバシー設定の説明 {#the-privacy-settings-explained}

### GoogleAnalytics

anonymizeIP
: これを有効にすると、ユーザーの IP アドレスが Google アナリティクス内で匿名化されます。

respectDoNotTrack
: これを有効にすると、GA テンプレートは "Do Not Track" HTTP ヘッダを尊重するようになります。

useSessionStorage
: これを有効にすると、Cookie の使用が無効になり、セッション ストレージを使用して GA クライアント ID が保存されます。

{{% warning %}}
Google アナリティクス v4 (gtag.js) を使用する場合、`useSessionStorage` はサポートされません。
{{% /warning %}}

### Instagram

simple
: シンプルモードが有効な場合、静的で JS なしのバージョンの Instagram イメージカードが構築されます。これはイメージカードのみをサポートし、画像自体は Instagram のサーバーから取得されることに注意してください。

**注意:** Instagram に _シンプルモード_ を使用し、Bootstrap 4 でスタイル設定されたサイトを使用している場合、Hugo が提供するインライン スタイルを無効にすることができます。

{{< code-toggle file="config">}}
[services]
[services.instagram]
disableInlineCSS = true
{{< /code-toggle >}}

### Twitter

enableDNT
: twitter/tweet ショートコードでこれを有効にすると、サイト上のツイートとその埋め込みページは、パーソナライズされた提案やパーソナライズされた広告を含む目的のために使用されなくなります。

simple
: シンプルモードを有効にすると、静的で JS のないバージョンのツイートが構築されます。

**注意:** Twitter で _シンプルモード_ を使用する場合、Hugo が提供するインラインスタイルを無効化することができます。

{{< code-toggle file="config">}}
[services]
[services.twitter]
disableInlineCSS = true
{{< /code-toggle >}}

### YouTube

privacyEnhanced
: プライバシー強化モードを有効にすると、ユーザーが埋め込みビデオを再生しない限り、YouTube は Web サイトの訪問者に関する情報を保存しません。

### Vimeo

enableDNT
: vimeo ショートコードでこれを有効にすると、Vimeo プレーヤーは、すべての Cookie と統計を含むセッション データの追跡がブロックされます。

simple
: シンプルモードが有効な場合、動画のサムネイルが Vimeo のサーバーから取得され、再生ボタンと一緒にオーバーレイ表示されます。ユーザーがクリックしてビデオを再生すると、Vimeo の Web サイトが直接新しいタブで開かれます。
