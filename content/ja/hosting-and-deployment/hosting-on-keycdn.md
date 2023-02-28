---
aliases: []
categories:
- hosting and deployment
date: "2017-09-12"
description: KeyCDN の統合により、Hugo サイトをグローバルに高速化できます。このチュートリアルでは、静的サイトを KeyCDN プルゾーンの背後にある GitLab Pages として設定する方法を紹介します。
draft: false
keywords:
- keycdn
- hosting
- deployment
- cdn
menu:
  docs:
    parent: hosting-and-deployment
    weight: 40
slug: ""
title: KeyCDN でのホスト
toc: false
---

[KeyCDN](https://www.keycdn.com/) は、Brotli 圧縮、Let's Encrypt サポート、Origin Shiel dなど、Hugo サイトの高速化と安全性をグローバルに支援する多数の機能を提供します。

## 前提条件 {#assumptions}

- すでに Hugo のページが設定されていること
- GitLab アカウントを持っていること
- KeyCDN アカウントを持っていること

## KeyCDN の Pull Zone (プルゾーン) を作成する {#create-a-keycdn-pull-zone}

最初のステップは、KeyCDN アカウントにログインし、新しいゾーンを作成することです。好きな名前を付けて、[Pull Zone](https://www.keycdn.com/support/create-a-pull-zone/) オプションを選択します。元の URL については、サイトは [GitLab Pages](https://docs.gitlab.com/ee/user/project/pages/getting_started_part_one.html) で動作し、URL は `https://youruser.gitlab.io/reponame/` となります。これを元の URL として使用します。

![Screenshot of KeyCDN's pull zone creation page](/images/hosting-and-deployment/hosting-on-keycdn/keycdn-pull-zone.png)

元の場所はまだ存在しませんが、GitLab プロジェクトにアップロードされる `.gitlab-ci.yml` ファイルに新しいゾーンの  URL アドレス (または [Zone Alias (ゾーン エイリアス)](https://www.keycdn.com/support/create-a-zone-alias/)) を使用する必要があります。

以下の例では、ゾーン URL またはゾーン エイリアスを `BASEURL` 変数として使用していることを確認してください。 これは、ユーザーに表示される Web サイトのアドレスになります。

## .gitlab-ci.yml ファイルを設定する {#configure-your-gitlabciyml-file}

あなたの `.gitlab-ci.yml` ファイルは、以下の例のようになるはずです。あなたの設定に特有の変数があれば、必ず修正してください。

```yml
image: alpine:latest

variables:
    BASEURL: "https://cipull-7bb7.kxcdn.com/"
    HUGO_VERSION: "0.26"
    HUGO_CHECKSUM: "67e4ba5ec2a02c8164b6846e30a17cc765b0165a5b183d5e480149baf54e1a50"
    KEYCDN_ZONE_ID: "75544"

before_script:
    - apk update
    - apk add curl

pages:
    stage: deploy
    script:
    - apk add git
    - git submodule update --init
    - curl -sSL https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_${HUGO_VERSION}_Linux-64bit.tar.gz -o /tmp/hugo.tar.gz
    - echo "${HUGO_CHECKSUM}  /tmp/hugo.tar.gz" | sha256sum -c
    - tar xf /tmp/hugo.tar.gz hugo -C /tmp/ && cp /tmp/hugo /usr/bin
    - hugo --baseURL ${BASEURL}
    - curl "https://api.keycdn.com/zones/purge/${KEYCDN_ZONE_ID}.json" -u "${KEYCDN_API_KEY}:"
    artifacts:
    paths:
    - public
    only:
    - master
```

この統合方法を使用すると、ゾーン ID (Zone ID) と [KeyCDN API](https://www.keycdn.com/api) キーをシークレット変数 (Secret Variable) として指定する必要があります。 これを行うには、GitLab の左上のメニューバーに移動し、[プロジェクト (Projects)] を選択します。 次に、あなたのプロジェクトを選択し、[設定 (Settings)] ページをクリックします。 最後に、サブメニューから [パイプライン (Pipelines)] を選択し、[シークレット変数 (Secret Variable)] セクションまでスクロールします。

ゾーン ID のシークレット変数は、以下のようになります。

![Screenshot of setting the Zone ID secret variable](/images/hosting-and-deployment/hosting-on-keycdn/secret-zone-id.png)

一方、API Key のシークレット変数は、以下のような形になります。

![Screenshot of setting the API Key secret variable](/images/hosting-and-deployment/hosting-on-keycdn/secret-api-key.png)

ゾーン ID と API キーは、ゾーンのパージに使用されます。厳密には必要ありませんが、そうしないと、CDN があなたのアセットの古いバージョンをかなり長い間配信する可能性があります。

## 変更を GitLab にプッシュする {#push-your-changes-to-gitlab}

さて、いよいよ新しく作成したリポジトリを GitLab にプッシュするために、以下のコマンドを実行します。

```bash
git remote add origin git@gitlab.com:youruser/ci-example.git
git push -u origin master
```

Gitlab プロジェクトの「パイプライン (Pipelines)」で、進捗や CI ジョブの出力を確認できます。

CI ジョブが問題なく実行されたことを確認したら、まず GitLab ページが `https://youruser.gitlab.io/reponame/` で表示されていることを確認します (ブラウザの設定によっては、すべてのリンクが KeyCDN ゾーンを指しているので、壊れたように見える場合がありますが、それは気にしないでください)。 次に、定義したゾーン エイリアス/ゾーン URL に移動します。

KeyCDN を使用した Hugo ホスティング オプションの詳細については、完全な [「KeyCDN を使用した Hugo ホスティングの統合ガイド」](https://www.keycdn.com/support/hugo-hosting/) を確認しください。
