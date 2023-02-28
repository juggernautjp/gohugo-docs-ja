---
aliases:
- /tutorials/github-pages-blog/
authors:
- Spencer Lyon
- Gunnar Morling
categories:
- hosting and deployment
date: "2014-03-21"
description: Hugo を GitHub Pages プロジェクトまたは個人/組織サイトとしてデプロイし、Github Actions のワークフローでプロセス全体を自動化します。
draft: false
keywords:
- github
- git
- deployment
- hosting
linktitle: GitHub でのホスト
menu:
  docs:
    parent: hosting-and-deployment
    weight: 30
publishdate: "2014-03-21"
sections_weight: 30
title: GitHub でのホスト
toc: true
weight: 30
---

GitHub は、GitHub リポジトリから直接、個人、組織、プロジェクトのページを SSL 経由で無料かつ高速に静的ホスティングを提供する [GitHub Pages サービス][GitHub Pages service] と、開発ワークフローとビルドを自動化する [GitHub Actions][] を提供します。

## 前提条件 {#assumptions}

1. Git 2.8 以上が [マシンにインストールされている][installgit] こと。
2. GitHub アカウントを持っていること。 GitHub の [サインアップ][ghsignup] は無料です。
3. Hugo の Web サイトを公開する準備ができているか、少なくとも [クイックスタート][Quick Start] を完了していること。

## GitHub Pages の種類 {#types-of-github-pages}

GitHub Pages には、以下の 2 種類あります。

- ユーザー/組織 のページ (`https://<USERNAME|ORGANIZATION>.github.io/`)
- プロジェクト ページ (`https://<USERNAME|ORGANIZATION>.github.io/<PROJECT>/`)

[GitHub Pages ドキュメント][ghorgs] を参照し、どの種類のサイトを作成するか決定してください。これにより、以下のどの方法を使用するかが決まります。

## GitHub Actions 用ブランチ {#branches-for-github-actions}

この手順で使用する GitHub Actions は、`main` ブランチからソースのコンテンツを取得し、生成されたコンテンツを `gh-pages` ブランチにコミットします。これは、使用している GitHub Pages の種類に関係なく適用できます。 Hugo ファイルは 1 つのブランチに保存され、生成されたファイルは別のブランチに公開されるので、これはすっきりした設定です。

## ユーザーまたは組織の GitHub Pages {#github-user-or-organization-pages}

[GitHub Pages ドキュメント][ghorgs] に記載されているように、プロジェクト ページに加えて、ユーザー/組織のページもホストできます。 GitHub Pages の ユーザー向け Web サイトと組織向け  Web サイトの主な違いは、以下のとおりです。

1. ページをホストするために、`<USERNAME>.github.io` または `<ORGANIZATION>.github.io` という名前のリポジトリを作成する必要があります
2. デフォルトでは、GitHub Pages を公開する際にはプロジェクト サイトのデフォルトである `gh-pages` ブランチではなく、 `main` ブランチのコンテンツが使われます。しかし、この手順で紹介する GitHub Actions は、 `gh-pages` ブランチに公開されます。したがって、あるユーザーまたは組織のために GitHub Pages を公開するのなら、公開ブランチを `gh-pages` に変更する必要があります。 このドキュメントの後述する手順を参照してください。

## GitHub Actions で Hugo をビルドする {#build-hugo-With-github-action}

GitHub は、ソフトウェア開発のワークフローを実行します。 GitHub リポジトリにコードをプッシュするたびに、GitHub Actions が自動的にサイトをビルドします。

([actions-hugo](https://github.com/marketplace/actions/hugo-setup) に基づき)、以下のコンテンツを含む `.github/workflows/gh-pages.yml` にファイルを作成します。

```yml
name: github pages

on:
  push:
    branches:
      - main  # デプロイするブランチを設定します
  pull_request:

jobs:
  deploy:
    runs-on: ubuntu-22.04
    steps:
      - uses: actions/checkout@v3
        with:
          submodules: true  # Hugo テーマをフェッチします (true または recursive)
          fetch-depth: 0    # .GitInfo と .Lastmod のすべての履歴を取得します

      - name: Setup Hugo
        uses: peaceiris/actions-hugo@v2
        with:
          hugo-version: 'latest'
          # extended: true

      - name: Build
        run: hugo --minify

      - name: Deploy
        uses: peaceiris/actions-gh-pages@v3
        if: github.ref == 'refs/heads/main'
        with:
          github_token: ${{ secrets.GITHUB_TOKEN }}
          publish_dir: ./public
```

より詳細な設定は、[actions-hugo](https://github.com/marketplace/actions/hugo-setup) および [actions-gh-pages](https://github.com/marketplace/actions/github-pages-action) を参照してください。

## GitHub Pages の設定 {#github-pages-setting}

デフォルトでは、GitHub Actions は、生成されたコンテンツを `gh-pages` ブランチにプッシュします。つまり、GitHub は `gh-pages` ブランチを GitHub Pages のブランチとして提供しなければなりません。この設定は、Settings > GitHub Pages で、ソースブランチを `gh-pages` に変更することで変更可能です。

## config.toml の baseURL を変更する {#change-baseurl-in-configtoml}

また、`config.toml` の `baseURL` の名前を、ユーザー リポジトリの場合は `https://<USERNAME>.github.io` という値に、プロジェクト リポジトリの場合は `https://<USERNAME>.github.io/<REPOSITORY_NAME>` という値に変更することを忘れないでください。

この設定を `config.toml` に記述しない限り、Web サイトは動作しません。

## カスタムドメインを使用する {#Use a Custom Domain

GitHub Pages のサイトにカスタムドメインを使用したい場合は、`static/CNAME` ファイルを作成します。カスタムドメイン名は `CNAME` 内の唯一のコンテンツである必要があります。 `static` 内にあるため、GitHub Pages の要件である、公開されたサイトには公開されたサイトのルートに CNAME ファイルが含まれることになります。

詳細については、[「カスタムドメインの公式ドキュメント」][domains] を参照してください。

[config]: /getting-started/configuration/
[domains]: https://help.github.com/articles/using-a-custom-domain-with-github-pages/
[ghorgs]: https://help.github.com/articles/user-organization-and-project-pages/#user--organization-pages
[ghpfromdocs]: https://help.github.com/articles/configuring-a-publishing-source-for-github-pages/
[ghsignup]: https://github.com/join
[GitHub Pages service]: https://help.github.com/articles/what-is-github-pages/
[installgit]: https://git-scm.com/downloads
[orphan branch]: https://git-scm.com/docs/git-checkout/#Documentation/git-checkout.txt---orphanltnewbranchgt
[Quick Start]: /getting-started/quick-start/
[submodule]: https://github.com/blog/2104-working-with-submodules
[worktree feature]: https://git-scm.com/docs/git-worktree
[GitHub Actions]: https://docs.github.com/en/actions
