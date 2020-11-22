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

## users テーブル

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| nickname           | string  | null: false |
| email              | string  | null: false |
| encrypted_password | string  | null: false |
| first_name         | string  | null: false |
| first_name_reading | string  | null: false |
| last_name          | string  | null: false |
| last_name_reading  | string  | null: false |
| birthday           | date    | null: false |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column                  | Type       | Options     |
| ----------------------- | ---------- |------------ | 
| explain                 | text       | null: false |
| name                    | string     | null: false |
| category_id             | integer     | null: false |
| sales_status_id         | integer     | null: false |
| shipping_fee_status_id  | integer     | null: false |
| prefecture_id           | integer     | null: false |
| scheduled_delivery_id   | integer     | null: false |
| price                   | integer    | null: false |
| user                    | references | null: false, foreign_key: true |


### Association
- has_one :order
- belongs_to :user

## order テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| user      | references | null: false, foreign_key: true |
| item      | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## addresses テーブル

| Column        | Type       | Options     |
| ------------- | ---------- | ----------- |
| post_code     | string     | null: false |
| prefecture_id | integer    | null: false |
| city          | string     | null: false |
| house_number  | string     | null: false |
| building_name | string     |             |
| phone_number  | string     | null: false |
| order         | references | null: false, foreign_key: true |

### Association

- belongs_to :order