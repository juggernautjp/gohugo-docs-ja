---
title: Azure Static Web Apps でのホスト
linktitle: Azure Static Web Apps でのホスト
description: Hugo を Azure Static Web Apps にデプロイし、Github Action Workflow でプロセス全体を自動化します。。
date: 2021-03-12
publishdate: 2021-03-12
categories: [hosting and deployment]
keywords: [azure,git,deployment,hosting]
authors: [Aaron Powell]
menu:
  docs:
    parent: "hosting-and-deployment"
    weight: 10
weight: 10
sections_weight: 10
toc: true
---

[Azure Static Web Apps] は、[GitHub Actions] または [Azure DevOps] を使用して、Git リポジトリからフルスタック Web アプリを自動的にビルドして Azure にデプロイするサービスです。

_次のドキュメントでは、デプロイに GitHub Actions を使用する方法について説明します。 Azure DevOps を使用している場合は、Microsoft のドキュメントに従ってください。_

## 前提条件 {#assumptions}

1. Git 2.8 以上が [マシンにインストールされている][installgit] こと。
2. GitHub アカウントを持っていること。 GitHub の [サインアップ][ghsignup] は無料です。
3. Azure アカウントを持っていること。 [無料トライアル][azuretrial] にサインアップできます。
4. Hugo の Web サイトを公開する準備ができているか、少なくとも [クイックスタート][Quick Start] を完了していること。

## Hugo を Azure Static Web Apps にデプロイする {#deploy-hugo-to-azure-static-web-apps}

1. [Azure ポータル][azureportal] に移動します
2. [**リソースの作成 (Create a Resource)**] をクリックします
3. **静的 Web アプリ (Static Web Apps)** を検索します
4. [**静的 Web アプリ (Static Web Apps)**] をクリックします。
5. [**作成 (Create)**] をクリックします

![Create in Azure Portal](/images/hosting-and-deployment/hosting-on-azure/create-in-portal.png)

6. **サブスクリプション** については、リストされているサブスクリプションを受け入れるか、ドロップダウン リストから新しいサブスクリプションを選択します。
7. _リソース グループ_ で、[**新規作成 (New)**] を選択します。 _新しいリソース グループ名_ に **hugo-static-app** と入力し、[**OK**] を選択します。
8. 次に、アプリの名前を **名前 (Name)** ボックスに入力します。有効な文字は、`a-z`、`A-Z`、`0-9`、`-` です。
9. _地域 (Region)_ は、あなたの近くの利用可能な地域を選択してください。
10. _SKU_ には、**無料 (Free)** を選択します。

![Basic app details](/images/hosting-and-deployment/hosting-on-azure/basic-app-details.png)

11. [**GitHub でサインイン (Sign in with GitHub)**] ボタンをクリックします。
12. リポジトリが存在する **組織 (Organization)** を選択します。
13. デプロイしたい Hugo アプリを _リポジトリ (Repository)_ として選択します。
14. _ブランチ (Branch)_ には、デプロイするブランチを選択します (たとえば、 **main**)。
15. _ビルドプリセット (Build Presets)_ で **Hugo** を選択すると、設定ファイルに標準的な Hugo のビルドオプションが入力されます。
  * **App Location** は、Hugo の設定ファイルがある Git リポジトリのパスです
  * **Api Location** は、サーバーレス API があるパスです (または、API がない場合は空白のままにします)。
  * **Artifact Location** は、Hugo が公開するパスです。
16. **[レビュー + 作成 (Review + Create)]** をクリックして詳細を確認し、**[作成 (Create)]** をクリックして Azure Static Web Apps の作成を開始し、デプロイ用の GitHub Actions ワークフローを作成します。

GitHub Actions のワークフローで、Hugo を使ったビルドと Azure へのデプロイがすぐに開始されます。この Web サイトは、Azure の Azure Static Web Apps リソースの _概要 (Overview)_ ページに表示されている URL からアクセスできます。

## Hugo のカスタムバージョンを使用する {#using-a-custom-hugo-version}

静的 Web アプリを作成すると、サイトのデプロイメント設定を含む [ワークフローファイル][swaconfig] が生成されます。 `Azure/static-web-apps-deploy` という GitHub Action の `env` セクションで `HUGO_VERSION` に値を指定すると、ワークフローファイルに特定の Hugo バージョンを設定できます。

```yaml
jobs:
  build_and_deploy_job:
    if: github.event_name == 'push' || (github.event_name == 'pull_request' && github.event.action != 'closed')
    runs-on: ubuntu-latest
    name: Build and Deploy Job
    steps:
      - uses: actions/checkout@v3
        with:
          submodules: true
      - name: Build And Deploy
        id: builddeploy
        uses: Azure/static-web-apps-deploy@v1
        with:
          azure_static_web_apps_api_token: ${{ secrets.AZURE_STATIC_WEB_APPS_API_TOKEN }}
          repo_token: ${{ secrets.GITHUB_TOKEN }}
          action: "upload"
          app_location: "/" # App ソースコードのパス
          api_location: "api" # Api ソースコードのパス - オプション
          output_location: "public" # app コンテンツをビルドするディレクトリ - オプション
        env:
          HUGO_VERSION: 0.100.2
```

## カスタムドメインを使用する {#use-a-custom-domain}

Azure Static Web Apps は、カスタムドメインを CNAME または APEX ドメイン マッピングとしてサポートします。 カスタム ドメインは、Azure ポータルから設定できます。 詳細については、[カスタムドメインの公式ドキュメント][domains] を参照してください。

[Azure Static Web Apps]: https://docs.microsoft.com/azure/static-web-apps/?WT.mc_id=javascript-26008-aapowell
[GitHub Actions]: https://docs.github.com/en/actions
[Azure DevOps]: https://docs.microsoft.com/azure/static-web-apps/publish-devops?WT.mc_id=javascript-26008-aapowell
[ghsignup]: https://github.com/join
[installgit]: https://git-scm.com/downloads
[azuretrial]: https://azure.microsoft.com/free/?WT.mc_id=javascript-26008-aapowell
[azureportal]: https://portal.azure.com/
[swaconfig]: https://docs.microsoft.com/azure/static-web-apps/github-actions-workflow?WT.mc_id=javascript-26008-aapowell
[domains]: https://docs.microsoft.com/azure/static-web-apps/custom-domain?WT.mc_id=javascript-26008-aapowell
[Quick Start]: /getting-started/quick-start/
