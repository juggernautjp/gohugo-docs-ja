---
aliases: []
authors:
- Anurag Goel
categories:
- hosting and deployment
date: "2019-06-06"
description: Render のグローバル CDN、フルマネージド型の sSSL、GitHub からの自動デプロイを使用して、Hugo サイトを無料でホストします。
draft: false
keywords:
- hosting
- deployment
linktitle: Render でのホスト
menu:
  docs:
    parent: hosting-and-deployment
    weight: 10
publishdate: "2019-06-06"
sections_weight: 10
title: Render でのホスト
toc: true
weight: 10
---

## はじめに {#introduction}

[Render](https://render.com) は、静的サイト、バックエンド API、データベース、cron ジョブ、その他すべてのアプリケーションを一箇所でホストできる、フルマネージド型のクラウド プラットフォームです。

静的サイトは、Render 上で **完全無料** で、以下のようなものがあります。

- [GitHub](https://render.com/docs/github) と [GitLab](https://render.com/docs/gitlab) から、継続的な自動ビルドと自動デプロイを行うことができます。
- [Let's Encrypt](https://letsencrypt.org) による自動 SSL 証明書。
- 超高速のグローバル CDN によるキャッシュの即時無効化。
- 協力者 (コラボレーター) は無制限。
- 無制限の [カスタムドメイン](https://render.com/docs/custom-domains)。
- より高速なサイト向けの自動 [Brotli 圧縮](https://en.wikipedia.org/wiki/Brotli)。
- HTTP/2 にネイティブ対応。
- [プルリクエストのプレビュー](https://render.com/docs/pull-request-previews)。
- HTTP → HTTPS の自動リダイレクト。
- カスタム URL のリダイレクトとリライト。

## 前提条件 {#assumptions}

- GitHub または GitLab にアカウントを持っていること。
- [クイックスタート][Quick Start] を完了していること、または Hugo の Web サイトをデプロイし、世界と共有する準備ができでいること。
- Render アカウントを持っていること。 https://render.com/register でサインアップできます。

## デプロイ {#deployment}

Render では、以下の 2 つの手順で、簡単に Hugo サイトを立ち上げることができます。

1. Render 上に新しい **静的サイト** を作成し、Render に GitHub/Gitlab リポジトリへのアクセス権限を与えます。
2. 作成時には、以下の値を使用します。

  フィールド            | 値
  -------------------  |  -------------------
 **Build Command**     | `hugo --gc --minify` (または、独自のビルドコマンド)
 **Publish Directory** | `public` (または、独自の出力ディレクトリ)

これで完了です。ビルドが完了するとすぐに、サイトは Render URL (`yoursite.onrender.com` のようなもの) で公開されます。

## 継続的デプロイ {#continuous-deploys}

Render がリポジトリに接続されたので、GitHub/Gitlab にプッシュするたびに **自動的にサイトをビルドして公開** します。

サイトの **設定 (Settings)** セクションで自動デプロイを無効にし、Render ダッシュボードから手動でデプロイすることを選択できます。

## CDN とキャッシュの無効化 {#cdn-cache-invalidation}

Render は、ユーザーのサイトをグローバルな超高速 CDN でホスティングし、世界中のすべてのユーザーに可能な限り最速のダウンロード時間を保証します。

デプロイするたびに CDN キャッシュが自動的かつ瞬時に無効になるため、ユーザーは常にサイトの最新のコンテンツにアクセスできます。

## カスタムドメイン {#custom-domains}

Render の [カスタムドメイン](https://render.com/docs/custom-domains) ガイドを使用して、簡単に独自ドメインを追加できます。

## プルリクエストのプレビュー {#pull-request-previews}

プルリクエスト (PR) プレビューを使用すると、単にコードレビューに頼るのではなく、プルリクエストで導入された変更を可視化できます。

この機能を有効にすると、サイトの PR ごとに、PR 内のコードに基づいた新しい静的サイトが自動的に生成されます。 このサイトは独自の URL を持ち、PR がクローズされると自動的に削除されます。

詳細については、Render の [「プルリクエストのプレビュー (Pull Request Previews)」](https://render.com/docs/pull-request-previews) を参照してください。

## Hugo テーマ {#hugo-themes}

Render はビルドのたびに、Git リポジトリで定義されたすべての Git サブモジュールを自動的にダウンロードします。こうすることで、サブモジュールとして追加された Hugo テーマが期待通りに動作するようになります。

## サポート {#support}

ヘルプが必要な場合は、https://render.com/chat で Render 開発者とチャットするか、 `support@render.com` にメールを送ってください。

[Quick Start]: /getting-started/quick-start/
