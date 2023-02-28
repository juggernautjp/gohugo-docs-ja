---
aliases: []
authors:
- Toby Glei
categories:
- hosting and deployment
date: "2021-01-06"
description: 21YunBox の非常に高速な中国の CDN、フルマネージド SSL、および Gitee からの自動デプロイを使用して、Hugo サイトをホストします。
draft: false
keywords:
- 21yunbox
- hosting
- deployment
linktitle: 21YunBox でのホスト
menu:
  docs:
    parent: hosting-and-deployment
    weight: 10
publishdate: "2021-01-06"
sections_weight: 10
title: 21YunBox  でのホスト
toc: true
weight: 10
---

[21YunBox](https://www.21yunbox.com) は、静的サイト、バックエンド API、データベース、cron ジョブ、その他すべてのアプリケーションを一箇所でホストできる、中国のグレート ファイアウォール内での Web デプロイを容易にするためのフルマネージドのクラウドプラットフォームです。高速な中国の CDN、継続的デプロイ、ワンクリック HTTPS、[マネージド データベースやバックエンド Web サービスなどのその他のサービス](https://www.21yunbox.com/docs/) を提供し、中国での Web プロジェクトを立ち上げるための手段を提供しています。

21YunBox には、以下の機能があります。

- GitHub と Gitee からの継続的な自動ビルドとデプロイ
- [Let's Encrypt](https://letsencrypt.org) による自動 SSL 証明書
- 非常に高速な中国の CDN によるキャッシュの即時無効化
- 無制限 [カスタムドメイン](https://www.21yunbox.com/docs/#/custom-domains)
- 自動 [Brotli 圧縮](https://en.wikipedia.org/wiki/Brotli) によるサイトの高速化
- HTTP/2 のネイティブ サポート
- HTTP → HTTPS の自動リダイレクト
- カスタム URL のリダイレクトとリライト

## 前提条件 {#prerequisites}

このガイドでは、デプロイする Hugo プロジェクトがすでにあることを前提にしています。 プロジェクトが必要な場合は、[クイックスタート](/getting-started/quick-start/) を使用して開始するか、21YunBox の [Hugo Example](https://gitee.com/eryiyunbox-examples/hello-hugo) をフォークしてから続行してください。

## 設定する {#setup}

21YunBox で Hugo サイトをセットアップするには、以下の 2 つの手順を実行します。

1. 21YunBox で新しい Web サービスを作成し、21YunBox に GitHub または Gitee リポジトリへのアクセス権限を与えます。
2. 作成時には以下の値を使用します。

   |    フィールド          | 値                                            |
   | --------------------- | ------------------------------------------------ |
   | **Environment**       | `Static Site`                                    |
   | **Build Command**     | `hugo --gc --minify` (または、独自のビルドコマンド) |
   | **Publish Directory** | `./public` (または、独自のビルドコマンド)        |

これで完了です。ビルドが完了すると同時に、あなたのサイトは 21YunBox の URL (`yoursite.21yunbox.com` のようなもの) で公開されます。

## 継続的デプロイ {#continuous-deploys}

21YunBox があなたのリポジトリに接続されたことで、GitHub にプッシュするたびに、自動的にサイトをビルドして公開することができるようになりました。

デプロイするたびに CDN キャッシュが自動的かつ瞬時に無効になるため、ユーザーは常にサイトの最新のコンテンツにアクセスすることができます。

## カスタムドメイン {#custom-domains}

21YunBox の [カスタムドメイン](https://www.21yunbox.com/docs/#/custom-domains) ガイドを使用して、サイトに簡単に独自ドメインを追加できます。

## サポート {#support}

21YunBox の専門家に相談したい場合は、[ここ](https://www.21yunbox.com/docs/#/contact) をクリックしてください。
