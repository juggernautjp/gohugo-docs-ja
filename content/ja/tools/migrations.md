---
aliases:
- /developer-tools/migrations/
- /developer-tools/migrated/
date: "2017-02-01"
description: 既存の静的サイトジェネレーターやコンテンツ管理システムから Hugo に移行するための、コミュニティが開発したツールのリストです。
draft: false
keywords:
- migrations
- jekyll
- wordpress
- drupal
- ghost
- contentful
lastmod: "2022-03-26"
linktitle: Hugo への移行
menu:
  docs:
    parent: tools
    weight: 10
publishdate: "2017-02-01"
sections_weight: 10
title: Hugo への移行
toc: true
weight: 10
---

このセクションでは、独自に開発された Hugo に関するいくつかのプロジェクトを取り上げます。 これらのツールは、静的サイトジェネレーターの機能を拡張したり、開始するのに役立ちます。

{{% note %}}
あなたは、Hugo に関する同様のプロジェクトを知っているか、維持していますか? 機能を追加する必要があると思われる場合は、GitHub で [プルリクエスト](https://github.com/gohugoio/hugoDocs/pulls) をオープンしてください。
{{% /note %}}

現在、Jekyll や WordPress などの他のブログツールを使用していて、代わりに Hugo に切り替える予定がある場合は、この移行ツールのリストをご覧ください。 これらのツールは、あなたのコンテンツを Hugo に適した形式にエクスポートしてくれます。

## Jekyll

または、新しい [Jekyll インポート コマンド](/commands/hugo_import_jekyll/) を使用できます。

- [JekyllToHugo](https://github.com/fredrikloch/JekyllToHugo) - Jekyll のブログ投稿を Hugo のサイトに変換するための小さなスクリプトです。
- [ConvertToHugo](https://github.com/coderzh/ConvertToHugo) - あなたのブログを Jekyll から Hugo に変換します。

## Ghost

- [ghostToHugo](https://github.com/jbarone/ghostToHugo) - Ghost ブログの記事を変換し、Hugo にエクスポートします。

## Octopress

- [octohug](https://github.com/codebrane/octohug) - Octopress から Hugo への移行ツールです。

## DokuWiki

- [dokuwiki-to-hugo](https://github.com/wgroeneveld/dokuwiki-to-hugo) - DokuWiki のソースページを [DokuWiki 構文](https://www.dokuwiki.org/wiki:syntax) から Hugo Markdown 構文に移行します。TODO プラグインのような追加機能も含まれています。Python 3 を使用して、拡張性を念頭に置いて書かれています。また、各ページの TOML ヘッダも生成します。 wiki ディレクトリを /content ディレクトリにコピーペーストするように設計されています。

## WordPress

- [wordpress-to-hugo-exporter](https://github.com/SchumacherFM/wordpress-to-hugo-exporter) - すべての投稿、ページ、タクソノミー、メタデータ、および設定を、Hugo にドロップできる、 Markdown および YAML に変換するワンクリック WordPress プラグインです。 (注意: このプラグインの使用に問題がある場合は、[サイトを Jekyll 用にエクスポート](https://wordpress.org/plugins/jekyll-exporter/) し、上記の Hugo の組み込み Jekyll コンバーターを使用できます。)
- [blog2md](https://github.com/palaniraja/blog2md) - 無料の YOUR-TLD.wordpress.com の Web サイトから [エクスポートされた xml](https://en.support.wordpress.com/export/) ファイルを使って動作します。 また、承認されたコメントは、投稿と一緒に `YOUR-POST-NAME-comments.md` ファイルに保存されます。
- [wordhugopress](https://github.com/nantipov/wordhugopress) - Java で書かれた小さなユーティリティで、ローカルまたはリモートで保存されたデータベースとリソース (画像など) ファイルから、WordPress サイト全体をエクスポートします。したがって、バックアップ ファイルからの移行が可能です。複数の WordPress サイトを 1 つの Hugo にマージすることをサポートします。

## Medium

- [medium2md](https://github.com/gautamdhameja/medium-2-md) - フロントマターを含むストーリーを 1 コマンドでインポートできる、シンプルな Medium から Hugo エクスポートツールです。
- [medium-to-hugo](https://github.com/bgadrian/medium-to-hugo) - 中程度の記事を Hugo 互換の Markdown 形式にエクスポートするための Go で書かれた CLI ツールです。 タグと画像は含まれています。すべての画像はローカルにダウンロードされ、適切にリンクされます。

## Tumblr

- [tumblr-importr](https://github.com/carlmjohnson/tumblr-importr) - Tumblr API を使用して、Hugo の静的サイトを作成するインポートツールです。
- [tumblr2hugomarkdown](https://github.com/Wysie/tumblr2hugomarkdown) - すべての Tumblr コンテンツを、元のフォーマットを保持したまま Hugo Markdown ファイルにエクスポートします。
- [Tumblr to Hugo](https://github.com/jipiboily/tumblr-to-hugo) - Tumblr の各投稿を、適切なタイトルとパスを持つコンテンツファイルに変換する移行ツールです。さらに、"Tumblr to Hugo" は、リダイレクトの設定に役立つように、元の URL と Hugo 上の新しいパスが記載された CSV ファイルを作成します。

## Drupal

- [drupal2hugo](https://github.com/danapsimer/drupal2hugo) - Drupal サイトを Hugo に変換します。

## Joomla

- [hugojoomla](https://github.com/davetcc/hugojoomla) - Java で書かれたこのユーティリティは、Joomla のデータベースを取り込み、すべてのコンテンツを Markdown ファイルに変換します。それは、 Joomla の内部形式であるすべての URL を変更し、それらを適切な形式に変換します。

## Blogger

- [blogimport](https://github.com/natefinch/blogimport) - Blogger の記事を Hugo にインポートするツールです。
- [blogger-to-hugo](https://pypi.org/project/blogger-to-hugo/) - Blogger の記事を Hugo にインポートするためのもう一つのツールです。埋め込み画像もダウンロードするので、ローカルに保存されます。
- [blog2md](https://github.com/palaniraja/blog2md) - YOUR-TLD.blogspot.com の Web サイトの [エクスポートされた xml](https://support.google.com/blogger/answer/41387?hl=en) ファイルに対して動作します。また、投稿と一緒にコメントも `YOUR-POST-NAME-comments.md` ファイルに保存されます。
- [BloggerToHugo](https://github.com/huanlin/blogger-to-hugo) - Blogger の記事を Hugo にインポートするための、もうひとつのツールです。 Windows プラットフォーム専用で、 .NET Framework 4.5 が必要です。 このツールを使用する前に、README.md を参照してください。

## Contentful

- [contentful2hugo](https://github.com/ArnoNuyts/contentful2hugo) - [Contentful](https://www.contentful.com/) のコンテンツから Hugo 用のコンテンツファイルを作成するツールです。

## BlogML

- [BlogML2Hugo](https://github.com/jijiechen/BlogML2Hugo) - BlogML の xml ファイルを Hugo Markdown ファイルに変換するためのツールです。 添付ファイルや画像へのリンクは、ユーザーが自分で処理する必要があります。 BlogML ファイルをエクスポートするブログ (BlogEngine.NET など) が簡単に Hugo サイトに変換できます。
