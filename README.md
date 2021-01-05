# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...



# アプリケーション名
## TimeCapsule

# アプリケーション概要
未来に残したい画像や伝えたい想いを動画にして残しておくアプリです

# URL

# テスト用アカウント

# 利用方法
①アカウントを作成する
②Postingから新規投稿ページへ移動する
③投稿後開封したい日に検索をかけてオープンする

# 目指した課題解決
近年周りの環境は目まぐるしく変わり、変わらないだろうと思っていたものまで変わっていっている。そういった環境下で、タイムカプセルを埋めたりなどしても、思いがけないことで掘り起こされたり、そもそも建設予定などで埋める許可がおりず場所の確保ができない状態を解決するためにこのアプリを解決しました。

# 洗い出した要件
### 当時のことを思い出せるような物の写真などを保管しておく
### 生まれた子に対して数年後、何十年後に向けてのメッセージや動画を残しておく

# 実装した機能についてのGIFと説明

# 実装予定の機能
投稿したものを見る人に制限を設けるためにパスワードを設定する

# データベース設計
## users
| Column             | Type   | Options                   | 
| ------------------ | ------ | ------------------------- | 
| last_name          | string | null: false               | 
| first_name         | string | null: false               | 
| last_name_kana     | string | null: false               | 
| first_name_kana    | string | null: false               | 
| nickname           | string | null: false               | 
| email              | string | null: false, unique: true | 
| encrypted_password | string | null: false               | 
| date_birth         | date   | null: false               | 

### Association
- has_many :messages

## messages テーブル
| Column             | Type       | Options     | 
| ------------------ | ---------- | ----------- | 
| title              | string     | null: false | 
| whom               | string     | null: false | 
| message            | text       |             | 
| open_plan          | data       | null: false | 
| encrypted_password | string     | null: false | 
| user_id            | references | null: false | 

### Association
- belongs_to :user

# ローカルでの動作方法