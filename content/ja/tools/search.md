---
aliases: []
categories:
- developer tools
date: "2017-02-01"
description: 新しく作成した Hugo の Web サイトで、オープンソースおよび商用の検索オプションの一部を参照してください。
draft: false
keywords:
- search
- tools
linktitle: 検索
menu:
  docs:
    parent: tools
    weight: 60
publishdate: "2017-02-01"
sections_weight: 60
title: Hugo の Web サイトを検索する
toc: true
weight: 60
---

動的検索機能を備えた静的な Web サイトですか? はい、Hugo は、静的なウェブサイトに対して、Google やその他の検索エンジンの埋め込み可能なスクリプトの代わりとなる機能を提供します。 Hugo では、コンテンツファイルを直接インデックス化することで、訪問者にカスタム検索機能を提供できます。

* [GitHub Gist for Hugo Workflow](https://gist.github.com/sebz/efddfc8fdcb6b480f567). この gist には、静的な Web サイトの検索インデックスを作成するためのシンプルなワークフローが含まれています。シンプルな Grunt スクリプトを使用してすべてのコンテンツファイルのインデックスを作成し、[lunr.js](https://lunrjs.com/) を使用して検索結果を提供します。

* [hugo-lunr](https://www.npmjs.com/package/hugo-lunr). [lunr.js](https://lunrjs.com/) を使用して、静的な Hugo サイトにサイト検索を追加する簡単な方法です。 Hugo-lunr は、Hugo プロジェクト内の HTML および Markdown ドキュメントのインデックス ファイルを作成します。
* [hugo-lunr-zh](https://www.npmjs.com/package/hugo-lunr-zh). Hugo-lunr に少し似ていますが、Hugo-lunr-zh は中国語のキーワードを分離するのに役立ちます。
* [GitHub Gist for Fuse.js integration](https://gist.github.com/eddiewebb/735feb48f50f0ddd65ae5606a1cb41ae). この gist は、Hugo の既存のビルド時の処理を利用して、クライアントサイドの [Fuse.js](https://fusejs.io/) で使用される検索可能な JSON インデックスを生成する方法を示しています。この gist ではファジーマッチングに Fuse.js を使用していますが、JSON インデックスを読み込めるクライアントサイドの検索ツールであれば、どのようなものでも動作します。npm や grunt など、Hugo 以外のビルドツールは必要ありません。
* [hugo-search-index](https://www.npmjs.com/package/hugo-search-index). Gulp タスクと、検索を実装するビルド済みのブラウザ スクリプトを含むライブラリです。 Gulp は、プロジェクトの Markdown ファイルから検索インデックスを生成します。
* [hugofastsearch](https://gist.github.com/cmod/5410eae147e4318164258742dd053993). 「Fuse.js 統合のための GitHub Gist」のユーザビリティとスピードアップ - グローバルでキーボードに最適化された検索を実現。
* [JS & Fuse.js tutorial](https://makewithhugo.com/add-search-to-a-hugo-site/) FuseJS を使った、シンプルなクライアントサイドの検索ソリューションです (jQuery は不要です)。
* [Pagefind](https://github.com/cloudcannon/pagefind). ユーザーの帯域幅をできるだけ使用せずに、大規模なサイトで優れたパフォーマンスを発揮することを目的とした、完全に静的な検索ライブラリです。

## 商用の検索サービス {#commercial-search-services}

* [Algolia](https://www.algolia.com/) の Search API は、アプリや Web サイトで優れた検索体験を簡単に提供できるようにします。 Algolia Search は、ホストされた全文検索、数値検索、ファセット検索、ジオローカライズ検索を提供します。
* [Bonsai](https://www.bonsai.io) は、高速で信頼性が高く、セットアップが簡単な、フルマネージド型のホスト型 Elasticsearch サービスです。Hugo のドキュメントを Elasticsearch に簡単に取り込むには、[ドキュメントからのこのガイド](https://docs.bonsai.io/docs/hugo) に従ってください。
* [ExpertRec](https://www.expertrec.com/) は、高速でスケーラブルなホスト型の search-as-a-service (サービスとしての検索) ソリューションです。 セットアップと統合は非常に簡単で、数分しかかかりません。 検索設定は、ダッシュボードを使用して、コーディングなしで変更できます。
