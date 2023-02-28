---
authors:
- digitalcraftsman
categories:
- contribute
date: "2017-02-01"
description: Hugo は、オープンソース コミュニティからの貢献に大きく依存しています。
draft: false
keywords:
- dev
- open source
linktitle: 開発
menu:
  docs:
    parent: contribute
    weight: 10
publishdate: "2017-02-01"
sections_weight: 10
title: Hugo の開発に貢献する
toc: true
weight: 10
---

## はじめに {#introduction}

Hugo はオープンソース プロジェクトであり、その [貢献者][contributors] の仕事によって生きています。 [未解決の問題][issues] がたくさんあり、 Hugo をさらに素晴らしいものにするために、あなたの協力が必要です。 プロジェクトの開発に貢献するために、 Go の達人である必要はありません。

## 前提条件 {#assumptions}

この貢献ガイドは、初心者の方のお役に立てればと思い、ステップ バイ ステップで進めています。そのため、以下のことのみを想定しています。

* Git またはオープンソース プロジェクト全般が初めての方
* Hugo のファンで、プロジェクトに貢献することに熱心な方

{{% note "Additional Questions?" %}}
この貢献ガイドのどこかで苦労している場合は、[Hugo のディスカッション フォーラム](https://discourse.gohugo.io) で Hugo コミュニティに連絡してください。
{{% /note %}}

## Go をインストールする {#install-go}

Go のインストールには数分しかかかりません。 マシンで Go を起動して実行するには、複数のオプションがあります。

Go のインストール ガイドに従うのに問題がある場合は、[すべてのプラットフォームのセットアップを含む Go ブートキャンプ][gobootcamp] を確認するか、[Hugo ディスカッション フォーラム][forums] の Hugo コミュニティに連絡してください。

### ソースから Go をインストールする {#install-go-from-source}

[最新の安定版 Go をダウンロード][godl] し、公式の [Go インストールガイド][goinstall] に従ってください。

Go のインストールが完了したら、すべてが正しく動作していることを確認しましょう。ターミナル (Windows の場合は、コマンドライン) を開き、以下のように入力します。

```bash
go version
```

以下のような内容がコンソールに表示されるはずです。 ここでのバージョンは、このページの最終更新時点での Go の最新版を反映していることに注意してください。

```bash
go version go1.12 darwin/amd64
```

次に、`GOPATH` を [インストールガイドの説明に従って][setupgopath] 設定したことを確認します。

`GOPATH` は `echo $GOPATH` で表示することができます。 空ではない文字列が表示され、たとえば以下のような、Go のワークスペースへの有効なパスが含まれているはずです。

```bash
/Users/<yourusername>/Code/go
```

### Homebrew で Go をインストールする {#install-go-with-homebrew}

macOS ユーザーで、マシンに [Homebrew](https://brew.sh/) がインストールされている場合、Go のインストールは以下のコマンドで簡単にできます。

{{< code file="install-go.sh" >}}
brew install go
{{< /code >}}

### GVM 経由で Go をインストールする {#install-go-via-gvm}

より経験豊富なユーザーは、[Go Version Manager][gvm] (GVM) を使用できます。 GVM を使うと、*同じマシン* で異なる Go のバージョンを切り替えることができます。 初心者の場合は、おそらくこの機能は必要ないでしょう。 ただし、GVM を使えば、いくつかのコマンドを実行するだけで、新しくリリースされた Go のバージョンに簡単にアップグレードできます。

GVM は、Hugo の開発を長期間追跡している場合に特に役立ちます。 Hugo の将来のバージョンは通常、最新版の Go でコンパイルされます。 遅かれ早かれ、最新の状態に保ちたい場合はアップグレードする必要があります。

## GitHub アカウントを作成する {#create-a-github-account}

コードを投稿する場合は、GitHub にアカウントが必要です。 [www.github.com/join](https://github.com/join) にアクセスし、個人アカウントを設定します。

## システムに Git をインストールする {#install-git-on-your-system}

Hugo の開発に貢献するには、コンピューターに Git がインストールされている必要があります。 Git を教えることは Hugo ドキュメントの範囲外ですが、Git の基本を学ぶための優れた参考文献を探している場合、どこから始めればよいかわからないなら、[Git book][gitbook] をお勧めします。 このドキュメントには、Git コマンドの簡単な説明が含まれています。

Git は、ソースコードの変更を追跡するための [バージョン管理システム](https://ja.wikipedia.org/wiki/%E3%83%90%E3%83%BC%E3%82%B8%E3%83%A7%E3%83%B3%E7%AE%A1%E7%90%86%E3%82%B7%E3%82%B9%E3%83%86%E3%83%A0) です。 Hugo は、機能を拡張するために使用される小さなサードパーティ パッケージに依存しています。 私たちは車輪の再発明をしたくないので、それらを使っています。

Go には `get` というサブコマンドが同梱されており、作業環境を構築する際にこれらのパッケージをダウンロードしてくれます。パッケージのソースコードは Git で管理されています。 `get` はパッケージのホストの Git サーバーとやりとりして、依存するパッケージをすべて取得します。

ターミナルに戻り、Git がすでにインストールされているかどうかを確認します。 `git version` と入力して Enter キーを押します。コマンドがバージョン番号を返した場合は、このセクションの残りをスキップすることができます。 そうでない場合は、Git の最新版を [dさうんろーど](https://git-scm.com/downloads) して、この [インストール ガイド](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git) に従ってください。

最後に、Git が正常にインストールされているかどうか、`git version` で再度確認します。

### Git グラフィカル フロントエンド {#git-graphical-front-ends}

Git を操作するための [GUI クライアント](https://git-scm.com/downloads/guis) がいくつか存在します。 すべてのクライアントがすべての OS で利用できるわけではありませんし、もしかしたら使い方が異なるかもしれません。このため、コマンドはどこでも同じなので、コマンドラインの使用方法を文書化します。

### システムに Hub をインストールする (オプション) {#install-hub-on-your-system-optional}

Hub は、GitHub と連携するための優れたツールです。そのメインサイトは、 [hub.github.com](https://hub.github.com/) です。 この小さな Git ラッパーを自由にインストールしてください。

Mac では、以下のように、[Homebrew](https://brew.sh) を使用して [Hub](https://github.com/github/hub) をインストールできます。

```bash
brew install hub
```

以下のコマンドを実行し、[Bash のエイリアス](https://tldp.org/LDP/abs/html/aliases.html) を作成して、`git` と入力すると実際に `Hub` が実行されるようにします。

```bash
echo "alias git='hub'" >> ~/.bash_profile
```

以下のコマンドを実行して、インストールを確認します。

```bash
git version 2.21.0
hub version 2.10.0
```

## 作業用コピーを設定する {#set-up-your-working-copy}

リポジトリの作業用コピーをコンピューター上のローカルに設定します。 ファイルのローカルコピーは、編集してコンパイルし、最終的に GitHub にプッシュすることになります。 主な手順は、リポジトリのクローンを作成し、フォークをリモートとして作成することです。

### リポジトリをクローンする {#clone-the-repository}

`GOPATH` が設定されていることを前提としています (不明な点がある場合は、上記のセクションを参照してください)。 次に、Hugo リポジトリをコンピューターにコピーする必要があります。 これは「リポジトリのクローン」と呼ばれます。 GitHub の [ヘルプページ](https://help.github.com/articles/cloning-a-repository/) に、簡単な説明があります。

> GitHub でリポジトリを作成すると、リモートリポジトリとして存在します。 コンピューターにリポジトリのローカル クローンを作成し、2 つの場所の間で同期することができます。

Hugo の [master リポジトリ](https://github.com/gohugoio/hugo) をクローンすることにします。コミット権がないので、直感に反するように思えます。しかし、Go のワークフローでは必要なことなのです。 master のコピーで作業し、その変更を GitHub の自分のリポジトリにプッシュします。

そこで、以下のコマンドを実行することにより、新しいディレクトリを作って、その master リポジトリをクローンしてみましょう。

```bash
mkdir $HOME/src
cd $HOME/src
git clone https://github.com/gohugoio/hugo.git
```

> Hugo 0.48 以降、Hugo は Go 1.11 に組み込まれている Go モジュールのサポートを使用してビルドします。
> 最も簡単な方法は、GOPATH 以外のディレクトリに Hugo をクローンすることです。

そして、クローンしたディレクトリで以下のコマンドを実行し、Hugo の依存関係をインストールします。

```bash
cd $HOME/src/hugo
go install
```

Hugo は、いくつかの便利なビルドとテストのターゲットを [mage](https://github.com/magefile/mage) に依存しています。もしまだ持っていないなら、以下のコマンドを実行して入手してください。

```bash
go install github.com/magefile/mage@latest
```

### リポジトリをフォークする {#fork-the-repository}

この用語に慣れていない場合は、GitHub の [ヘルプページ](https://help.github.com/articles/fork-a-repo/) に以下のような簡単な説明があります。

> フォークとは、リポジトリのコピーのことです。リポジトリをフォークすることで、元のプロジェクトに影響を与えることなく、自由に変更を試すことができます。

#### 手動でフォークする {#fork-by-hand}

GitHub の [Hugo リポジトリ](https://github.com/gohugoio/hugo) を開き、右上の [Fork] ボタンをクリックします。

![Fork button](/images/contribute/development/forking-a-repository.png)

ここで、GitHub 上でフォーク リポジトリを開き、フォークのリモート URL をコピーします。以下の操作では Git が使用するプロトコルとして、HTTPS と SSH のいずれかを選択することができます。 [よくわからない場合](https://help.github.com/articles/which-remote-url-should-i-use/)、HTTPS は常に動作します (そこで、HTTPS を選択します)。

![Copy remote url](/images/contribute/development/copy-remote-url.png)

ターミナルに戻り、最後の手順で複製した master リポジトリのディレクトリに移動します。

```bash
cd $HOME/src/hugo
```

Git は、以下のコマンドにより、コピーしたリモート URL を追加して、フォークが存在することを認識する必要があります。

```bash
git remote add <YOUR-GITHUB-USERNAME> <COPIED REMOTE-URL>
```

#### Hub を使用してフォークする {#fork-with-hub}

あるいは、Git ラッパーである Hub を使うこともできます。 Hub を使うと、以下のように、リポジトリのフォークが簡単にできます。

```bash
git fork
```

上記のコマンドは、GitHub に自分のアカウントでログインし、現在作業しているリポジトリのフォークを作成し、それをリモートとして作業コピーに追加します。

#### 信頼するが確認する {#trust-but-verify}

以下のコマンドを実行し、既知のすべてのリモートをリストして、すべてがうまくいったかどうかを確認しましょう。

```bash
git remote -v
```

出力は、以下のようになります。

```bash
digitalcraftsman    git@github.com:digitalcraftsman/hugo.git (fetch)
digitalcraftsman    git@github.com:digitalcraftsman/hugo.git (push)
origin  https://github.com/gohugoio/hugo (fetch)
origin  https://github.com/gohugoio/hugo (push)
```

## Hugo の Git 貢献ワークフロー {#the-hugo-git-contribution-workflow}

### 新しいブランチを作成する {#create-a-new-branch}

決して "master" ブランチに対して開発してはいけません。開発チームはそのブランチに対するプルリクエストを受け付けないでしょう。その代わり、説明的な名前のブランチを作成し、そのブランチで作業してください。

まず、以下のコマンドを実行し、常に master リポジトリから最新の変更をプルする必要があります。

```bash
git checkout master
git pull
```

これで、以下のコマンドにより、追加用の新しいブランチを作成できます。

```bash
git checkout -b <BRANCH-NAME>
```

自分がどのブランチにいるのかは、 `git branch` で確認できます。 すべてのローカル ブランチのリストが表示されるはずです。現在のブランチには、小さなアスタリスクで示されます。

### ドキュメントに貢献する {#contribute-to-documentation}

おそらく、Hugo のドキュメントに貢献し始めたいと思うでしょう。もしそうなら、以下のステップのほとんどを無視して、新しくクローンしたリポジトリ内の `/docs` ディレクトリに集中できます。 `cd docs` を使用して、ディレクトリを Hugo ドキュメントに変更できます。

Hugo の組み込みサーバは、 `hugo server` で起動できます。 ブラウザのアドレスバーに [http://localhost:1313](http://localhost:1313) と入力して、ドキュメントを参照します。 サーバーは、コンテンツを変更するたびにページを自動的に更新します。

あなたのような人々の寛大さによって Hugo ドキュメントがどのように構築、整理、改善されているかについての詳細は、[個別の Hugo ドキュメント貢献ガイド][docscontrib] を作成しました。

### Hugo をビルドする {#build-hugo}

コードベースに変更を加えている間は、以下のコマンドにより、バイナリをビルドしてテストすることをお勧めします。

```bash
mage hugo
```

上記のコマンドは、リポジトリのルートにバイナリ ファイルを生成します。

バイナリを `$GOPATH/bin` にインストールする場合は、以下を実行します。

```bash
mage install
```

### テスト {#test}

コードベースへの変更が意図しない副作用を引き起こすことがあります。あるいは、期待通りに動作しないこともあります。ほとんどの関数は、独自のテストケースを持っています。テストケースは、 `_test.go` で終わるファイルにあります。

以下のようにして、コマンドを確認します。

```bash
mage -v check
```

テストをパスします。

### 書式設定 {#formatting}

Go コード スタイルガイドは独断的かもしれませんが、誰がコードを書いたかに関係なく、コードベースが同じように見えることを保証します。 Go には、独自の書式設定ツールが付属しています。 以下のコマンドにより、スタイルガイドを追加で適用してみましょう:

```bash
mage fmt
```

追加を行ったら、変更をコミットします。 [コード貢献ガイドライン](https://github.com/gohugoio/hugo/blob/master/CONTRIBUTING.md) に従っていることを確認してください。

```bash
# 変更されたすべてのファイルを追加します
git add --all
git commit --message "YOUR COMMIT MESSAGE"
```

コミットメッセージは、コミットがどのように行われるかではなく、コミットが何を行うか (機能 XYZ の追加など) を説明する必要があります。

### コミットを修正する {#modify-commits}

コミットメッセージがコード貢献ガイドラインを満たしていないことに気づいたり、いくつかのファイルを追加することを忘れてしまったりしていませんか? 問題ありません。Git は、そのような問題を修正するために必要なツールを提供します。 以下の 2 つの方法は、よくあるケースをすべてカバーします。

あるコマンドが何をするものなのかわからない場合は、そのままコミットしてください。後でプルリクエストの中で、あなたのコミットを修正できます。

#### 最後のコミットを修正する {#modify-the-last-commit}

たとえば、最後のコミットメッセージを変更したいとします。 以下のコマンドを実行し、現在のメッセージを置き換えます。

```bash
git commit --amend -m"YOUR NEW COMMIT MESSAGE"
```

以下のコマンドにより、コミットログを見て、変更を確認します。

```bash
git log
# q で終了します
```

最後のコミットを行った後、何かを忘れてしまった可能性があります。 この場合、新しいコミットを作成する必要はありません。以下のコマンドにより、最新の変更点を追加し、目的のコミットにマージするだけです。

```bash
git add --all
git commit --amend
```

#### 複数のコミットを修正する {#modify-multiple-commits}

{{% warning "Be Careful Modifying Multiple Commits"%}}
このセクションで説明するような変更は、意図しない重大な結果を招くことがあります。よくわからない場合は、このセクションをスキップしてください。
{{% /warning %}}

これはもう少し高度です。 Git では、対話的に [リベース](https://git-scm.com/docs/git-rebase) コミットできます。 つまり、コミット履歴を書き換えることができます。

```bash
git rebase --interactive @~6
```

コマンドの最後にある `6` は、変更すべきコミットの数を表します。エディターが開き、直近の 6 つのコミットメッセージのリストが表示されるはずです。

```bash
pick 80d02a1 tpl: Add hasPrefix to the template funcs' "smoke test"
pick aaee038 tpl: Sort the smoke tests
pick f0dbf2c tpl: Add the other test case for hasPrefix
pick 911c35b Add "How to contribute to Hugo" tutorial
pick 33c8973 Begin workflow
pick 3502f2e Refactoring and typo fixes
```

上の例では、このチュートリアルのコミットのうち、最後の 2 つのコミット  (`Add "How to contribute to Hugo" tutorial`) をマージします。 コミットを "squash" できます、つまり 2 つ以上のコミットを 1 つにマージできます。

すべての操作はコミットメッセージの前に書き込まれます。 "pick" を操作に置き換えてください。この場合、`squash`、または、略して `s` になります。

```bash
pick 80d02a1 tpl: Add hasPrefix to the template funcs' "smoke test"
pick aaee038 tpl: Sort the smoke tests
pick f0dbf2c tpl: Add the other test case for hasPrefix
pick 911c35b Add "How to contribute to Hugo" tutorial
squash 33c8973 Begin workflow
squash 3502f2e Refactoring and typo fixes
```

また、最後から 3 番目のコミットのコミットメッセージを書き換えたいと考えています。 コード貢献ガイドラインによると、プレフィックスとして "docs:" を忘れています。 コミットを書き換える操作は `reword` (または、ショートカットとして `r`) と呼ばれます。

最終的には、以下と同じような設定になるはずです。

```bash
pick 80d02a1 tpl: Add hasPrefix to the template funcs' "smoke test"
pick aaee038 tpl: Sort the smoke tests
pick f0dbf2c tpl: Add the other test case for hasPrefix
reword 911c35b Add "How to contribute to Hugo" tutorial
squash 33c8973 Begin workflow
squash 3502f2e Refactoring and typo fixes
```

エディターを閉じます。 新しいタブで再び開く必要があります。 テキストは、マージする必要がある (別名 "squashed") 最後の 2 つのコミットに対して、新しいコミットメッセージを定義するように指示しています。 <kbd>CTRL</kbd>+<kbd>S</kbd> でファイルを保存し、エディターを再度閉じます。

最後に新しいタブが開きます。 新しいコミットメッセージを入力し、再度保存してください。ターミナルにはステータス メッセージが表示されるはずです。うまくいけば、以下が表示されます。

```bash
Successfully rebased and updated refs/heads/<BRANCHNAME>.
```

コミットログをチェックして、すべてが期待通りになっていることを確認してください。 エラーが発生した場合は、`git rebase --abort` でこのリベースを中断できます。

### コミットをプッシュする {#push-commits}

GitHub 上のフォークにコミットをプッシュするには、プッシュ先を指定する必要があります。プッシュ先は、リモートとブランチ名で定義します。 先ほど、フォークのリモート URL が GitHub のハンドル名 (私の場合は、 `digitalcraftsman`) と同じであることを定義しました。 ブランチは、ローカルのものと同じでなければなりません。 これにより、対応するブランチを簡単に識別できます。

```bash
git push --set-upstream <YOUR-GITHUB-USERNAME> <BRANCHNAME>
```

これで、Git は宛先を認識しました。 次にコミットをプッシュするときは、 `git push` と入力するだけです。

最後のステップでコミット履歴を変更した場合、GitHub はプッシュの試行を拒否します。 これは、コミット履歴が同じでないために、新しいコミットを通常通り追加できないことによる安全機能です。 このプッシュを明示的に強制するには、`git push --force` と指定します。

## プルリクエストをオープンする {#open-a-pull-request}

たくさん前進しましたね。よくできました。 このステップでは、いよいよ追加した内容を提出するためにプルリクエストをオープンします。ブラウザで、GitHub の [Hugo master リポジトリ](https://github.com/gohugoio/hugo/) を開きます。

"New pull request" (新しいプルリクエスト) と書かれた緑色のボタンが見つかるはずです。しかし、GitHub は賢いので、おそらく下のベージュ色のボックスのようなプルリクエストを提案してくるでしょう。

![Open a pull request](/images/contribute/development/open-pull-request.png)

新しいページでは、あなたのプルリクエストの最も重要な情報が要約されています。下にスクロールしていくと、すべてのコミットが追加されていることがわかります。すべてが期待通りに表示されていることを確認し、"Create pull request" (プルリクエストを作成する) をクリックします。.

### 貢献者ライセンス同意書に同意する {#accept-the-contributor-license-agreement}

最後になりましたが、貢献者ライセンス同意書 (CLA) に同意する必要があります。 新しいコメントがプルリクエストに自動的に追加されます。 黄色のバッジをクリックし、契約に同意して、GitHub アカウントで自分自身を認証します。 数回クリックするだけで、一度だけ実行する必要があります。

![Accept the CLA](/images/contribute/development/accept-cla.png)

### 自動ビルド {#automatic-builds}

GitHub Actions ワークフローを使用して、ビルドとテストを行います。これは、OS (macOS、Windows、Ubuntu) と Go のバージョンの組み合わせにまたがるマトリックス ビルドです。ワークフローは、プルリクエストを提出することでトリガーされます。 初めて貢献する場合、ワークフローはプロジェクト メンテナーの承認が必要です。

## 何から始めるか? {#where-to-start}

この貢献ガイドをお読みいただき、ありがとうございました。 またすぐに GitHub でお会いできることを願っています。 あなたが貢献できる [未解決の問題][issues] がたくさんあります。

バグを発見した場合や、Hugo を改善するための新しいアイデアをお持ちの場合は、お気軽に [issue をオープンする][newissue] をご利用ください。ご連絡をお待ちしております。

## Git と Go を学ぶための追加リファレンス {#additional-references-for-learning-git-and-go}

* [Codecademy の "Learn Git" 無料コース][codecademy] (無料)
* [Code School と GitHub の "Try Git" チュートリアル][trygit] (無料)
* [The Git Book][gitbook] (無料)
* [Go ブートキャンプ][gobootcamp]

[codecademy]: https://www.codecademy.com/learn/learn-git
[contributors]: https://github.com/gohugoio/hugo/graphs/contributors
[docscontrib]: /contribute/documentation/
[forums]: https://discourse.gohugo.io
[gitbook]: https://git-scm.com/
[gobootcamp]: https://www.golangbootcamp.com/book/get_setup
[godl]: https://go.dev/dl/
[goinstall]: https://go.dev/doc/install
[gvm]: https://github.com/moovweb/gvm
[issues]: https://github.com/gohugoio/hugo/issues
[newissue]: https://github.com/gohugoio/hugo/issues/new
[releases]: /getting-started/
[setupgopath]: https://go.dev/doc/code#Workspaces
[trygit]: https://try.github.io/levels/1/challenges/1
