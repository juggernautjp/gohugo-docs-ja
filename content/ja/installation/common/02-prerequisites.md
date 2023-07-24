## 前提条件 {#prerequisites}

すべての場合に必要というわけではありませんが、Git と Go 、[Dart Sass][dart sass] は、Hugo を操作するときによく使用されます。

Git は、以下の場合に必要です。

- Hugo をソースからビルドする
- [Hugo モジュール][Hugo Modules] 機能を使用する
- テーマを Git サブモジュールとしてインストールする
- ローカルの Git リポジトリから [コミット情報][commit information] にアクセスする
- [CloudCannon]、[Cloudflare Pages]、[GitHub Pages]、[GitLab Pages]、[Netlify] などのサービスを使用してサイトをホストする

Go は、以下の場合に必要です。

- Hugo をソースからビルドする
- [Hugo モジュール][Hugo Modules] 機能を使用する

インストール手順については、関連ドキュメントを参照してください。

- [Git][git install]
- [Go][go install]
- [Dart Sass][dart sass install]

[cloudcannon]: https://cloudcannon.com/
[cloudflare pages]: https://pages.cloudflare.com/
[dart sass install]: /hugo-pipes/transpile-sass-to-css/#dart-sass
[dart sass]: https://sass-lang.com/dart-sass
[git install]: https://git-scm.com/book/en/v2/Getting-Started-Installing-Git
[git]: https://git-scm.com/
[github pages]: https://pages.github.com/
[gitlab pages]: https://docs.gitlab.com/ee/user/project/pages/
[go install]: https://go.dev/doc/install
[go]: https://go.dev/
[netlify]: https://www.netlify.com/
[Hugo Modules] /hugo-modules/