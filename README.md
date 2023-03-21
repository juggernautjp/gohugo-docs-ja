# gohugo-docs-ja

Hugo でサイト構築する方法に関連し、Hugo を記述した Go 言語やテーマ作成で利用する Bootstrap などの技術情報を提供するサイトです。



## 変更履歴

1. 以前、[Hugo](https://gohugo.io/) と同じテーマを用いた日本語版サイトを [GitHub Pages]() にて公開
2. Bootstrap v5.3.0-alpha1 にテーマを変更したサイトを [Cloudflare Pages](https://juggernautjp.info/) に移行



## コンテンツ

- [Hugo ドキュメント](https://gohugo.io/documentation/) の日本語訳



## 利用技術

- [Hugo](https://gohugo.io/)
- [Go 言語](https://go.dev/) - スクリプト作成 (WIP)
- [Bootstrap](https://getbootstrap.com/) v5.3.0 (現時点では、正式版ではなく alpha1 版)
- [Flexsearch.js](https://github.com/nextapps-de/flexsearch) + [Kuromoji.js](https://github.com/takuyaa/kuromoji.js/)/[kuromojin](https://github.com/azu/kuromojin)
- [Couldflare](https://dash.cloudflare.com/) [Pages](https://www.cloudflare.com/ja-jp/products/pages/)


## 参考テーマ

- [Bootstrap v5.3.0 example](https://github.com/twbs/bootstrap/tree/main/site) - Bootstrap v5.3.0-alpha1 のサンプル (ベース)
- [hugo-theme-zen example](https://github.com/frjo/hugo-theme-zen/tree/main/exampleSite) - Hugo Zen テーマのサンプル (Flexsearch.js)


## 参考記事

- [[Gatsby] Flexsearch × Kuromoji による日本語フレンドリーなサイト内検索の追加](https://tenderfeel.xsrv.jp/javascript/5711/)
- **Bootstrap 関連**
  - [Bootstrap v5.3 ドキュメント](https://getbootstrap.com/docs/5.3/getting-started/introduction/) - 公式 (英語)
  - [Bootstrap v5.0 ドキュメント](https://getbootstrap.jp/docs/5.0/getting-started/introduction/) - 日本語版 (LINE Corporation による翻訳)
  - [Bootstrap5 設置ガイド](https://bootstrap-guide.com/) - Bootstrap5 の使い方を日本語で解説 (v5.3.0-alpha版に対応)
- **SVG アイコン関連**
  - [Bootstrap Icon](https://icons.getbootstrap.com/) - サイドメニュー等のアイコン
  - [SVG Repo](https://www.svgrepo.com/) - Hugo 等、ブランド名のアイコン



## 日本語サイト用カスタマイズ

下記の [hugo-theme-zen](https://github.com/frjo/hugo-theme-zen/) のカスタマイズ方法を参考にカスタマイズを行う。

1. Logo
Place your logo at `static/images/logo.png`.

2. Favicons

Upload your image to [RealFaviconGenerator](https://realfavicongenerator.net/) then copy-paste the generated favicon files under `static`.
Then set the "realfavicongenerator" param to true to add the needed meta tags. Also good to set the "themeColor" param to correct colour.

3. Menu and sidebar layouts

Topbar menu: `layouts/partials/docs-navbar.html`
Sidebar menu: `layouts/partials/docs-sidebar.html`, `data/sidebar_ja.yml`


4. Render hook テンプレート

  - Add anchor links to headers
    An example render hook template for templates will add anchor links to all headers. To activate it copy the file `~/theme/zen/layouts/_default/_markup/render-heading.html.example` to `layouts/_default/_markup/render-heading.html`.

    Needed styles are in the `_zen.scss` file.

5. Katex に数式表示

  Download the latest release from <https://github.com/KaTeX/KaTeX/releases>. Unpack and place the resulting "katex" directory in the root `static` directory.
  The resulting path should be `static/katex`. Then set the `math` param to "true" and write some math to be typeset.



### 日本語全文検索機能の追加

1. [FlexSearch.js](https://github.com/nextapps-de/flexsearch) による全文検索

  検索ページを作成するために必要な 3 つのステップ:

  1. 設定ファイルに新しい出力形式を追加します。
    ```yaml
    outputFormats:
      SearchIndex:
        mediaType: "application/json"
        baseName: "searchindex"
        isPlainText: true
        notAlternative: true
    ```
  2. 新しい出力形式を "home" の出力設定に追加します。
    ```yaml
    outputs:
      home: ["HTML", "SearchIndex", "[other formats you need]"]
    ```
  3. 検索ページにショートコード `{{< search >}}` を追加します。
    このショートコードを使用したページでは、search と flexsearch の js ファイルが自動的にロードされます。

検索ページには、サイトのすべての投稿を検索できる検索フィールドが表示されるようになります。
設定項目は "searchLimit" のみで、デフォルトは 20 です。


2. 日本語形態素解析ライブラリの利用

[Kuromoji.js](https://github.com/takuyaa/kuromoji.js/) のラッパー [kuromojin](https://github.com/azu/kuromojin) を利用し、日本語の検索精度を上げる。
