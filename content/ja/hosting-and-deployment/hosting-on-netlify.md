---
aliases: []
authors:
- Ryan Watters
- Seth MacLeod
categories:
- hosting and deployment
date: "2017-02-01"
description: Netlify は、CDN、継続的デプロイ、ワンクリック HTTPS、管理 GUI、および独自の CLI を使用して、Hugo サイトをホストできます。
draft: false
keywords:
- netlify
- hosting
- deployment
linktitle: Netlify でのホスト
menu:
  docs:
    parent: hosting-and-deployment
    weight: 10
publishdate: "2017-02-01"
sections_weight: 10
title: Netlify でのホスト
toc: true
weight: 10
---

[Netlify][netlify] は、継続的デプロイ サービス、グローバル CDN、超高速 DNS、アトミック デプロイ、インスタント キャッシュ無効化、ワンクリック SSL、ブラウザベースのインターフェイス、CLI、および Hugo の Web サイトを管理するためのその他多くの機能を提供します。

## 前提条件 {#assumptions}

* GitHub、GitLab、Bitbucket のいずれかにアカウントを持っていること。
* [クイックスタート][Quick Start] を完了していること、または Hugo の Web サイトをデプロイし、世界と共有する準備ができでいること。
* まだ Netlify アカウントを持っていないこと。

## Netlify アカウントを作成する {#create-a-netlify-account}

[app.netlify.com][] にアクセスして、希望のサインアップ方法を選択します。 これは、メールアドレスでサインアップするオプションもありますが、ホストされた Git プロバイダーにするでしょう。

以下の例では GitHub を使用していますが、他の Git プロバイダーでも同様の手順となります。

![Screenshot of the homepage for app.netlify.com, containing links to the most popular hosted git solutions.](/images/hosting-and-deployment/hosting-on-netlify/netlify-signup.jpg)

GitHub を選択すると、認証用の承認モーダルが表示されます。 [アプリケーションを承認する (Authorize application)] を選択します。

![Screenshot of the authorization popup for Netlify and GitHub.](/images/hosting-and-deployment/hosting-on-netlify/netlify-first-authorize.jpg)

## 継続的デプロイで新しいサイトを作成する {#create-a-new-site-with-continuous-deployment}

あなたはすでに Netlify のメンバーであり、新しいダッシュボードに移動しているはずです。 [git から新規サイト (New site from git)] を選択します。

![Screenshot of the blank Netlify admin panel with no sites and highlighted 'add new site' button'](/images/hosting-and-deployment/hosting-on-netlify/netlify-add-new-site.jpg)

Netlify は、継続的デプロイに必要なステップを説明し始めます。まず、Git プロバイダーを再度選択する必要がありますが、今回は、 Netlify にリポジトリへの権限を追加することになります。

![Screenshot of step 1 of create a new site for Netlify: selecting the git provider](/images/hosting-and-deployment/hosting-on-netlify/netlify-create-new-site-step-1.jpg)

そして再び、 GitHub の認証モーダルを使用します。

![Screenshot of step 1 of create a new site for Netlify: selecting the git provider](/images/hosting-and-deployment/hosting-on-netlify/netlify-authorize-added-permissions.jpg)

継続的デプロイに使用するリポジトリを選択します。 多数のリポジトリがある場合は、リポジトリ検索を使用してリアルタイムでそれらをフィルタリングできます。

![Screenshot of step 1 of create a new site for Netlify: selecting the git provider](/images/hosting-and-deployment/hosting-on-netlify/netlify-create-new-site-step-2.jpg)

選択すると、基本設定の画面が表示されます。 ここで、公開するブランチ、[ビルド コマンド][build command]、および公開 (つまり、デプロイ) ディレクトリを選択できます。 公開ディレクトリは、[サイト設定][config] で設定したものと同じである必要があり、デフォルトは `public` です。 以下の手順では、`master` ブランチから公開していることを前提としています。

## Netlify で Hugo のバージョンを設定する {#configure-hugo-version-in-netlify}

`netlify.toml` ファイルで環境に応じて [Hugo バージョンを設定する](https://www.netlify.com/blog/2017/04/11/netlify-plus-hugo-0.20-and-beyond/) か、Netlify コンソールでビルド環境変数として `HUGO_VERSION` を設定することが可能です。

本番環境の場合:

{{< code file="netlify.toml" codeLang="toml" >}}
[context.production.environment]
  HUGO_VERSION = "0.99.1"
{{< /code >}}

テスト環境の場合:

{{< code file="netlify.toml" codeLang="toml" >}}
[context.deploy-preview.environment]
  HUGO_VERSION = "0.99.1"
{{< /code >}}

Netlify の設定ファイルは、異なる環境に対して正しく理解するのが少し難しいかもしれません。このサイトの `netlify.toml` から、いくつかのインスピレーションやヒントを得ることができるかもしれません。

{{< code file="netlify.toml" nocode="true" >}}
{{< readfile file="netlify.toml" highlight="toml" >}}
{{< /code >}}

## サイトのビルドとデプロイ {#build-and-deploy-site}

Netlify コンソールで [Deploy site (サイトをデプロイする)] を選択すると、すぐにビルド用のターミナルに移動します。

![Animated gif of deploying a site to Netlify, including the terminal read out for the build.](/images/hosting-and-deployment/hosting-on-netlify/netlify-deploying-site.gif)

ビルドが完了すると (ほんの数秒しかかかりませんが)、画面の上部にデプロイが成功したことを知らせる「ヒーローカード」が表示されるはずです。ヒーローカードは、ほとんどのページで最初に表示される要素です。ヒーローカードは、ページの簡単な要約を表示し、最も一般的で適切なアクションや情報にアクセスできるようになります。 URL は Netlify によって自動的に生成されたものであることがわかると思います。 URL は、[設定 (Settings)] で更新することができます。

![Screenshot of successful deploy badge at the top of a deployments screen from within the Netlify admin.](/images/hosting-and-deployment/hosting-on-netlify/netlify-deploy-published.jpg)

![Screenshot of homepage to https://hugo-netlify-example.netlify.com, which is mostly dummy text](/images/hosting-and-deployment/hosting-on-netlify/netlify-live-site.jpg)

[ライブサイトにアクセス][visit] してください。

これで、ホストされている git リポジトリに変更をプッシュするたびに、Netlify がサイトを再ビルドして再デプロイします。

Netlify が Hugo バージョンを処理する方法の詳細については、[このブログ記事](https://www.netlify.com/blog/2017/04/11/netlify-plus-hugo-0.20-and-beyond/) を参照してください。

## Netlify で Hugo テーマを使用する {#use-hugo-themes-with-netlify}

[`git clone` によるテーマのインストール方法][installthemes] は、Netlify ではサポートされていません。 `git clone` を使用する場合、`.git` サブディレクトリをテーマ フォルダーから再帰的に削除する必要があるため、その結果、テーマの将来のバージョンとの互換性を保つことができなくなります。

*より良い* アプローチは、適切な git サブモジュールとしてテーマをインストールすることです。 詳細については、[サブモジュールの GitHub ドキュメントを読む][ghsm] または [Git の Web サイト][gitsm] で見つけることができますが、コマンドは `git clone` のコマンドに似ています。

```bash
cd themes
git submodule add https://github.com/<THEMECREATOR>/<THEMENAME>
```

テーマの安定版のみを使用し (バージョン管理されている場合)、常に変更履歴を確認することをお勧めします。これは、テーマのディレクトリ内の特定のリリースをチェックアウトすることで行うことができます。

以下のように、テーマのディレクトリに切り替えて、利用可能なすべてのバージョンを一覧表示します。

```bash
cd themes/<theme>
git tag
# q で終了します
```

特定のバージョンをチェックアウトするには、以下のようにします。

```bash
git checkout tags/<version-name>
```

プロジェクトの *root* ディレクトリで以下のコマンドを実行することで、テーマを最新版に更新することができます。

```bash
git submodule update --rebase --remote
```

## 次のステップ {#next-steps}

これで、HTTPS で提供され、CDN で配信され、継続的デプロイ用に設定されたライブ Web サイトができました。以下の Netlify のドキュメントにより、さらに詳細に理解します。

1. [Using a Custom Domain (カスタムドメインを使用する)][Using a Custom Domain]
2. [Setting up HTTPS on Custom Domains (カスタムドメインに HTTPS を設定する)][httpscustom]
3. [Redirects and Rewrite Rules (リダイレクト ルールとリライト ルール)][Redirects and Rewrite Rules]

[app.netlify.com]: https://app.netlify.com
[build command]: /getting-started/usage/#the-hugo-command
[config]: /getting-started/configuration/
[ghsm]: https://github.com/blog/2104-working-with-submodules
[gitsm]: https://git-scm.com/book/en/v2/Git-Tools-Submodules
[httpscustom]: https://www.netlify.com/docs/ssl/
[hugoversions]: https://github.com/netlify/build-image/blob/master/Dockerfile#L216
[installthemes]: /themes/installing/
[netlify]: https://www.netlify.com/
[netlifysignup]: https://app.netlify.com/signup
[Quick Start]: /getting-started/quick-start/
[Redirects and Rewrite Rules]: https://www.netlify.com/docs/redirects/
[Using a Custom Domain]: https://www.netlify.com/docs/custom-domains/
[visit]: https://hugo-netlify-example.netlify.com
