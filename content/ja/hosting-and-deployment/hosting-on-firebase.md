---
aliases: []
authors:
- Michel Racic
categories:
- hosting and deployment
date: "2017-03-12"
description: Firebase の無料利用枠を使用して、静的 Web サイトをホストできます。 これにより、Firebase の NOSQL API にもアクセスできます。
draft: false
keywords:
- hosting
- firebase
linktitle: Firebase でのホスト
menu:
  docs:
    parent: hosting-and-deployment
    weight: 20
publishdate: "2017-03-12"
sections_weight: 20
title: Firebase でのホスト
toc: true
weight: 20
---

## 前提条件 {#assumptions}

1. [Firebase][signup] のアカウントを持っていること。 (持っていない場合は、Google アカウントを使用して無料でサインアップできます)。
2. [クイックスタート][Quick Start] を完了していること、または Hugo の Web サイトをデプロイする準備ができでいること。

## 初期設定 {#initial-setup}

[Firebase コンソール][console] にアクセスし、新規プロジェクトを作成します (すでにプロジェクトがある場合は除く)。 以下のコマンドにより、`firebase-tools` (node.js) をグローバルにインストールする必要があります。

```bash
npm install -g firebase-tools
```

Firebase (ローカルマシンに設定します) に `firebase login` でログインすると、ブラウザが起動してアカウントが選択できるようになります。 すでにログインしているが間違ったアカウントにログインしている場合は、`Firebase logout` を使用します。

```bash
firebase login
```

Hugo プロジェクトのルートで、以下のように `firebase init` コマンドを使用して、Firebase プロジェクトを初期化します。

```bash
firebase init
```

ここから、以下の手順を実行します。

1. 機能の質問でホスティングを選択します
2. 先ほど設定したプロジェクトを選択します
3. データベース ルール ファイルのデフォルトを受け入れます
4. 公開ディレクトリのデフォルトである `public` を受け入れます
5. シングルページ アプリをデプロイする場合は、質問で [いいえ] を選択します

## Firebase と Github CI/CD の使用 {#using-firebase-github-cicd}

Firebase の新しいバージョンでは、以下のように、他にもいくつかの質問が適用されます。

6. GitHub で自動ビルドとデプロイをセットアップしますか?

ここで、権限を取得するために GitHub アカウントにログインするようにリダイレクトされます。 確認します。

7. どの GitHub リポジトリに対して GitHub ワークフローを設定しますか? (形式: ユーザー/リポジトリ) 

上記の形式で使用するリポジトリを含めます (アカウント/リポジトリ)。
資格情報を取得する Firebase スクリプトを使用して、後で github 設定で管理できるサービス アカウントを作成します。

8. 毎回デプロイする前にビルドスクリプトを実行するようにワークフローを設定しますか?

ここで、デプロイを実行する前に、いくつかのコマンドを含めることができます。

9. PR がマージされたときに、あなたのサイトのライブチャンネルに自動的にデプロイされるように設定しますか?

デフォルトのオプション（main）を入れることができます。

その後、Firebase は CI/CD を使用してプロジェクトに設定されます。 その後、以下のように実行します。

```bash
hugo && firebase deploy
```

これにより、アプリを手動で初期化できます。 その後、https://github.com/your-account/yout-repo/actions から github ワークフローを管理および修正できます。

プッシュする前に、静的ページを更新することを忘れないでください。

## 手動デプロイ {#manual-deploy}

Hugo サイトをデプロイするには、以下のように、`firebase deploy` コマンドを実行すれば、すぐにサイトが立ち上がります。

```bash
hugo && firebase deploy
```

## CI 設定 (その他のツール) {#ci-setup-other-tools}

以下のコマンドを使用して、デプロイトークンを生成できます。

```bash
firebase login:ci
```

また、CI を設定し、トークンを `$FIREBASE_DEPLOY_TOKEN` のようなプライベート変数に追加できます。

{{% note %}}
これはプライベートな秘密であり、パブリック リポジトリには表示されません。 選択した CI を理解し、他の人には見えないことを確認してください。
{{% /note %}}

その後、ビルドにステップを追加して、トークンを使用してデプロイを実行できます。

```bash
firebase deploy --token $FIREBASE_DEPLOY_TOKEN
```

## 参考リンク {#reference-links}

* [Firebase CLI リファレンス](https://firebase.google.com/docs/cli/#administrative_commands)

[console]: https://console.firebase.google.com
[Quick Start]: /getting-started/quick-start/
[signup]: https://console.firebase.google.com/
