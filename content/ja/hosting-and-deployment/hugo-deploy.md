---
aliases: []
authors:
- Robert van Gent
categories:
- hosting and deployment
date: "2019-05-30"
description: Hugo CLI を使用して、サイトを GCS、S3、または Azure にアップロードできます。
draft: false
keywords:
- s3
- gcs
- azure
- hosting
- deployment
lastmod: "2021-05-03"
linktitle: Hugo デプロイ
menu:
  docs:
    parent: hosting-and-deployment
    weight: 2
publishdate: "2019-05-30"
sections_weight: 2
title: Hugo デプロイ
toc: true
weight: 2
---

"hugo deploy" コマンドを使用すると、Google Cloud Storage (GCS) バケット、AWS S3 バケット、Azure Storage コンテナにサイトを直接アップロードできます。

## 前提条件 {#assumptions}

* [クイックスタート][Quick Start] を完了していること、または Hugo の Web サイトをデプロイし、世界と共有する準備ができでいること。
* デプロイ先のサービスプロバイダー ([Google Cloud](https://cloud.google.com/)、[AWS](https://aws.amazon.com)、[Azure](https://azure.microsoft.com)) のアカウントを持っていること。
* 以下の認証が完了していること。
  * Google Cloud の場合: [CLI をインストール](https://cloud.google.com/sdk) し、[`gcloud auth login`](https://cloud.google.com/sdk/gcloud/reference/auth/login) を実行していること。
  * AWS の場合: [CLI をインストール](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-install.html) し、[`aws configure`](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-configure.html) を実行していること。
  * Azure の場合: [CLI をインストール](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli) し、[`az login`](https://docs.microsoft.com/en-us/cli/azure/authenticate-azure-cli) を実行していること。
  * **注意**: 各サービスは，環境変数を利用した認証など、認証の代替手段をサポートしています。 詳しくは、[こちら](https://gocloud.dev/howto/blob/#services) を参照してください。

## デプロイするバケットを作成する {#create-a-bucket-to-deploy-to}

サイトをデプロイするストレージ バケットを作成します。 サイトを公開したい場合は、必ずバケットを一般公開できるように設定してください。

### Google Cloud Storage (GCS)

[バケットの作成方法に関する GCS の手順](https://cloud.google.com/storage/docs/creating-buckets) に従います。

### AWS S3

[バケットの作成方法に関する AWS の手順](https://docs.aws.amazon.com/AmazonS3/latest/gsg/CreatingABucket.html) に従います。

### Azure Storage

[ストレージ コンテナの作成方法に関する Azure の手順](https://docs.microsoft.com/en-us/azure/storage/blobs/storage-quickstart-blobs-portal) に従います。

## デプロイメントを設定する {#configure-the-deployment}

サイトの設定ファイルに `[deployment]` セクションを追加し、1 つ以上の `[[deployment.targets]]` セクションを、各デプロイメント ターゲットに対して 1 つずつ追加します。
以下は、その詳細な例です。

```toml
[deployment]
# デフォルトでは、ファイルは任意の順序でアップロードされます。
# "Order" リストの正規表現に一致するファイルが、リスト順に最初にアップロードされます。
order = [".jpg$", ".gif$"]


[[deployment.targets]]
# このターゲットの任意の名前です。
name = "mydeployment"
# デプロイ先の Go Cloud 開発キットの URL です。 例:
# GCS の場合は、 https://gocloud.dev/howto/blob/#gcs を参照してください。
# URL = "gs://<Bucket Name>"

# S3 の場合は、https://gocloud.dev/howto/blob/#s3 を参照してください。
# S3 互換のエンドポイントについては、https://gocloud.dev/howto/blob/#s3-compatible を参照してください。
# URL = "s3://<Bucket Name>?region=<AWS region>"

# Azure Blob Storage の場合は、https://gocloud.dev/howto/blob/#azure を参照してください。
# URL = "azblob://$web"

# 以下のように、"prefix=" クエリパラメータを使用すると、Bucket のサブフォルダを対象とすることができます。
# URL = "gs://<Bucket Name>?prefix=a/subfolder/"

# CloudFront CDN を使用している場合、デプロイは必要に応じてキャッシュを無効にします。
cloudFrontDistributionID = <ID>

# オプションで、特定のファイルを含めたり、除外したりすることができます。
# glob パターンの構文については、https://godoc.org/github.com/gobwas/glob#glob を参照してください。
# 空でない場合、そのパターンはローカルパスとマッチングされます。
# すべてのパスは、filepath.ToSlash 形式で照合されます。
# exclude が空でなく、ローカルまたはリモート ファイルのパスが一致する場合、そのファイルは同期されません。
# include が空でなく、ローカルまたはリモート ファイルのパスが一致しない場合、そのファイルは同期されません。
# その結果、include/exclude フィルターを通らないローカルファイルはリモートにアップロードされず、
# include/exclude フィルターを通らないリモートファイルは削除されません。
# include = "**.html" # は、拡張子が ".html" のファイルのみをインクルードします。
# exclude = "**.{jpg, png}" # は、拡張子が ".jpg" または ".png" のファイルを除外します。


# [[deployment.matchers]] は、Pattern に一致するファイルに対する動作を設定します。
# パターン構文については、https://golang.org/pkg/regexp/syntax/ を参照してください。
# パターン検索は、最初にマッチした時点で停止します。

# サンプル:

[[deployment.matchers]]
# 静的アセットを 1 年間キャッシュします。
pattern = "^.+\\.(js|css|svg|ttf)$"
cacheControl = "max-age=31536000, no-transform, public"
gzip = true

[[deployment.matchers]]
pattern = "^.+\\.(png|jpg)$"
cacheControl = "max-age=31536000, no-transform, public"
gzip = false

[[deployment.matchers]]
# Set custom content type for /sitemap.xml
pattern = "^sitemap\\.xml$"
contentType = "application/xml"
gzip = true

[[deployment.matchers]]
pattern = "^.+\\.(html|xml|json)$"
gzip = true
```

## デプロイする {#deploy}

ターゲットにデプロイするには、以下のコマンドを実行します。

```bash
hugo deploy [--target=<target name>, defaults to first target]
```

Hugo は、リモートターゲットに反映させる必要があるローカルの変更を特定し、適用します。 
変更を適用せずに確認したい場合は `--dryRun` を、変更する前にプロンプトを表示させたい場合は `--confirm` を使用します。

その他のコマンドライン オプションについては、`hugo help deploy` を参照してください。

[Quick Start]: /getting-started/quick-start/
[Google Cloud]: [https://cloud.google.com]
[AWS]: [https://aws.amazon.com]
[Azure]: [https://azure.microsoft.com]

