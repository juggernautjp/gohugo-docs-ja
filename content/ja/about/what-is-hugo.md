---
aliases:
- /overview/introduction/
- /about/why-i-built-hugo/
date: "2017-02-01"
description: Hugo は Go で書かれた高速でモダンな静的サイトジェネレーターで、Web サイト制作を再び楽しくするように設計されています。
draft: false
lastmod: "2017-02-01"
layout: single
linktitle: Hugo とは
menu:
  docs:
    parent: about
    weight: 10
publishdate: "2017-02-01"
sections_weight: 10
title: Hugo とは
toc: true
weight: 10
---

Hugo は、汎用的な Web サイトのフレームワークです。技術的に言えば、Hugo は [静的サイトジェネレーター][static site generator] です。訪問者のリクエストごとに動的にページを作成するシステムとは異なり、Hugo はコンテンツを作成または更新したときにページを作成します。Web サイトは編集される頻度よりも閲覧される頻度の方がはるかに高いため、Hugo は Web サイトのエンドユーザーに最適な閲覧体験を、Web サイトの作成者には理想的な執筆体験を提供できるよう設計されています。

Hugo で構築された Web サイトは、非常に高速で安全です。Hugo のサイトは、[Netlify][]、[Heroku][]、[GoDaddy][]、[DreamHost][]、[GitHub Pages][]、[GitLab Pages][]、[Surge][]、[Firebase][]、[Google Cloud Storage][]、[Amazon S3][]、[Rackspace][]、[Azure][]、[CloudFront][] など、どこでもホストでき、CDN でもうまく機能することができます。Hugo のサイトは、データベースを必要とせず、Ruby、Python、PHP などの高価なランタイムに依存することなく実行できます。

Hugo は、ほぼ瞬時にビルドできる理想的な Web サイト作成ツールであり、変更が加えられるたびに再構築できると考えています。

## Hugo の速さは? {#how-fast-is-hugo}

{{< youtube "CdiDYZ51a2o" >}}

## Hugo は何をしますか? {#what-does-hugo-do}

技術的に言えば、Hugo はファイルとテンプレートのソースディレクトリを受け取り、それらを入力として完全な Web サイトを作成します。

## Hugo を使用すべきなのは誰ですか? {#who-should-use-hugo}

Hugo は、ブラウザよりもテキストエディタで書くことを好む人向けです。

Hugo は、複雑なランタイムや依存関係、データベースの設定を気にせずに、自分の Web サイトを手作業でコーディングしたい人向けです。

Hugo は、ブログ、企業サイト、ポートフォリオサイト、ドキュメント、単一のランディングページ、または数千ページを持つ Web サイトを構築する人々のためのものです。

[@spf13]: https://twitter.com/spf13
[Amazon S3]: https://aws.amazon.com/s3/
[Azure]: https://docs.microsoft.com/en-us/azure/storage/blobs/storage-blob-static-website
[CloudFront]: https://aws.amazon.com/cloudfront/ "Amazon CloudFront"
[DreamHost]: https://www.dreamhost.com/
[Firebase]: https://firebase.google.com/docs/hosting/ "Firebase static hosting"
[GitHub Pages]: https://pages.github.com/
[GitLab Pages]: https://about.gitlab.com/features/pages/
[Go language]: https://go.dev/
[GoDaddy]: https://www.godaddy.com/ "GoDaddy.com Hosting"
[Google Cloud Storage]: https://cloud.google.com/storage/
[Heroku]: https://www.heroku.com/
[Jekyll]: https://jekyllrb.com/
[Middleman]: https://middlemanapp.com/
[Nanoc]: https://nanoc.ws/
[Netlify]: https://netlify.com
[Rackspace]: https://www.rackspace.com/cloud/files
[Surge]: https://surge.sh
[contributing to it]: https://github.com/gohugoio/hugo
[rackspace]: https://www.rackspace.com/openstack/public/files
[static site generator]: /about/benefits/
