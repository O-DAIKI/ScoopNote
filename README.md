# _ScoopNote_

## アプリケーション概要
* 簡単に作成した楽曲データの公開ができます。
* 気に入った楽曲を保存できます。
* フレンドと楽曲の共有ができます。

# URL

# テスト用アカウント

* nickname: O-DAIKI
* email: o-daiki@gmail.com
* password: od1234

# 利用方法

新規登録フォームにてユーザー登録を行っていただくと、楽曲の投稿、お気に入り登録、フレンド機能が利用できます。  
ログイン状態でない場合は楽曲の閲覧、再生のみ可能になります。

# 開発目的

* 楽曲制作を行っている人が簡単にweb上に制作物を公開できるようにするため。
* 楽曲の共有を容易にし、知人間の音源のやりとりを円滑に行えるようにするため。

# 要件定義

## ユーザー登録機能

* 目的:  
楽曲投稿機能の利用やユーザー同士の繋がりを持たせるため。
* 詳細:  
新規登録フォームより、ニックネーム、メールアドレス、パスワード、確認用パスワードをすることでユーザー登録ができます。
* ユースケース:  
トップページの新規登録ボタンから新規登録画面へ遷移します。
フォームに必要な情報を入力し送信ボタンを押します。
登録に成功するとトップページに遷移します。
登録に失敗すると新規登録画面に戻されます。

## 楽曲投稿機能

* 目的:  
作成した曲を公開するため。
* 詳細:  
ログインした状態で画像(任意)、アーティスト名、曲名、音源をフォームに入力するとデータベースに保存され、トップページに表示されます。
* ユースケース:  
トップページの投稿ボタンより投稿フォームへ移動します。
フォームに必要な情報を入力し送信ボタンを押します。
投稿に成功するとトップページの投稿一覧に表示されます。
投稿に失敗すると投稿フォーム画面に戻されます。

## 楽曲詳細情報表示機能

* 目的: 
 投稿されている楽曲の情報の閲覧と音源の再生をするため。
* 詳細:  
トップページの投稿一覧から任意の楽曲画像をクリックするとその楽曲の投稿時の情報と再生ボタンが確認でき、再生ボタンを押すと音源を聴くことができます。
* ユースケース:  
トップページの投稿一覧から任意の楽曲画像をクリックすると楽曲詳細画面へ遷移します。
再生ボタンを押し音源を聴くことができます。

## 楽曲情報編集機能

* 目的:  
投稿した楽曲の情報を後から編集できるようにするため。
* 詳細:  
ログインした状態かつ自身の投稿した楽曲であれば楽曲詳細画面に編集・削除ボタンが存在します。
編集ボタンを押すと編集ページに遷移し投稿時に入力した内容を変更することができます。
* ユースケース:  
楽曲詳細画面より編集ボタンを押すと編集ページに遷移します。
フォームに必要な条件を満たしつつ変更を加え送信ボタンを押します。
編集に成功すると楽曲詳細画面に遷移し、変更内容を確認することができます。
編集に失敗すると編集ページに戻されます。

## 楽曲削除機能

* 目的:  
投稿した楽曲を後から削除できるようにするため。
* 詳細:  
ログインした状態かつ自身の投稿した楽曲であれば楽曲詳細画面に編集・削除ボタンが存在します。
削除ボタンを押すとトップページに遷移し楽曲がデータベースより削除されています。
* ユースケース:  
楽曲詳細画面より削除ボタンを押します。
トップページに遷移されます。
楽曲が削除されていることが確認できます。

## マイページ機能

* 目的:  
該当ユーザーのプロフィール、投稿楽曲、お気に入り楽曲、フレンドを閲覧できるようにするため。
* 詳細:  
マイページでは、自身のプロフィールとフレンドボタン、お気に入りボタン、自身の投稿した楽曲の一覧が確認できます。
* ユースケース:  
トップページよりマイページボタンをクリックするとマイページへ遷移します。
自身のプロフィールとフレンドボタン、お気に入りボタン、自身の投稿した楽曲の一覧が確認できます。

## お気に入り登録機能

* 目的: 
 気に入った楽曲をお気に入り登録し、後から見やすくするため。
* 詳細:  
楽曲一覧に表示されている各楽曲のお気に入りボタンをクリックすることで、マイページよりお気に入り登録した楽曲の一覧を確認することができます。
* ユースケース:  
トップページより任意の楽曲のお気に入りボタンをクリックします。
マイページよりお気に入りリンクをクリックするとお気に入り一覧ページに遷移します。
お気に入り登録した楽曲の一覧が確認できます。

## フレンド機能

* 目的:  
フレンド登録することで、投稿楽曲やお気に入り登録した楽曲を共有するため。
* 詳細:  
フレンド登録するとフレンド一覧から任意のフレンドのマイページを確認することができ、そのフレンドの投稿楽曲やお気に入り登録した楽曲を確認することができます。
* ユースケース:  
楽曲詳細画面の投稿者リンクから投稿者のマイページへ遷移します。
フレンド申請ボタンを押します。
相互フォロー状態でフレンド成立となります。

## 楽曲検索機能

* 目的:  
探したい楽曲名を見つけやすくするため。
* 詳細:  
文字列検索により、入力した文字列を含む楽曲を一覧表示します。
* ユースケース:  
トップページの楽曲検索バーに探したい楽曲名を入力します。
検索ボタンを押すと入力した文字列を含む楽曲が一覧表示されます。

## ユーザー検索機能

* 目的:  
探したいユーザーを見つけやすくするため。
* 詳細:  
文字列検索により、入力した文字列を含むユーザーを一覧表示します。
* ユースケース:  
マイページからフレンド一覧ページに遷移し、フレンド検索バーに探したいユーザー名を入力します。
検索ボタンを押すと入力した文字列を含むユーザーが一覧表示されます。

# 実装機能と使用例

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

![ER図 drawio](https://user-images.githubusercontent.com/72906009/99501633-5e266900-29bf-11eb-892a-29fa02d5e6eb.png)

# ローカルでの動作方法