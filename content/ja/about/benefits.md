---
aliases: []
date: "2017-02-01"
description: パフォーマンス、セキュリティ、使いやすさの向上は、静的サイトジェネレーターが魅力的な理由のほんの一部です。
draft: false
keywords:
- ssg
- static
- performance
- security
lastmod: "2017-02-01"
linktitle: SSG のメリット
menu:
  docs:
    parent: about
    weight: 30
publishdate: "2017-02-01"
sections_weight: 30
title: 静的サイトジェネレーターのメリット
toc: false
weight: 30
---

Web サイトジェネレーターの目的は、コンテンツを HTML ファイルにレンダリングすることです。そのほとんどは「動的サイトジェネレーター」です。つまり、HTTP サーバー (表示するファイルをブラウザに送信するプログラム) は、エンドユーザーがページを要求するたびにジェネレーターを実行して新しい HTML ファイルを作成します。

時が経つにつれ、動的サイトジェネレーターは、エンドユーザーへのページ配信の不要な遅延を防ぐために、HTML ファイルをキャッシュするようプログラムされるようになりました。キャッシュされたページとは、ウェブページの静的バージョンのことです。

Hugo はキャッシュをさらに一歩進め、すべての HTML ファイルがコンピュータ上でレンダリングされます。HTTP サーバーをホストするコンピューターにファイルをコピーする前に、ローカルでファイルを確認できます。HTML ファイルが動的に生成されないので、Hugo のことを *静的サイトジェネレーター* と呼びます。

これには多くのメリットがあります。最も顕著なのはパフォーマンスです。HTTP サーバーはファイルの送信に *非常に* 優れています。実際、非常に優れているため、動的なサイトに必要なメモリや CPU の何分の一かで、同じ数のページを効果的に提供できます。

## 静的サイトジェネレーターの詳細 {#more-on-static-site-generators}

* ["An Introduction to Static Site Generators", David Walsh][]
* ["Hugo vs. WordPress page load speed comparison: Hugo leaves WordPress in its dust", GettingThingsTech][hugovwordpress]
* ["Static Site Generators", O'Reilly][]
* [StaticGen: Top Open-Source Static Site Generators (GitHub Stars)][]
* ["Top 10 Static Website Generators", Netlify blog][]
* ["The Resurgence of Static", dotCMS][dotcms]

["An Introduction to Static Site Generators", David Walsh]: https://davidwalsh.name/introduction-static-site-generators
["Static Site Generators", O'Reilly]: https://github.com/gohugoio/hugoDocs/files/1242701/static-site-generators.pdf
["Top 10 Static Website Generators", Netlify blog]: https://www.netlify.com/blog/2016/05/02/top-ten-static-website-generators/
[hugovwordpress]: https://gettingthingstech.com/hugo-vs.-wordpress-page-load-speed-comparison-hugo-leaves-wordpress-in-its-dust/
[StaticGen: Top Open-Source Static Site Generators (GitHub Stars)]: https://www.staticgen.com/
[dotcms]: https://dotcms.com/blog/post/the-resurgence-of-static
