---
aliases:
- /security/
date: "2019-10-01"
description: Hugo のセキュリティモデルの概要です。
draft: false
keywords:
- Security
- Privacy
layout: single
menu:
  docs:
    parent: about
    weight: 4
sections_weight: 5
title: Hugo のセキュリティモデル
toc: true
weight: 5
---

## ランタイム セキュリティ {#runtime-security}

Hugo は静的な出力を生成するので、一度ビルドすれば、ランタイムはブラウザ (出力は HTML と仮定) と、統合するサーバー (API) です。

しかし、サイトを開発・構築する場合、ランタイムは `hugo` 実行ファイルです。ランタイムのセキュリティ確保は [本当に大変なこと](https://blog.logrocket.com/how-to-protect-your-node-js-applications-from-malicious-dependencies-5f2e60ea08f9/) です。

**Hugo の主なアプローチは、サンドボックスと厳格なデフォルトを持つセキュリティポリシーです。**

* Hugo は仮想ファイルシステムを持ち、メインプロジェクトのみ (サードパーティーコンポーネントではない) プロジェクトルート外のディレクトリやファイルのマウントが可能です。
* メイン プロジェクトのみがシンボリックリンクをたどることができます。
* ユーザー定義コンポーネントは、ファイルシステムに対して読み取り専用でアクセスできます。
* [Asciidoctor](/content-management/formats/#list-of-content-formats) などをサポートするためにいくつかの外部バイナリにシェルを出していますが、これらのバイナリやそのフラグは事前に定義されており、デフォルトでは無効になっています ([セキュリティポリシー](#security-policy) を参照してください)。任意の外部 OS コマンドを実行する一般的な機能は [議論](https://github.com/gohugoio/hugo/issues/796) されていますが、セキュリティ上の懸念から実装されていません。

## セキュリティポリシー {#security-policy}

Hugo には、[os/exec](https://pkg.go.dev/os/exec) やリモート通信などに対するアクセスを制限するセキュリティポリシーが組み込まれています。

デフォルトの設定は以下のとおりです。セキュリティポリシーの許可リストにない機能を使用したビルドは、何をすべきかについての詳細なメッセージを表示し、失敗します。これらの設定のほとんどは、許可リスト (文字列またはスライス、[正規表現](https://pkg.go.dev/regexp) または何もマッチしない `none`) です。

{{< code-toggle config="security" />}}

Hugo のこれらの設定やその他の設定は、OS 環境によってオーバーライドされる可能性があることに注意してください。もし、リモートからの HTTP によるデータの取得をすべてブロックしたい場合は、以下のようにします。

```txt
HUGO_SECURITY_HTTP_URLS=none hugo
```

## 依存関係のセキュリティ {#dependency-security}

Hugo は依存関係を管理するために [Go モジュール](https://github.com/golang/go/wiki/Modules) を使って静的なバイナリとしてビルドされています。Go モジュールにはいくつかの保護手段があり、その 1 つが `go.sum` ファイルです。これは、推移的依存関係を含む、すべての依存関係の予想される暗号化チェックサムのデータベースです。

[Hugo モジュール](/hugo-modules/) は、Go モジュールの機能の上に構築された機能です。Go モジュールと同様に、Hugo モジュールを使用する Hugo プロジェクトには `go.sum` ファイルがあります。このファイルをバージョン管理システムにコミットすることをお勧めします。[依存関係の改ざん](https://julienrenaux.fr/2019/12/20/github-actions-security-risk/) の兆候となるチェックサムの不一致があると、Hugo のビルドは失敗します。

## Web アプリケーションセキュリティ {#web-application-security}

これらは、[OWASP](https://en.wikipedia.org/wiki/OWASP) で定義されているセキュリティ上の脅威です。

HTML 出力では、以下が中核となるセキュリティモデルです。

<https://golang.org/pkg/html/template/#hdr-Security_Model>

手短に言えば:

テンプレートの作成者 (あなた) は信頼されていますが、あなたが送信したデータはそうではありません。
このため、安全であることがわかっているデータのエスケープを避けるために、`safeHTML` などの _safe_ 関数を使用する必要があります。
ドキュメントに記載されているように、上記には 1 つの例外があります。それは、インラインショートコードを有効にすると、それらのマクロが純粋なテキストとして扱われるため、コンテンツファイル内のショートコードやデータ処理も信頼できると言うことです。
Hugo は静的なサイトジェネレータであり、動的なユーザー入力の概念はないことを付け加えておく必要があるかもしれません。

コンテンツについては、潜在的に安全でないコンテンツを削除またはエスケープするために、デフォルトの Markdown レンダラーが [構成](/getting-started/configuration-markup) されています。コンテンツが信頼できる場合、この動作を再構成できます。

