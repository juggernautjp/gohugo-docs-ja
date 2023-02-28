---
aliases:
- /static-files
categories:
- content management
date: "2017-11-18"
description: サイトルートで **静的に** (現状のまま、変更なしで) 提供されるファイル。
draft: false
keywords:
- source
- directories
menu:
  docs:
    parent: content-management
    weight: 200
title: 静的ファイル
toc: true
weight: 200
---

デフォルトでは、サイトプロジェクト内の `static/` ディレクトリがすべての **静的ファイル** (たとえば、スタイルシート、JavaScript、画像) に使用されます。
静的ファイルは、サイトのルートパスで提供されます (たとえば、ファイル `static/image.png` があれば、 `http://{server-url}/image.png` でアクセスでき、ドキュメントに含めるには、 `![Example image](/image.png) )` で可能です)。

Hugo は、[サイト設定][site config] に `staticDir` パラメータを設定することで、そのような静的ファイルを別のディレクトリ、あるいは **複数のディレクトリ** を探すように設定することができます。 すべての静的ディレクトリ内のすべてのファイルは、ユニオン ファイルシステムを形成します。

このユニオン ファイルシステムは、サイトのルートから提供されます。つまり、`<SITE PROJECT>/static/me.png` というファイルは `<MY_BASEURL>/me.png` としてアクセスすることができます。

以下は、多言語サイトに `staticDir` と `staticDir2` を設定する例です。

{{< code-toggle copy="false" file="config" >}}
staticDir = ["static1", "static2"]

[languages]
[languages.en]
staticDir2 = "static_en"
baseURL = "https://example.com"
languageName = "English"
weight = 2
title = "In English"
[languages.no]
staticDir = ["staticDir_override", "static_no"]
baseURL = "https://example.no"
languageName = "Norsk"
weight = 1
title = "På norsk"
{{</ code-toggle >}}

上記で、テーマが使われていない場合は、

- 英語版サイトでは、"static1"、"static2"、"static_en" の 3つを統合して静的ファイルを取得することになります。ファイルの重複がある場合は、一番右のバージョンが優先されます。
- ノルウェー版サイトでは、"staticDir_override" と "static_no" の 2つを統合して静的ファイルを取得することになります。

注 1
: `staticDir2` の **2** (0 から 10 までの数字) は、このディレクトリを `staticDir` で定義された静的ディレクトリのグローバルセットに **追加** したいことを Hugo に伝えるために追加されます。言語レベルで `staticDir` を使用すると、グローバルな値に置き換わります (ノルウェー版サイトのケースに見られるように)。

注 2
: 上記の例は [マルチホスト設定][multihost setup] です。 通常のセットアップでは、すべての静的ディレクトリがすべてのサイトで利用可能になります。

[site config]: /getting-started/configuration/#all-configuration-settings
[multihost setup]: /content-management/multilingual/#configure-multilingual-multihost
