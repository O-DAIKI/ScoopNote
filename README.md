# _ScoopNote_

![02c35bdee918a5bfed82781f06c49631](https://user-images.githubusercontent.com/72906009/101783191-4ca72b80-3b3d-11eb-8a6f-bc8f80f3816a.jpg)

## URL
[ScoopNote](http://18.177.93.64/)(http://18.177.93.64/)

## アプリケーション概要
「Note(音)」を「Scoop(掬う)」アプリです。
* 簡単に作成した楽曲データの公開ができます。
* 気に入った楽曲を保存できます。
* 友人間での楽曲の共有ができます。

# 利用方法

新規登録フォームにてユーザー登録を行っていただくと、楽曲の投稿、お気に入り登録、フレンド機能が利用できます。  
ログイン状態でない場合は楽曲の閲覧、再生のみ可能になります。

# 開発目的

* 楽曲制作を行っている人が簡単にweb上に制作物を公開できるようにするため。
* 楽曲の共有を容易にし、知人間の音源のやりとりを円滑に行えるようにするため。
* モダンな開発技術に触れたかったため、Docker,Circleciといった技術を学習し導入しました。

# DEMO

[![Image from Gyazo](https://i.gyazo.com/f781dcad25945f956b44aec871e5e56c.gif)](https://gyazo.com/f781dcad25945f956b44aec871e5e56c)

[![Image from Gyazo](https://i.gyazo.com/1534abf5af7dc7d17535958fe653fac6.gif)](https://gyazo.com/1534abf5af7dc7d17535958fe653fac6)

[![Image from Gyazo](https://i.gyazo.com/e1e403b185ac6dfaf51b37f3c4fa02ab.gif)](https://gyazo.com/e1e403b185ac6dfaf51b37f3c4fa02ab)

## 工夫した点

### ①インフラ技術
インフラの学習としてモダンな開発環境に触れたかったため、Docker、Circleci、AWS、Capistranoを用いてCI/CDパイプラインを構築しました。

### ②使用感
作曲を行っている知人に実際に触ってもらい意見を取り入れ、不便な箇所を改善していきました。

### ③楽曲データの共有の容易さ
相互フォローをした状態であれば、お互いのフォローリストから相手のマイページに飛ぶことができ、そこで投稿楽曲の一覧を表示することで楽曲の共有を楽に行えるよう実装しました。

# 実装機能

### ユーザー登録機能

* 目的:  
楽曲投稿機能の利用やユーザー同士の繋がりを持たせるため。
* 詳細:  
新規登録フォームより、ニックネーム、メールアドレス、パスワード、確認用パスワードをすることでユーザー登録ができます。

### 楽曲投稿機能

* 目的:  
作成した曲を公開するため。
* 詳細:  
ログインした状態で画像(任意)、アーティスト名、曲名、音源をフォームに入力するとデータベースに保存され、トップページに表示されます。

### 楽曲詳細情報表示機能

* 目的: 
 投稿されている楽曲の情報の閲覧と音源の再生をするため。
* 詳細:  
トップページの投稿一覧から任意の楽曲カードをクリックするとその楽曲の投稿時の情報と再生ボタンが確認でき、再生ボタンを押すと音源を聴くことができます。

### 楽曲情報編集機能

* 目的:  
投稿した楽曲の情報を後から編集できるようにするため。
* 詳細:  
ログインした状態かつ自身の投稿した楽曲であれば楽曲詳細画面に編集・削除ボタンが存在します。
編集ボタンを押すと編集ページに遷移し投稿時に入力した内容を変更することができます。

### 楽曲削除機能

* 目的:  
投稿した楽曲を後から削除できるようにするため。
* 詳細:  
ログインした状態かつ自身の投稿した楽曲であれば楽曲詳細画面に編集・削除ボタンが存在します。
削除ボタンを押すとトップページに遷移し楽曲がデータベースより削除されています。

### マイページ機能

* 目的:  
該当ユーザーのプロフィール、投稿楽曲、お気に入り楽曲、フレンドを閲覧できるようにするため。
* 詳細:  
マイページでは、自身のプロフィールと投稿した楽曲、フォローリストとフォロワーリスト、お気に入りした楽曲の一覧が確認できます。

### お気に入り登録機能

* 目的: 
 気に入った楽曲をお気に入り登録し、後から見やすくするため。
* 詳細:  
楽曲一覧に表示されている各楽曲の詳細ページからお気に入りボタンをクリックすることで、マイページよりお気に入り登録した楽曲の一覧を確認することができます。

### フォロー機能

* 目的:  
ユーザーをフォローすることで、投稿楽曲やお気に入り登録した楽曲を共有するため。
* 詳細:  
フォローするとフォローリストから任意のユーザーのマイページを確認することができ、そのユーザーの投稿楽曲やお気に入り登録した楽曲を確認することができます。

### 楽曲検索機能

* 目的:  
探したい楽曲名を見つけやすくするため。
* 詳細:  
文字列検索により、入力した文字列を含む楽曲を一覧表示します。

### ユーザー検索機能

* 目的:  
探したいユーザーを見つけやすくするため。
* 詳細:  
文字列検索により、入力した文字列を含むユーザーを一覧表示します

# 使用技術

* Ruby : 2.6.5
* Rails : 6.0.0
* webpacker (css/javascript)
* Docker (ローカル環境)
* Circleci (自動テスト、rubocop、自動デプロイ)
* Rspec (単体テストコード、結合テストコード)


# 開発環境

![ScoopNoteアーキテクチャ](https://user-images.githubusercontent.com/72906009/101499856-19379600-39b1-11eb-8e8a-22c193938d61.png)

# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| profile            | text   |             |

### Association

- has_many :musics
- has_many :comments
- has_many :favorites
- has_many :favorite_musics, through: :favorites, source: :music
- has_many :active_relationships, class_name: "Relationship", foreign_key: :following_id
- has_many :followings, through: :active_relationships, source: :follower
- has_many :passive_relationships, class_name: "Relationship", foreign_key: :follower_id
- has_many :followers, through: :passive_relationships, source: :following

## musics テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| artist  | text       | null: false                    |
| title   | text       | null: false                    |
| user_id | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :favorites
- has_many :comments

## favorites テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| user_id  | references | null: false, foreign_key: true |
| music_id | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :music

## relationships テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| user_id   | references | null: false, foreign_key: true |
| follow_id | references | null: false, foreign_key: true |

### Association

- belongs_to :following, Class_name: "User"
- belongs_to :follower, Class_name: "User"

## comments テーブル

| Column   | Type       | Option                         |
| -------- | ---------- | ------------------------------ |
| text     | text       | null: false                    |
| user_id  | references | null: false, foreign_key: true |
| music_id | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :music

## ER図

![ER図 copy drawio](https://user-images.githubusercontent.com/72906009/101788185-2dab9800-3b43-11eb-97c6-88b5b1c537d6.png)