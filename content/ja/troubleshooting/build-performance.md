---
aliases: []
categories:
- troubleshooting
date: "2017-03-12"
description: サイト構築の性能問題を診断し、改善するために使用される機能の概要について説明します。
draft: false
keywords:
- performance
- build
linktitle: ビルド性能
menu:
  docs:
    parent: troubleshooting
publishdate: "2017-03-12"
slug: null
title: ビルド性能
toc: true
weight: 3
---

## テンプレート メトリクス {#template-metrics}

Hugo は非常に高速な静的サイトジェネレーターですが、非効率なテンプレートを書くことも可能です。 Hugo の _テンプレート メトリクス_ 機能は、どのテンプレートが最も頻繁に実行され、それらの実行に **CPU 時間** がどのくらいかかっているかを正確に把握するのに非常に役立ちます。

| 指標名              | 説明                                                           |
| ------------------- | -------------------------------------------------------------- |
| cumulative duration | 指定されたテンプレートの実行に費やされた累積時間。          |
| average duration    | 指定されたテンプレートの平均実行時間。             |
| maximum duration    | 指定したテンプレートで 1 回の実行にかかった最大時間。 |
| count               | テンプレートが実行された回数。                   |
| template            | テンプレート名。                                            |

```txt
▶ hugo --templateMetrics
Started building sites ...

Built site for language en:
0 draft content
0 future content
0 expired content
2 regular pages created
22 other pages created
0 non-page files copied
0 paginator pages created
4 tags created
3 categories created
total in 18 ms

Template Metrics:

     cumulative       average       maximum
       duration      duration      duration  count  template
     ----------      --------      --------  -----  --------
     6.419663ms     583.605µs     994.374µs     11  _internal/_default/rss.xml
     4.718511ms    1.572837ms    3.880742ms      3  indexes/category.html
     4.642666ms    2.321333ms    3.282842ms      2  posts/single.html
     4.364445ms     396.767µs    2.451372ms     11  partials/header.html
     2.346069ms     586.517µs     903.343µs      4  indexes/tag.html
     2.330919ms     211.901µs    2.281342ms     11  partials/header.includes.html
     1.238976ms     103.248µs     446.084µs     12  posts/li.html
       972.16µs      972.16µs      972.16µs      1  _internal/_default/sitemap.xml
      953.597µs     953.597µs     953.597µs      1  index.html
      822.263µs     822.263µs     822.263µs      1  indexes/post.html
      567.498µs       51.59µs     112.205µs     11  partials/navbar.html
       348.22µs      31.656µs      88.249µs     11  partials/meta.html
      346.782µs     173.391µs     276.176µs      2  posts/summary.html
      235.184µs       21.38µs     124.383µs     11  partials/footer.copyright.html
      132.003µs          12µs     117.999µs     11  partials/menu.html
       72.547µs       6.595µs      63.764µs     11  partials/footer.html
```

{{% note %}}
**並列処理に関する注意点**

Hugo は、複数のページが同時に生成される並列処理でページをビルドします。この並列処理により、「累積期間 (cumulative duration)」値の合計は、通常、サイト構築にかかる実際の時間よりも長くなります。
{{% /note %}}

## キャッシュされた部分テンプレート (パーシャル) {#cached-partials}

サイドバーやメニューのような `partial` テンプレートは、サイト構築時に何度も実行されるものがあります。`partial` テンプレートに含まれるコンテンツや、目的の出力によっては、実行回数を減らすために、テンプレートをキャッシュして実行回数を減らすことができる場合があります。 [`PartialCached`][partialcached] テンプレート関数は、 `partial` テンプレートにキャッシュ機能を提供します。

{{% tip %}}
初期コンテキスト以外に `partialCached` に追加のパラメータを渡すことで、各 `partial` のキャッシュされたバリアントを作成することができることに注意してください。 詳細については、 `partialCached` のドキュメントを参照してください。
{{% /tip %}}

[partialCached]:{{< ref "/functions/partialCached.md" >}}
