## ソースからビルドする {#build-from-source}

Hugo をソースからビルドするには、以下のことを行う必要があります。

1. [Git] をインストールする
2. [Go] バージョン 1.18 以降をインストールする
3. [Go ドキュメント][Go documentation] の説明に従って、PATH 環境変数を変更する

> インストール先のディレクトリは、環境変数 GOPATH と GOBIN によって制御されます。 GOBIN が設定されている場合、バイナリはそのディレクトリにインストールされます。 GOPATH が設定されている場合、バイナリは GOPATH リスト内の最初のディレクトリの bin サブディレクトリにインストールされます。 それ以外の場合、デフォルトの GOPATH ($HOME/go または %USERPROFILE%go) の bin サブディレクトリにインストールされます。

そして、以下のコマンドにより、ビルドしてテストします。

```sh
go install -tags extended github.com/gohugoio/hugo@latest
hugo version
```

[Git]: https://git-scm.com/book/en/v2/Getting-Started-Installing-Git
[Go]: https://go.dev/doc/install
[Go documentation]: https://go.dev/doc/code#Command
