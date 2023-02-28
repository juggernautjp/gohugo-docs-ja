---
aliases:
- /hugo-ja/about/
categories:
- hugo-ja
title: Hugo ドキュメントの日本語翻訳プロジェクト
linktitle: 日本語翻訳プロジェクトの違い
description: Hugo ドキュメントの日本語翻訳プロジェクトは、個人が翻訳・管理しているプロジェクトです。
date: 2022-12-02
publishdate: 2022-12-02
lastmod: 2022-12-02
keywords:
- docs
- hugo-ja
menu:
  docs:
    parent: hugo-ja
    weight: 10
weight: 10
draft: false
slug:
toc: true
---

## プロジェクトについて

Hugo ドキュメントの日本語訳プロジェクトは、下記のプロジェクトがすでにあります。

- [Hugo Documentation の和訳・日本語翻訳プロジェクト](https://hugojapan.github.io/)
  - [Hugo Japan - GitHub](https://github.com/hugojapan)

上記の GitHub の記述には、

> 変更を追いかけるのが大変なので v1 リリース後に再開します。

と書かれており、2020年以降、プロジェクトはストップした状態です。

しかし、[Hugo](https://github.com/gohugoio/hugo) は、2022年12月現在、[v0.107.0](https://github.com/gohugoio/hugo/releases/tag/v0.107.0) のままであり、
いつ v1 リリースされるのか未定の状態です。

本プロジェクトは、「Hugo ドキュメント (v0.105)」を日本語に翻訳したものです。



## なぜ個人で翻訳プロジェクトを立ち上げたのか?

個人のサイトを公開するための方法を調査していた際、静的サイトジェネレーター (Static Site Generator) を使用するのが良いと判断しました。

静的サイトジェネレーターの主なものには、以下があります。

- [Gatsby - Official](https://www.gatsbyjs.com/)
- [Jekyll - Official](http://jekyllrb.com/)
- [Hugo - Official](https://gohugo.io/)

Jekyll を試したのですが、

- ビルド時間が遅い
- Jekyll を Windows にインストールするのは、容易ではない [^1]

などの問題があり、それより高速であると評判の Hugo を選ぶことにしました。

しかし、Jekyll と比較し、日本語の情報が少なく、公式サイトのドキュメント自身が翻訳の必要性を感じました。

また、一人で行ったのは、以下の理由からです。

- 多人数が参加できるポリシーや環境構築を準備できず、実際に試行しながら環境構築を行うつもりであった
- 多人数が参加することにより、レビューが必要になるが、レビューする手間よりも原文から訳した方が速いし、品質も低下しない
- 他の OSS ドキュメント翻訳プロジェクトに比べて、ページ数が限定的であり、それほどの時間がかからないと思った
- 翻訳した経験を個人サイトや他の翻訳サイトに流用できるような経験を積み、公開できるようにしたかった


## 脚注

[^1]: 詳細は、Qiita、[「【2022年版】 Windows10/11 への Jekyll (4.2.2) インストールにおけるトラブルシューティング」](https://qiita.com/juggernautjp/items/20cc4f66dee27b02bf8a) の記事で解説した記事を参照してください。

