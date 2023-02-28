---
categories:
- content management
date: "2018-01-24T13:10:00-05:00"
description: 画像のリサイズ、クロップ (切り抜き)、回転、フィルタリング、および変換を行います。
draft: false
keywords:
- resources
- images
menu:
  docs:
    parent: content-management
    weight: 90
title: 画像処理
toc: true
weight: 90
---
## 画像リソース {#image-resources}

画像を処理するには、ページリソースまたはグローバル リソースとして画像にアクセスする必要があります。

### ページリソース {#page-resources}

ページリソースは、[ページバンドル][page bundle] 内のファイルです。ページバンドルは、 `index.md` または `_index.md` ファイルをルートとするディレクトリです。

```text
content/
└── posts/
    └── post-1/           <-- page bundle
        ├── index.md
        └── sunset.jpg    <-- page resource
```

### グローバル リソース {#global-resources}

グローバル リソースとは、以下のファイルのことです。

- `assets` ディレクトリ内、または
- `assets` ディレクトリに [マウントされた][mounted] 任意のディレクトリ内、または
- `http` または `https` 経由でアクセス可能なリモート サーバー上にある

```text
assets/
└── images/
    └── sunset.jpg    <-- global resource
```

ローカル画像にグローバル リソースとしてアクセスするには、以下のように指定します。

```go-html-template
{{ $image := resources.Get "images/sunset.jpg" }}
```

リモート画像にグローバル リソースとしてアクセスするには、以下のように指定します。

```go-html-template
{{ $image := resources.GetRemote "https://gohugo.io/img/hugo-logo.png" }}
```

## 画像レンダリング {#image-rendering}

ページリソースまたはグローバル リソースとして画像にアクセスしたら、 `Permalink`、`RelPermalink`、`Width`、`Height` プロパティを使用してテンプレートで画像をレンダリングします。

例 1: リソースが見つからない場合、エラーをスローします。

```go-html-template
{{ $image := .Resources.GetMatch "sunset.jpg" }}
<img src="{{ $image.RelPermalink }}" width="{{ $image.Width }}" height="{{ $image.Height }}">
```

例 2: リソースが見つからない場合、画像のレンダリングをスキップします。

```go-html-template
{{ $image := .Resources.GetMatch "sunset.jpg" }}
{{ with $image }}
  <img src="{{ .RelPermalink }}" width="{{ .Width }}" height="{{ .Height }}">
{{ end }}
```

例3: リソースが見つからない場合、画像のレンダリングをスキップする、より簡潔な方法。

```go-html-template
{{ with .Resources.GetMatch "sunset.jpg" }}
  <img src="{{ .RelPermalink }}" width="{{ .Width }}" height="{{ .Height }}">
{{ end }}
```

## 画像処理方法 {#image-processing-methods}

`image` リソースは、[`Resize`]、[`Fit`]、[`Fill`]、[`Crop`]、[`Filter`]、[`Colors`]、[`Exif`] メソッドを実装しています。

{{% note %}}
画像変換時にメタデータ (Exif、IPTC、XMP など) は保存されません。JPEG や TIFF 画像から Exif メタデータを抽出するには、_オリジナル_ 画像に [`Exif`] メソッドを使用します。
{{% /note %}}

### Resize {#resize}

指定された幅および/または高さに画像のサイズを変更します。

幅と高さの両方を指定すると、元の画像の縦横比が同じでない限り、結果の画像は不均衡にスケーリング (拡大縮小) されます。

```go-html-template
{{/* Resize to a width of 600px and preserve aspect ratio */}}
{{ $image := $image.Resize "600x" }}

{{/* Resize to a height of 400px and preserve aspect ratio */}}
{{ $image := $image.Resize "x400" }}

{{/* Resize to a width of 600px and a height of 400px */}}
{{ $image := $image.Resize "600x400" }}
```

### Fit {#fit}

アスペクト比を維持したまま、指定された寸法に合うように画像を縮小します。幅と高さの両方を指定する必要があります。

```go-html-template
{{ $image := $image.Fit "600x400" }}
```

### Fill {#fill}

指定された寸法に合うように画像を切り抜き、サイズを変更します。幅と高さの両方を指定する必要があります。クロップボックスのアンカーポイントを変更するには、[`anchor`] オプションを使用します。

```go-html-template
{{ $image := $image.Fill "600x400" }}
```

### Crop {#crop}

サイズを変更せずに、指定された寸法に合わせて画像をクロップ (切り抜き) します。 幅と高さの両方を指定する必要があります。 [`anchor`] オプションを使用して、クロップボックスのアンカーポイントを変更します。

```go-html-template
{{ $image := $image.Crop "600x400" }}
```

### Filter {#filter}

画像に 1 つ以上の [フィルター][filters] を適用します。

```go-html-template
{{ $image := $image.Filter (images.GaussianBlur 6) (images.Pixelate 8) }}
```

パイプを使用して、より機能的なスタイルで上記を記述してみましょう。 Hugo は指定された順序でフィルターを適用します。

```go-html-template
{{ $image := $image | images.Filter (images.GaussianBlur 6) (images.Pixelate 8) }}
```

フィルターチェーンを一度作成し、再利用すると便利な場合があります。

```go-html-template
{{ $filters := slice  (images.GaussianBlur 6) (images.Pixelate 8) }}
{{ $image1 := $image1.Filter $filters }}
{{ $image2 := $image2.Filter $filters }}
```

### Colors

{{< new-in "0.104.0" >}}

`.Colors` は，単純なヒストグラム法を用いて，画像中の主要な色を表す 16 進文字列のスライスを返します．

```go-html-template
{{ $colors := $image.Colors }}
```

この方法は高速ですが、画像を縮小する場合は、縮小した画像から色を抽出するとパフォーマンスが向上します。


### Exif

画像のメタデータを含む [Exif] オブジェクトを提供します。

JPEG や TIFF の画像に含まれる Exif データにアクセスすることができます。Exif データのない画像を処理する際のエラーを防ぐため、 [`with`] ステートメントでアクセスをラップします。

```go-html-template
{{ with $image.Exif }}
  Date: {{ .Date }}
  Lat/Long: {{ .Lat }}/{{ .Long }}
  Tags:
  {{ range $k, $v := .Tags }}
    TAG: {{ $k }}: {{ $v }}
  {{ end }}
{{ end }}
```

また、Exif フィールドに個別にアクセスし、必要に応じて [`lang.FormatNumber`] 関数を使ってフィールドをフォーマットできます。

```go-html-template
{{ with $image.Exif }}
  <ul>
    {{ with .Date }}<li>Date: {{ .Format "January 02, 2006" }}</li>{{ end }}
    {{ with .Tags.ApertureValue }}<li>Aperture: {{ lang.FormatNumber 2 . }}</li>{{ end }}
    {{ with .Tags.BrightnessValue }}<li>Brightness: {{ lang.FormatNumber 2 . }}</li>{{ end }}
    {{ with .Tags.ExposureTime }}<li>Exposure Time: {{ . }}</li>{{ end }}
    {{ with .Tags.FNumber }}<li>F Number: {{ . }}</li>{{ end }}
    {{ with .Tags.FocalLength }}<li>Focal Length: {{ . }}</li>{{ end }}
    {{ with .Tags.ISOSpeedRatings }}<li>ISO Speed Ratings: {{ . }}</li>{{ end }}
    {{ with .Tags.LensModel }}<li>Lens Model: {{ . }}</li>{{ end }}
  </ul>
{{ end }}
```

#### Exif 変数 {#exif-variables}

.Date
: 画像の作成日時です。[time.Format] 関数でフォーマットします。

.Lat
: GPS の緯度 (度) です。

.Long
: GPS の経度 (度) です。

.Tags
: この画像で使用可能な Exif タグのコレクションです。 [サイト設定](#exif-data) で、このコレクションから特定のタグを含めたり除外したりできます。

## 画像処理オプション {#image-processing-options}

[`Resize`]、[`Fit`]、[`Fill`]、[`Crop`] メソッドには、スペースで区切られた、大文字と小文字を区別しないオプションのリストを指定できます。リスト内のオプションの順序は関係ありません。

### 寸法 {#dimensions}

[`Resize`] メソッドでは、幅、高さ、またはその両方を指定する必要があります。 [`Fit`]、[`Fill`]、[`Crop`] メソッドでは、幅と高さの両方を指定する必要があります。すべての寸法はピクセル単位です。

```go-html-template
{{ $image := $image.Resize "600x" }}
{{ $image := $image.Resize "x400" }}
{{ $image := $image.Resize "600x400" }}
{{ $image := $image.Fit "600x400" }}
{{ $image := $image.Fill "600x400" }}
{{ $image := $image.Crop "600x400" }}
```

### 回転 {#rotation}

指定された角度だけ反時計回りに画像を回転させます。 Hugo は、スケーリング (拡大縮小) _の前に_ 回転を実行します。 たとえば、元の画像が 600x400 で、画像を 50% 拡大しながら反時計回りに 90 度回転させたい場合は、以下のように指定します。

```go-html-template
{{ $image = $image.Resize "200x r90" }}
```

上記の例では、幅は回転 _後_ の幅を表しています。

スケーリング (拡大縮小) せずに画像を回転するには、以下のように元の画像の寸法を使用します。

```go-html-template
{{ with .Resources.GetMatch "sunset.jpg" }}
  {{ with .Resize (printf "%dx%d r90" .Height .Width) }}
    <img src="{{ .RelPermalink }}" width="{{ .Width }}" height="{{ .Height }}">
  {{ end }}
{{ end }}
```

上記の例では、2 行目で、幅と高さを逆にして、回転 _後_ の希望の寸法を反映しています。

### アンカー {#anchor}

[`Crop`] または [`Fill`] メソッドを使用する場合、_アンカー_ がクロップボックスの配置を決定します。 `TopLeft`、`Top`、`TopRight`、`Left`、`Center`、`Right`、`BottomLeft`、`Bottom`、`BottomRight` または `Smart` を指定できます。

デフォルト値は `Smart` で、[Smartcrop] 画像解析によりクロップボックスの最適な配置を決定します。 [サイト設定][site configuration] でデフォルト値をオーバーライドすることができます。

たとえば、400×200 の画像で左上に鳥がいる場合、以下の指定で、鳥を含む 200×100 のサムネイルを作成することができます。

```go-html-template
{{ $image.Crop "200x100 TopLeft" }}
```

[`Crop`] または [`Fill`] メソッドを使用する際に [回転](#rotation) を適用する場合、回転した画像からの相対的なアンカーを指定します。

### ターゲット フォーマット {#target-format}

デフォルトでは、Hugo は画像をソース形式でエンコードします。 `bmp`、`gif`、`jpeg`、`jpg`、`png`、`tif` または `webp` を指定すると、画像を別の形式に変換できます。

```go-html-template
{{ $image.Resize "600x webp" }}
```

スケーリング (拡大縮小) せずに画像を変換するには、以下のように、元の画像の寸法を使用します。

```go-html-template
{{ with .Resources.GetMatch "sunset.jpg" }}
  {{ with .Resize (printf "%dx%d webp" .Width .Height) }}
    <img src="{{ .RelPermalink }}" width="{{ .Width }}" height="{{ .Height }}">
  {{ end }}
{{ end }}
```

### 品質 {#quality}

JPEG と WebP 画像に適用され、`q` 値は変換された画像の品質を決定します。 値を大きくすると画像の品質が向上し、値を小さくするとファイルが小さくなります。 この値を 1 から 100 までの整数に設定します。

デフォルト値は 75 です。 [サイト設定][site configuration] でデフォルト値をオーバーライドできます。

```go-html-template
{{ $image.Resize "600x webp q50" }}
```

### ヒント {#hint}

<!-- Specifies a libwebp preset, not a libwebp image hint. -->

WebP 画像に適用できるこのオプションは、定義済みのエンコード パラメータのセットに対応します。

値 | 例
:--|:--
`drawing` | コントラストの高いディテールの手描きまたは線画
`icon` | 小さなカラフルな画像
`photo` | 自然光を取り入れた屋外撮影
`picture` | ポートレートなどの室内写真
`text` | テキストを主体とした画像

デフォルト値は `photo` です。 [サイト設定][site configuration] でデフォルト値をオーバーライドできます。

```go-html-template
{{ $image.Resize "600x webp picture" }}
```

### 背景色 {#background-color}

透明度をサポートする形式 (PNG など) から透明度をサポート _しない_ 形式 (JPEG など) に画像を変換する場合、結果の画像の背景色を指定できます。

3桁または 6桁の 16進数のカラーコード (たとえば、`#00f`、`#0000ff`) を使用します。

デフォルト値は `#ffffff` (白) です。 [サイト設定][site configuration] でデフォルト値をオーバーライドできます。

```go-html-template
{{ $image.Resize "600x jpg #b31280" }}
```

### リサンプリング フィルター {#Resampling-filter}

画像のサイズ変更時に使用するリサンプリング フィルターを指定できます。 一般的に使用されるリサンプリング フィルターには、以下のものがあります。

フィルター | 説明
:--|:--
`Box` | ダウンスケーリングに適したシンプルで高速な平均化フィルター
`Lanczos` | 写真画像をシャープに再現する高画質リサンプリング フィルター
`CatmullRom` | 同様の結果を提供しながら、Lanczos フィルターより高速なシャープ キュービック フィルター
`MitchellNetravali` | CatmullRom よりもリンギング アーティファクトが少なく、よりスムーズな結果を生成するキュービック フィルター
`Linear` | バイリニア リサンプリング フィルター、キュービック フィルターよりも高速で滑らかな出力を生成します
`NearestNeighbor` | 最速のリサンプリング フィルターで、アンチエイリアシングなし

デフォルト値は `Box` です。 [サイト設定][site configuration] でデフォルト値をオーバーライドできます。

```go-html-template
{{ $image.Resize "600x400 Lanczos" }}
```

リサンプリング フィルターの完全なリストは、[github.com/disintegration/imaging] を参照してください。パフォーマンスを犠牲にしてでも画質を向上させたい場合は、代替フィルターを試してみてください。

## 画像処理の例 {#image-processing-examples}

_以下の例で使用されている夕日の写真は、著作権 [Bjørn Erik Pedersen](https://commons.wikimedia.org/wiki/User:Bep) (クリエイティブ コモンズ 表示-継承 4.0 国際ライセンス - CC BY-SA 4.0) です_。

{{< imgproc sunset Resize "300x" />}}

{{< imgproc sunset Fill "90x120 left" />}}

{{< imgproc sunset Fill "90x120 right" />}}

{{< imgproc sunset Fit "90x90" />}}

{{< imgproc sunset Crop "250x250 center" />}}

{{< imgproc sunset Resize "300x q10" />}}

以下は、上記の例を生成するために使用されるショートコードです。

{{< code file="layouts/shortcodes/imgproc.html" >}}
{{< readfile file="layouts/shortcodes/imgproc.html" >}}
{{< /code >}}

以下のように、Markdown からショートコードを呼び出します。

```go-html-template
{{</* imgproc sunset Resize "300x" /*/>}}
```

{{% note %}}
上記の セルフクロージング ショートコードの構文に注意してください。 `imgproc` ショートコードは、**内部コンテンツ** があってもなくても呼び出すことができます。
{{% /note %}}

## 画像設定 {#imaging-configuration}

### 処理オプション {#processing-options}

デフォルトの [画像処理オプション](#image-processing-options) を設定するには、サイト設定で `imaging` セクションを定義します。

{{< code-toggle file="config" copy=true >}}
[imaging]
resampleFilter = "Box"
quality = 75
hint = "photo"
anchor = "Smart"
bgColor = "#ffffff"
{{< /code-toggle >}}

anchor
: 画像処理オプションの [アンカー](#anchor) を参照してください

bgColor
: 画像処理オプションの [背景色](#background-color) を参照してください

hint
: 画像処理オプションの [ヒント](#hint) を参照してください

quality
: 画像処理オプションの [品質](#quality) を参照してください

resampleFilter
: 画像処理オプションの [リサンプリング フィルター](#resampling-filter) を参照してください

### Exif データ {#exif-data}

サイト設定に `imaging.exif` セクションを定義して、Exif データの利用可能性を制御します。

{{< code-toggle file="config" copy=true >}}
[imaging.exif]
includeFields = ""
excludeFields = ""
disableDate = false
disableLatLong = false
{{< /code-toggle >}}

disableDate
: Hugo は画像の作成日時を `.Date` に抽出します。無効にするには、これを `true` に設定します。デフォルトは `false` です。

disableLatLong
: Hugo は GPS の緯度と経度を `.Lat` と `.Long` に抽出します。 無効にするには、これを `true` に設定します。デフォルトは `false` です。

excludeFields
: `.Tags` コレクションから除外する Exif タグに一致する正規表現です。 デフォルトは &nbsp;`""` です。

includeFields
: `.Tags` コレクションに含める Exif タグに一致する正規表現です。 デフォルトは &nbsp;`""` です。 使用可能なすべてのタグを含めるには、この値を &nbsp;`".*"` に設定します。

{{% note %}}
パフォーマンスを向上させ、キャッシュサイズを小さくするために、 `excludeFields` と `includeFields` のどちらも設定しない場合、Hugo は以下のタグを除外します。
`ColorSpace`、`Contrast`、`Exif`、`Exposure[M|P|B]`、`Flash`、`GPS`、`JPEG`、`Metering`、`Resolution`、`Saturation`、`Sensing`、`Sharp` および `WhiteBalance` 。
{{% /note %}}

## 画像のスマートクロップ {#smart-cropping-of-images}

デフォルトでは、Hugo は `Crop` または `Fill` メソッドで画像をクロップ (切り抜き) するときに [Smartcrop] ライブラリを使用します。アンカーポイントを手動で設定することもできますが、ほとんどの場合、 `Smart` オプションが適しています。

上図の夕焼け画像を使用した例:

{{< imgproc sunset Fill "200x200 smart" />}}

{{< imgproc sunset Crop "200x200 smart" />}}

## 画像処理性能に関する考慮事項 {#image-processing-performance-consideration}

Hugo は処理した画像を `resources` ディレクトリにキャッシュします。このディレクトリをソース管理に含めると、CI/CD ワークフロー (GitHub Pages、GitLab Pages、Netlify など) で Hugo が画像を再生成する必要がなくなります。その結果、ビルドが高速化されます。

画像処理の方法やオプションを変更したり、画像の名前を変更したり削除したりすると、 `resources` ディレクトリに未使用の画像が残ります。未使用の画像を削除するには、以下のようにしてガベージコレクションを実行します。

```bash
hugo --gc
```

[`anchor`]: {{< relref "content-management/image-processing#anchor" >}}
[`lang.FormatNumber`]: {{< relref "functions/lang#langformatnumber" >}}
[Exif]: <https://en.wikipedia.org/wiki/Exif>
[filters]: {{< relref "functions/images" >}}
[github.com/disintegration/imaging]: <https://github.com/disintegration/imaging#image-resizing>
[mounted]: {{< relref "hugo-modules/configuration#module-config-mounts">}}
[page bundle]: {{< relref "content-management/page-bundles" >}}
[Smartcrop]: <https://github.com/muesli/smartcrop#smartcrop>
[time.Format]: {{< relref "functions/dateformat" >}}
[`Colors`]: #colors
[`Crop`]: #crop
[`Exif`]: #exif
[`Fill`]: #fill
[`Filter`]: #filter
[`Fit`]: #fit
[`Resize`]: #resize
[site configuration]: #processing-options
[`with`]: /functions/with/
