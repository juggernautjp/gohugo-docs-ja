---
aliases:
- /hugo-ja/policy/
categories:
- hugo-ja
title: 日本語翻訳プロジェクトの翻訳ポリシーについて
linktitle: 日本語翻訳ポリシー
description: この Hugo ドキュメントの日本語翻訳プロジェクトで採用している翻訳ポリシーについて説明します。 
date: 2022-12-02
publishdate: 2022-12-02
lastmod: 2022-12-02
keywords:
- docs
- hugo-ja
menu:
  docs:
    parent: hugo-ja
    weight: 20
weight: 20
draft: false
slug:
toc: true
---

## 翻訳ポリシー

1. [Microsoft ローカリゼーション スタイルガイド](https://www.microsoft.com/ja-jp/language/StyleGuides) になるべく準拠する
2. 重要な用語は「用語集」を作成し、文書中で統一した訳語を用いる
3. 訳語は、下記などのリソースを用い、一般に普及している用語を用いる
   1. ソフトウェアについては [Microsoft ランゲージポータルの用語検索](https://www.microsoft.com/ja-jp/language/Terminology) を候補とする
   2. 専門用語は、[Google 検索](https://www.google.co.jp/) を用い、その分野で多く使われている訳語を用いる
   3. 一般用語は、[Weblio 英和和英辞典](https://ejje.weblio.jp/)、[glosbe](https://ja.glosbe.com/) などの辞書を用いる
   4. 翻訳が見つからない場合、英語で書かれたサイトを [Google US 検索](https://www.google.com/webhp?gl=us&hl=en&pws=0&gws_rd=cr) などで検索し、英語表記を用いるか、和製英語にする 
4. 時間節約のため、文章の翻訳に以下の機械翻訳を用いる (主に 1と2)
   1. [Google 翻訳](https://translate.google.com/?source=gtx)
   2. [DeepL](https://www.deepl.com/ja/translator)
   3. [Reverso](https://context.reverso.net/%E7%BF%BB%E8%A8%B3/)
   4. [TREX (Translate Example)](https://tr-ex.me/%E7%BF%BB%E8%A8%B3)
   5. [みんなの自動翻訳＠TexTra](https://mt-auto-minhon-mlt.ucri.jgn-x.jp/)
5. 単文の翻訳結果ではなく、前後の文脈から意味が通じることを必ず確認すること
6. 翻訳上で読者に伝えたいことがある場合には、「訳注」として本文に追加する



## FAQ

### 1. なぜ、Microsoft スタイルガイドを使用するのか?

主なスタイルガイドには、以下の 3 種類があります。

- [Microsoft スタイルガイド](https://www.microsoft.com/ja-jp/language/StyleGuides) ― Microsoft が作成した、主にソフトウェア アプリケーションをローカライズする際の日本語表記ガイドライン
- [JTF 日本語標準スタイルガイド](https://www.jtf.jp/tips/translation_quality) ― JTF 日本翻訳連盟が作成した、実務翻訳において外国語から日本語に翻訳する際の日本語表記ガイドライン
- 情報処理学会 (IPSJ)、[MS-Word による論文作成のガイド (第3.3版)](https://www.ipsj.or.jp/journal/submit/style.html) - 情報処理学会に提出するためのスタイルガイド

この内、JTF および 情報処理学会 (IPSJ) のスタイルガイドは、主に紙に印刷した場合を目的にしたガイドラインであり、Web 上で表示した際には Microsoft のスタイルガイドと比較して、
きれいに表示されません。

このため、本プロジェクトでは、Microsoft のスタイルガイドを採用しています。


### 2. 翻訳サービスを利用して、著作権侵害にならないのか?

[Hugo Documentation の和訳・日本語翻訳プロジェクト](https://hugojapan.github.io/)、 [Visual Studio Code ローカライズ プロジェクト](https://qiita.com/EbXpJ6bp/items/8432e8ec0f55236cd503)、など、OSS の日本語翻訳 (ローカライズ) プロジェクトにおいては、Google 翻訳などの機械翻訳の利用をポリシーで禁止しています。

しかし、下記記事に書かれている通り、機械翻訳の翻訳には著作権を与えられないと考えられています。

- 引用元および詳細は、[Google 翻訳と著作権](https://note.com/kyokushinfc/n/n16e3f150dc5e) を参照してください

> Google 翻訳など機械翻訳には創作性がないため、その結果には著作権の保護を受ける権利が与えられないと一般的に考えられています
>
> ([著作権審議会第9小委員会 (コンピュータ創作物関係) 報告書](https://www.cric.or.jp/db/report/h5_11_2/h5_11_2_main.html#2_2) より引用)

むしろ、下記の記事に書かれている通り、海外の翻訳作業の実務においても、作業の効率化のために積極的に機械翻訳 (DeepL 翻訳) が使われています。

- 石角友愛、[DeepL 翻訳は英語ネイティブも外資企業も使ってる…気になるその｢使い方｣とは](https://www.businessinsider.jp/post-255801)、Jun. 27, 2022、BUSINESS INSIDER


### 3. 機械翻訳の利用方法と利用上の注意点は?

自分の経験では、Google 翻訳と DeepL 翻訳 (アプリ版) の両方で翻訳し、翻訳結果を比較して、意味の通じる翻訳品質の高い方を採用します。

1. [Google 翻訳](https://translate.google.com/?source=gtx)
2. [DeepL 翻訳](https://www.deepl.com/ja/translator) - [アプリ](https://www.deepl.com/ja/app/) からダウンロードした Windows 版アプリを利用

ただし、現状、上記 2 つの翻訳結果には、以下の欠点があるため、翻訳結果を参考に修正が必要な場合があります。

1. スタイルガイドに従っていない
2. 用語集に従わないため、同じ訳語が使われない
3. 前後の文脈を考慮しないため、前後の文章と意味が通じない場合がある
4. 専門分野の基礎知識を利用しないため、誤訳をする場合がある
5. 「あれ」「それ」「これ」などが何を指すのか考慮しないで訳している場合がある

直接、日本語の翻訳文章をタイピングする手間が省け、品質の高い翻訳結果を瞬時に表示してくれる機械翻訳を利用することにより、翻訳にかかる時間を効率化できます。


### 4. 非公式とは? 本家には貢献しないのか?

[プロジェクトについて](/hugo-ja/about/) で説明した、[Hugo Documentation の和訳・日本語翻訳プロジェクト](https://hugojapan.github.io/) では、
本家に確認しながら、本家ドキュメントサイトへの統合を目指して活動していたようです。

しかし、下記の記事に「React の日本語ドキュメントの例」が解説されていますが、これを読んだ際に、言語別にプロジェクト管理する、つまり、それぞれの翻訳の問題は
各言語のプロジェクトで管理した方が本家に迷惑がかからない、と思ったからです。

- [オープンソースドキュメント翻訳プラットフォームとしての GitHub (React 日本語ドキュメントの例)](https://zenn.dev/smikitky/articles/0d250f7367eda9)

ですが、Fork したプロジェクトでは、Issue は使えないようです。 Qiita に紹介記事を書いているので、そこにコメントするか、直接メールで連絡してください。

なお、本プロジェクトでは、Hugo のサブディレクトリの URL 変換の問題などにより、英語版コンテンツのフロントマターやレイアウトの修正、
Hugo Docs 用テンプレートのカスタマイズなどを行っており、そのままのコードでは本家とマージできません。


### 5. texlint は採用しないのか?

現在の textlint には、以下のように、[JTF 日本語標準スタイルガイド](https://www.jtf.jp/tips/translation_quality) に従ったルールでチェックできるプリセットが
既に作成されています。

- [textlint-rule-preset-jtf-style](https://github.com/azu/textlint-rule-preset-JTF-style)

しかし、筆者が採用する「Microsoft スタイルガイド」用の textlint のルールセットはまだ作成されていません。

翻訳ドキュメント公開前に、ルールセットの作成を行う計画でしたが、時間がなく、仕様書作成の段階で作業がストップしています。

また、「Microsoft スタイルガイド」および Unicode の仕様書を読み、日本語と英語の混在文章をチェックし自動修正する機能は、その一部を
Visual Studio Code の機能拡張で実装した方が良いのではないか、と考えています。

