---
aliases:
- /extras/gitinfo/
categories:
- variables and params
date: "2017-03-12"
description: すべてのコンテンツファイルについて、最新の Git リビジョン情報を取得します。
draft: false
keywords:
- git
lastmod: "2017-03-12"
linktitle: GIt 変数
menu:
  docs:
    parent: variables
    weight: 70
publishdate: "2017-03-12"
sections_weight: 70
title: GIt Info 変数
toc: false
weight: 70
wip: false
---

{{% note "`.GitInfo` Performance Considerations"  %}}
Hugo の Git 統合はかなりパフォーマンスが高いはずですが、ビルド時間が増加する可能性が *あります*。これは、Git 履歴のサイズに依存します。
{{% /note %}}

## `.GitInfo` 前提条件 {#gitinfo-prerequisites}

1. Hugo サイトは、Git が有効なディレクトリにある必要があります。
2. Git の実行ファイルがインストールされており、システムの `PATH` に入っている必要があります。
3. コマンドラインで `--enableGitInfo` フラグを渡すか、[サイトの設定ファイル][configuration] で `enableGitInfo` を `true` に設定して、Hugo プロジェクトで `.GitInfo` 機能を有効にする必要があります。

## `.GitInfo` オブジェクト {#the-gitinfo-object}

`GitInfo` オブジェクトは、以下のフィールドを含んでいます。

.AbbreviatedHash
: コミットハッシュの省略形です (たとえば、 `866cbcc`)。

.AuthorName
: 作成者の名前で、[`.mailmap`](https://git-scm.com/docs/gitmailmap) を尊重します。

.AuthorEmail
: 作成者のメールアドレスで、[`.mailmap`](https://git-scm.com/docs/gitmailmap) を尊重します。

.AuthorDate
: 著者の日付です。

.Hash
: コミットハッシュです (たとえば、 `866cbccdab588b9908887ffd3b4f2667e94090c3`)。

.Subject
: コミットメッセージの件名です (たとえば、 `tpl: Add custom index function`)。

## `.Lastmod`

`.GitInfo` 機能が有効な場合、 (`Page` 上の) `.Lastmod` は Git から、つまり `.GitInfo.AuthorDate` を取得します。この動作は、独自の [日付のフロントマター設定](/getting-started/configuration/#configure-front-matter) を追加することで変更できます。

[configuration]: /getting-started/configuration/
