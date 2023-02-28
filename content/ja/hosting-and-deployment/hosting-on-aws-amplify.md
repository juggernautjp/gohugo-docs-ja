---
aliases: []
authors:
- Nikhil Swaminathan
categories:
- hosting and deployment
date: "2018-01-31"
description: AWS Amplify でクラウド型 Web アプリを開発し、デプロイします。
draft: false
keywords:
- amplify
- hosting
- deployment
linktitle: AWS Amplify でのホスト
menu:
  docs:
    parent: hosting-and-deployment
    weight: 10
publishdate: "2018-01-31"
sections_weight: 10
title: AWS Amplify でのホスト
toc: true
weight: 10
---

このガイドでは、[AWS Amplify コンソール](https://console.amplify.aws) を使用して、 Hugo サイトをデプロイおよびホストする方法について説明します。

AWS Amplify は、継続的デプロイとホスティングのためのクライアント ライブラリ、CLI ツールチェーン、およびコンソールの組み合わせです。
Amplify CLI とライブラリを使用すると、開発者は、認証、ストレージ、サーバーレス GraphQL または REST API、分析、Lambda 関数などの機能を備えたフルスタックのクラウドを利用したアプリケーションを立ち上げ、実行できます。
Amplify コンソールは、最新の Web アプリ (シングルページ アプリと静的サイトジェネレーター) の継続的デプロイとホスティングを提供します。
継続的デプロイにより、開発者は Git リポジトリにコードをコミットするたびに、Web アプリケーションの更新をデプロイできます。
ホスティングには、グローバルに利用可能な CDN、簡単なカスタムドメイン設定 + HTTPS、機能ブランチのデプロイ、パスワード保護などの機能が含まれています。

## 前提条件 {#prerequisites}

* [AWS アカウントにサインアップ](https://portal.aws.amazon.com/billing/signup?redirect_url=https%3A%2F%2Faws.amazon.com%2Fregistration-confirmation) していること。 AWS アカウントを作成するための前払い料金や契約期間はありません。サインアップすると、AWS 無料利用枠にすぐにアクセスできます。
* GitHub、GitLab、または Bitbucket のアカウントを持っていること。
* [クイックスタート][Quick Start] を完了していること、または Hugo の Web サイトをデプロイし、世界と共有する準備ができでいること。

## ホスティング {#hosting}

1. [AWS Amplify コンソール](https://console.aws.amazon.com/amplify/home) にログインし、[デプロイ] で [開始する] を選択します。
   ![Hugo Amplify](/images/hosting-and-deployment/hosting-on-aws-amplify/amplify-gettingstarted.png)

2. GitHub、Bitbucket、GitLab、AWS CodeCommit のいずれかのリポジトリからブランチを接続します。リポジトリを接続することで、ブランチへのコードコミットごとに Amplify が更新をデプロイできます。
   ![Hugo Amplify](/images/hosting-and-deployment/hosting-on-aws-amplify/amplify-connect-repo.gif)

3. デフォルトのビルド設定を受け入れます。 Amplify コンソールは、Hugo ビルド設定と出力ディレクトリを自動的に検出します。
   ![Hugo Amplify](/images/hosting-and-deployment/hosting-on-aws-amplify/amplify-build-settings.png)

4. 変更を確認し、**保存してデプロイ** を選択します。 Amplify コンソールは、リポジトリからコードをプルし、バックエンドとフロントエンドへの変更をビルドし、ビルド アーティファクトを `https://master.unique-id.amplifyapp.com` にデプロイします。 ボーナス: レイアウトの問題を見つけるために、異なるデバイスでアプリのスクリーンショットを撮ってください。

## 新しいバージョンの Hugo を使用する {#using-a-newer-version-of-hugo}

AWS Amplify で現在サポートされているバージョンとは異なる、おそらく新しいバージョンの Hugo を使用する必要がある場合は、以下の手順を実行します。

1. [AWS Amplify コンソール](https://console.aws.amazon.com/amplify/home) にアクセスし、変更するアプリをクリックします。
2. サイド ナビゲーション バーの [アプリの設定] で、[**ビルドの設定**] をクリックします。
3. [ビルド設定] ページの下部近くに、**ビルド イメージ設定** というセクションがあります。 **編集** をクリックします
4. [**ライブ パッケージの更新**] で、[**パッケージ バージョンの上書きを追加**] をクリックします。
5. 選択内容から **Hugo** をクリックし、バージョン フィールドが `latest` になっていることを確認します
6. **保存** をクリックして変更を保存します。

[Quick Start]: {{< relref "/getting-started/quick-start" >}}
