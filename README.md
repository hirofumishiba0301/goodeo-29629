# README

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| email              | string | null: false |
| encrypted_password | string | null: false |
| birthday           | date   | null: false |
| nickname           | string | null: false |
| last-name          | string | null: false |
| first-name         | string | null: false |
| last-name-kana     | string | null: false |
| first-name-kana    | string | null: false |

### Association
- has_many :favorites
- has_many :playlists
- has_many :vedeos


## vedeos テーブル

| Column        | Type       | Options                        |
| ------------- | -----------| ------------------------------ |
| name          | string     | null: false                    |
| user          | references | foreign_key: true              |
| info          | text       | null: false                    |
| category_id   | integer    | null: false                    |
| goodjob       | integer    |                                |
| view          | integer    |                                |
|               | integer    |                                |

### Association
- belongs_to :user
- has_many :tags through vedeo_tags
- has_many :vedeo_tags
- has_many :favorites
- has_many :playlists, through: :vedeo_playlists
- has_many :vedeo_playlists

## tags テーブル

| Column        | Type       | Options                        |
| ------------- | -----------| ------------------------------ |
| name          | string     | null: false                    |
| tagging_count | integer    |                                |

### Association
- has_many :vedeos
- unique: true

## taggings テーブル

| Column        | Type       | Options                        |
| ------------- | -----------| ------------------------------ |
| tag_id        | references | foreign_key: true              |
| taggable_type | references | foreign_key: true              |
| taggable_id   | references | foreign_key: true              |
| tagger_type   | references | foreign_key: true              |
| tagger_id     | references | foreign_key: true              |
| content       | references | foreign_key: true              |


### Association
- has_many :tags

## playlists テーブル

| Column        | Type       | Options                        |
| ------------- | -----------| ------------------------------ |
| name          | string     | null: false                    |
| user          | references | foreign_key: true              |
| info          | text       | null: false                    |

### Association
- belongs_to :user
- has_many :vedeos, through: :vedeo_playlists
- has_many :vedeo_playlists

## vedeo_playlists テーブル

| Column        | Type       | Options                        |
| ------------- | -----------| ------------------------------ |
| vedeo         | references | foreign_key: true              |
| playlist      | references | foreign_key: true              |


### Association
- has_many :vedeos
- has_many :playlists


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
