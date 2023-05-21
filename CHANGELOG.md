
# 変更履歴 (Change Log)


## 0.1.1 (2023/05/21)

- Bootstrap v5.3.0-alpha3 に対応
- Issue #1 を修正 (content/ja/function/) の下のファイル名で大文字の英字を小文字に修正した。
- Issue #2 を修正 (content/ja/function/lang.md) JSON のデータを Markdown に修正した。
- 日本語コンテンツファイル (content/ja/) の下の「関数」セクションのディレクトリ `functions` を `function` に変更した。


### 注意事項

1. コンテンツファイルのファイル名は、英字の小文字、数字、`-`、`_`、`.` のみで、大文字の英字を使用するとコンテンツが表示されない
2. コンテンツファイルのディレクトリ名に `functions` を使用すると、Cloudflare Pages でビルド対象にならない


## 0.1.0 (2023/03/31)

- 以前、[Hugo](https://gohugo.io/) と同じテーマを用いた日本語版サイトを [GitHub Pages](https://juggernautjp.github.io/hugo-docs-ja/) にて公開
- Bootstrap v5.3.0-alpha1 にテーマを変更したサイトを [Cloudflare Pages](https://juggernautjp.info/) に移行


