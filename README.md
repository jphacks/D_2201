# Look for Stars

![Look for Stars](https://jphacks.github.io/D_2201/data/Look_for_Stars_4000-1200.png)
<img src="https://jphacks.github.io/D_2201/data/デフォルトアイコン_丸い星.png" height="150px"> 
<img src="https://jphacks.github.io/D_2201/data/デフォルトアイコン_二重円.png" height="150px"> 
<img src="https://jphacks.github.io/D_2201/data/デフォルトアイコン_同心円_黄色.png" height="150px"> 
<img src="https://jphacks.github.io/D_2201/data/デフォルトアイコン_同心円_黄色水色.png" height="150px">
<img src="https://jphacks.github.io/D_2201/data/デフォルトアイコン_土星.png" height="150px"> 
<img src="https://jphacks.github.io/D_2201/data/デフォルトアイコン_星.png" height="150px"> 
## チーム D_2201
<img src="https://jphacks.github.io/D_2201/data/とっとこ公大郎_背景透過.png" height="100px"> 

[![ License MIT](https://img.shields.io/badge/license-MIT-blue.svg?style=flat)](LICENSE.md) [![pages-build-deployment](https://github.com/jphacks/D_2201/actions/workflows/pages/pages-build-deployment/badge.svg)](https://github.com/jphacks/D_2201/actions/workflows/pages/pages-build-deployment)(開発用)

## 製品概要
「今夜、星を見に行こう」　Look for Starsは衛星画像や土地情報から星が綺麗に見える場所を計算し、皆さんのいる場所から最適な天体観測スポットをお勧めしたり周りの人と綺麗な星空をシェアするアプリケーションです。
### 背景(製品開発のきっかけ、課題等）
田舎に旅行したけど、どこに行ってもあまり星が見えなかった。そんな経験から衛星画像を活用すれば星の綺麗な場所が分かるのではと思いつきました。
星が見たい！でも星が綺麗に見える場所がわからないという人が、自分が今いる場所から近くにある天体観測スポットを探したり、口コミで天体観測ができる穴場を発見できるアプリケーションです。
### 製品説明（具体的な製品の説明）
### 特長
#### 1. 特長1　人工衛星が取得した衛星画像から、町の明かりが少なく星が見えやすいスポットを見つけられる
#### 2. 特長2　土地の情報から星が綺麗に見えるところをマップ上に表示してくれる
#### 3. 特長3　お気に入りスポットをみんなに紹介できる
#### 4. 特長4　行きたい地点・行った地点をブックマークできる
#### 5. 特長5　他の人のおすすめスポットを回りスタンプをためるとアイコンが豪華に！

### 解決出来ること
星が見たいときにどこへ旅するのがよいのかを示したり、突然星を見たくなった時近場ではどこが一番星を綺麗に見えるのか分かります。

### 今後の展望
#### 1. 展望1　同じ条件で撮影した複数の夜景と衛星、地形情報を学習させ、周辺地域の明るさも計算に含めた機械学習モデルを導入しより精度を向上したい
#### 2. 展望2　衛星画像から街の明かりだけでなく町の夜景(明るさ+建物や地形の高低差)、魚の密集地(海の色の変化)、渋滞状況(道路に含まれるほかの色の割合)も表示し、より旅を充実できるアプリにしたい
#### 3. 展望3　曇り予報をアプリの地図上に表示し、任意の時間で星を見えるか確認できるようにしたい
#### 4. 展望4　投稿された夜景数が多ければより便利なアプリになるので、思わず夜景をUpしたくなるような機能を導入したい
#### 5. 展望5　道案内機能などを実装するためGoogleMapAPIを導入できる費用を得るため、読み込み上限やブックマーク上限を開放したり広告を非表示にできるPro会員機能を導入したい
#### 6. 展望6　自分たちの衛星で撮影した写真を使って最新の情報を提供したい

衛星画像を活用して出来ることはもっと沢山あると思ってます。
人工衛星を開発運用しているチームとして、これからも衛星が人々にもたらす利点をより追究したいなと思っております。


### 注力したこと（こだわり等）
* 衛星画像だけではなく、土地情報からも星が見えるかどうかを判断しました。// 笹岡くんとAsha
* ただ星の綺麗なスポットが見えるだけでなくSNSコミュニティとして機能するようにスポットの投稿機能やコメント機能を実装しました　// 横井くんのこだわりポイント

## 開発技術
### 活用した技術
* python
* opencv
* flutter

#### API・データ
* 天気API
* JLL様提供土地利用データ
* エアロゾル光学的厚さAPI(人工衛星"しきさい")
* MapQuest提供API
* Copernicus Sentinel data 2022' for Sentinel data

#### フレームワーク・ライブラリ・モジュール
* package:flutter/material.dart
* package:google_fonts/google_fonts.dart
* package:flutter_map/flutter_map.dart
* package:latlong2/latlong.dart
* package:flutter/material.dart
* package:open_weather_api_client/open_weather_api_client.dart 

#### デバイス
* IOS
* Android
* Web

### 独自技術
#### ハッカソンで開発した独自機能・技術
* 衛星画像や土地情報から星の見えやすさを算出するプログラム
* 提供されたAPIの地図上にスコアを可視化するレイヤー

#### 製品に取り入れた研究内容（データ・ソフトウェアなど）（※アカデミック部門の場合のみ提出必須）
* 
* 
