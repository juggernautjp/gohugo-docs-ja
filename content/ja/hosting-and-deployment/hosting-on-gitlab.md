---
aliases:
- /tutorials/hosting-on-gitlab/
authors:
- Riku-Pekka Silvola
categories:
- hosting and deployment
date: "2016-06-23"
description: GitLab は、Hugo をネイティブにサポートする無料の GitLab Pages サービスを通じて、Hugo の Web サイトのビルド、デプロイ、ホスティングを簡単に行うことができます。 
draft: false
keywords:
- hosting
- deployment
- git
- gitlab
lastmod: "2017-11-16"
linktitle: GitLab でのホスト
menu:
  docs:
    parent: hosting-and-deployment
    weight: 40
publishdate: "2016-06-23"
sections_weight: 40
title: GitLab でのホスト
toc: true
weight: 40
wip: false
---

## 前提条件 {#assumptions}

* バージョン管理のための Git に精通していること
* Hugo の [クイックスタート][Quick Start] を完了していること 
* [GitLab アカウント](https://gitlab.com/users/sign_in) を持っていること
* 公開する準備が整ったローカル マシン上の Hugo Web サイトを持っていること

## BaseURL

[サイト設定](/getting-started/configuration/) の `baseURL` は、カスタムドメインではなく、デフォルトの GitLab Pages URL (たとえば、 `https://<YourUsername>.gitlab.iio/<your-hugo-site>/`) を使用している場合は、あなたの GitLab Pages リポジトリのフル URL を反映していなければなりません。

## GitLab の CI/CD を設定する {#configure-gitlab-cicd}

プロジェクトのルートに `.gitlab-ci.yml` ファイルを作成して、[CI/CD](https://docs.gitlab.com/ee/ci/quick_start/) ジョブを定義します。

{{< code file=".gitlab-ci.yml" >}}
image: registry.gitlab.com/pages/hugo/hugo_extended:latest

variables:
  GIT_SUBMODULE_STRATEGY: recursive

pages:
  script:
  - hugo
  artifacts:
    paths:
    - public
  rules:
  - if: $CI_COMMIT_BRANCH == $CI_DEFAULT_BRANCH
{{< /code >}}

{{% note %}}
特定の Hugo バージョンを使用してサイトをビルドする場合は、[このリスト](https://gitlab.com/pages/hugo/container_registry) を参照してください。
{{% /note %}}

## Hugo の Web サイトを GitLab にプッシュする {#push-your-hugo-website-to-gitlab}

次に、GitLab に新しいリポジトリを作成します。 リポジトリを公開する必要は *ありません*。 さらに、コンパイル済みのアセットを GitLab にプッシュしたり、出力 Web サイトをバージョン管理したりする必要がないため、`/public` を .gitignore ファイルに追加することをお勧めします。

```bash
# 新しい git リポジトリを初期化します
git init

# /public ディレクトリを .gitignore ファイルに追加します
echo "/public" >> .gitignore

# コミットして、コードを master ブランチにプッシュします
git add .
git commit -m "Initial commit"
git remote add origin https://gitlab.com/YourUsername/your-hugo-site.git
git push -u origin master
```

## ページがビルドされるのを待ちます {#wait-for-your-page-to-build}

これで完了です。これで、CI エージェントが `https://gitlab.com/<YourUsername>/<your-hugo-site>/pipelines` であなたのページをビルドしている様子を追うことができます。

ビルドが完了すると、新しい Web サイトが `https://<YourUsername>.gitlab.io/<your-hugo-site>/` で利用できるようになります。

## 次のステップ {#next-steps}

GitLab は、カスタム CNAME と TLS 証明書の使用をサポートしています。 GitLab Pages の詳細については、 [GitLab Pages 設定ドキュメント](https://about.gitlab.com/2016/04/07/gitlab-pages-setup/) を参照してください。

[Quick Start]: /getting-started/quick-start/
