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

# テーブル設計

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