---
date: "2017-02-01"
description: Hugo は、圧倒的なスピード、堅牢なコンテンツ管理、強力なテンプレート言語が特徴で、あらゆる種類の静的な Web サイトに最適なソフトウェアです。
draft: false
lastmod: "2017-02-01"
linktitle: Hugo の機能
menu:
  docs:
    parent: about
    weight: 20
publishdate: "2017-02-01"
sections_weight: 20
title: Hugo の機能
toc: true
weight: 20
---

## 一般 {#general}

* [非常に高速な][Extremely fast] ビルド時間 (1 ページあたり 1 ミリ秒未満)
* 完全なクロスプラットフォームで、macOS、Linux、Windows などに [簡単にインストール][install] が可能 
* [LiveReload][] を利用して開発中の変更をその場でレンダリング
* [強力なテーマ][Powerful theming]
* [どこでもホスティング可能][hostanywhere]

## 構成 {#organization}

* Web サイトのセクションを含む、わかりやすい [プロジェクトの構成][organization for your projects]
* カスタマイズ可能な [URLs][]
* カテゴリーやタグなど、設定可能な [タクソノミー (分類法)][taxonomies] に対応
* 強力なテンプレート [関数][functions] で、思い通りの [コンテンツの並べ替え][Sort content]
* [目次][table of contents] の自動生成
* [動的なメニュー][Dynamic menu] の生成
* [プリティー URL][Pretty URLs] のサポート
* [パーマリンク (固定リンク)][Permalink] パターンのサポート
* [エイリアス][aliases] 経由のリダイレクト

## コンテンツ {#content}

* ネイティブの Markdown と Emacs Org-Mode をサポートし、*外部ヘルパー* によって他の言語もサポート ([サポートされる形式][supported formats] を参照)。
* [フロントマター][front matter] で TOML、YAML、JSON のメタデータをサポート
* カスタマイズ可能な [ホームページ][homepage]
* 複数の [コンテンツタイプ][content types]
* 自動およびユーザー定義の [コンテンツ サマリー][content summaries]
* Markdown 内のリッチコンテンツを可能にする [ショートコード][Shortcodes]
* ["記事読了までの所要時間"][pagevars] を表示する機能
* ["ワードカウント"][pagevars] 機能

## その他の機能 {#additional-features}

* 統合された [Disqus][] コメントのサポート
* 統合された [Google アナリティクス][Google Analytics] のサポート
* [RSS][] の自動作成
* [Go][] HTML テンプレートのサポート
* [Chroma][] による [シンタックスハイライト][Syntax highlighting]

[aliases]: /content-management/urls/#aliases
[Chroma]: https://github.com/alecthomas/chroma
[content summaries]: /content-management/summaries/
[content types]: /content-management/types/
[Disqus]: https://disqus.com/
[Dynamic menu]: /templates/menu-templates/
[Extremely fast]: https://github.com/bep/hugo-benchmark
[front matter]: /content-management/front-matter/
[functions]: /functions/
[Go]: https://pkg.go.dev/html/template
[Google Analytics]: https://google-analytics.com/
[homepage]: /templates/homepage/
[hostanywhere]: /hosting-and-deployment/
[install]: /installation/
[LiveReload]: /getting-started/usage/
[organization for your projects]: /getting-started/directory-structure/
[pagevars]: /variables/page/
[Permalink]: /content-management/urls/#permalinks
[Powerful theming]: /hugo-modules/theme-components/
[Pretty URLs]: /content-management/urls/
[RSS]: /templates/rss/
[Shortcodes]: /content-management/shortcodes/
[sort content]: /templates/
[supported formats]: /content-management/formats/
[Syntax highlighting]: /content-management/syntax-highlighting/
[table of contents]: /content-management/toc/
[taxonomies]: /content-management/taxonomies/
[URLs]: /content-management/urls/
