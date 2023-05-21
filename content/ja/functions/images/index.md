---
aliases:
- /functions/imageconfig/
categories:
- functions
date: "2017-02-01"
description: images 名前空間は、フィルターおよびその他の画像関連関数のリストを提供します。
draft: false
keywords:
- images
menu:
  docs:
    parent: functions
title: 画像フィルター
toc: true
---

これらのフィルターを画像に適用する方法については、[images.Filter](#filter) を参照してください。

## Overlay

{{< new-in "0.80.0" >}}

{{% funcsig %}}
images.Overlay SRC X Y
{{% /funcsig %}}

Overlay は、元画像を x y の位置でオーバーレイするフィルタを作成します。たとえば、以下のとおりです。


```go-html-template
{{ $logoFilter := (images.Overlay $logo 50 50 ) }}
{{ $img := $img | images.Filter $logoFilter }}
```

フィルターを 1 回だけ適用する必要がある場合は、上記の短縮版の以下を使用します。

```go-html-template
{{ $img := $img.Filter (images.Overlay $logo 50 50 )}}
```

上記は、`$img` の左上隅 (`x=50, y=50` の位置) に `$logo` をオーバーレイ表示します。

## Text

{{< new-in "0.90.0" >}}

`Text` フィルターを使用すると、画像にテキストを追加できます。

{{% funcsig %}}
images.Text TEXT DICT)
{{% /funcsig %}}

以下の例では、指定した色、サイズ、位置の画像に、テキスト `Hugo rocks!` を追加します。

```go-html-template
{{ $img := resources.Get "/images/background.png"}}
{{ $img = $img.Filter (images.Text "Hugo rocks!" (dict
    "color" "#ffffff"
    "size" 60
    "linespacing" 2
    "x" 10
    "y" 20
))}}
```

必要に応じて、カスタムフォントをロードすることができます。 フォントを Hugo の `Resource` としてロードし、オプションとして設定します。

```go-html-template

{{ $font := resources.Get "https://github.com/google/fonts/raw/main/apache/roboto/static/Roboto-Black.ttf" }}
{{ $img := resources.Get "/images/background.png"}}
{{ $img = $img.Filter (images.Text "Hugo rocks!" (dict
    "font" $font
))}}
```


## Brightness

{{% funcsig %}}
images.Brightness PERCENTAGE
{{% /funcsig %}}

Brightness は、画像の明るさを変更するフィルターを作成します。
パーセント パラメーターは範囲内 (-100、100) である必要があります。

### ColorBalance

{{% funcsig %}}
images.ColorBalance PERCENTAGERED PERCENTAGEGREEN PERCENTAGEBLUE
{{% /funcsig %}}

ColorBalance は、画像のカラー バランスを変更するフィルターを作成します。
各カラー チャネル (赤、緑、青) のパーセント パラメーターは、範囲 (-100、500) である必要があります。

## Colorize

{{% funcsig %}}
images.Colorize HUE SATURATION PERCENTAGE
{{% /funcsig %}}

Colorize は、画像をカラー化するフィルターを作成します。
hue パラメーターはカラーホイール上の角度で、通常は (0, 360) の範囲です。
saturation パラメーターは、範囲 (0、100) でなければなりません。
パーセント パラメーターは効果の強さを指定し、範囲（0、100）である必要があります。

## Contrast

{{% funcsig %}}
images.Contrast PERCENTAGE
{{% /funcsig %}}

Contrast は、画像のコントラストを変更するフィルターを作成します。
パーセントパラメーターは、範囲 (-100、100) である必要があります。

## Gamma

{{% funcsig %}}
images.Gamma GAMMA
{{% /funcsig %}}

Gamma (ガンマ) は、画像にガンマ補正を行うフィルターを作成します。
ガンマ パラメータは正でなければなりません。 ガンマ = 1 で元の画像が得られます。
ガンマが 1 未満の場合はイメージが暗くなり、ガンマが 1 より大きい場合はイメージが明るくなります。

## GaussianBlur

{{% funcsig %}}
images.GaussianBlur SIGMA
{{% /funcsig %}}

GaussianBlur (ガウスぼかし) は、画像にガウスぼかしを適用するフィルターを作成します。

## Grayscale

{{% funcsig %}}
images.Grayscale
{{% /funcsig %}}

Grayscale (グレースケール) は、画像のグレースケール版を生成するフィルターを作成します。

## Hue

{{% funcsig %}}
images.Hue SHIFT
{{% /funcsig %}}

Hue (色相) は、画像の色相を回転させるフィルターを作成します。
色相角の変化は、通常 -180 〜 180 の範囲です。

## Invert

{{% funcsig %}}
images.Invert
{{% /funcsig %}}

Invert (反転) は、画像の色を反転させるフィルターを作成します。

## Pixelate

{{% funcsig %}}
images.Pixelate SIZE
{{% /funcsig %}}

Pixelate (ピクセル化効果) は、画像にピクセル化効果を適用するフィルターを作成します。

## Saturation

{{% funcsig %}}
images.Saturation PERCENTAGE
{{% /funcsig %}}

Saturation (彩度) は、画像の彩度を変更するフィルターを作成します。

## Sepia

{{% funcsig %}}
images.Sepia PERCENTAGE
{{% /funcsig %}}

Sepia (セピア) は、画像をセピア調にするフィルターを作成します。

## Sigmoid

{{% funcsig %}}
images.Sigmoid MIDPOINT FACTOR
{{% /funcsig %}}

Sigmoid (シグモイド) は、シグモイド関数を用いて画像のコントラストを変更し、調整後の画像を返すフィルターを作成します。
非線形にコントラストを変化させるので、ハイライトやシャドーの詳細を保持することができ、写真の調整に便利です。

## UnsharpMask

{{% funcsig %}}
images.UnsharpMask SIGMA AMOUNT THRESHOLD
{{% /funcsig %}}

UnsharpMask は、画像をシャープにするフィルターを作成します。
Sigma (シグマ) パラメータはガウス関数で使用され、効果の半径に影響します。
Sigma は正でなければなりません。 シャープの半径は、おおよそ 3 * Sigma に等しくなります。
amount パラメーターは、エッジの境界線がどれだけ暗くなり、どれだけ明るくなるかを制御します。 通常は 0.5 から 1.5 の間です。
threshold (しきい値) パラメータは、シャープ化される明るさの最小変化を制御します。 通常は 0 から 0.05 の間です。

## その他の関数 {#other-functions}

### Filter

{{% funcsig %}}
IMAGE | images.Filter FILTERS...
{{% /funcsig %}}

上記のコードは、画像に一連のフィルターを適用するために使用できます。

```go-html-template
{{ $img := $img | images.Filter (images.GaussianBlur 6) (images.Pixelate 8) }}
```

[フィルターメソッド](/content-management/image-processing/#filter) も参照してください。

### ImageConfig

画像を解析し、高さ、幅、およびカラーモデルを返します。

`imageConfig` 関数は 1 つのパラメータとして、 _プロジェクトのルートディレクトリ_ からの相対パス (_文字列_) を受け取ります (最初のスラッシュはあってもなくても構いません)。

{{% funcsig %}}
images.ImageConfig PATH
{{% /funcsig %}}

```go-html-template
{{ with (imageConfig "favicon.ico") }}
favicon.ico: {{.Width}} x {{.Height}}
{{ end }}
```
