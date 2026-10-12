# テーブル設計

## users テーブル

| Column              | Type    | Options                     |
| ------------------- | ------- | --------------------------- |
| **user_id**          | integer | **PK**, Auto Increment      |
| nickname            | string  | null: false                 |
| email               | string  | null: false, unique: true   |
| password            | string  | null: false                 |
| first_name          | string  | null: false                 |
| last_name           | string  | null: false                 |
| last_name_kana      | string  | null: false                 |
| first_name_kana     | string  | null: false                 |
| birthday            | date    | null: false                 |

### Association
- has_many :items
- has_many :comments
- has_one :address
- has_many :orders

## items テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| **item_id**         | integer    | **PK**, Auto Increment         |
| name                | string     | null: false                    |
| detail              | text       | null: false                    |
| category            | string     | null: false                    |
| condition           | string     | null: false                    |
| shipping_fee_burden | string     | null: false                    |
| shipping_area       | string     | null: false                    |
| shipping_days       | string     | null: false                    |
| price               | integer    | null: false                    |
| user                | references | null: false, foreign_key: true |

* ※imageはActiveStorageで実装するためテーブルには含まない。

### Association
- belongs_to :user
- has_many :comments
- has_one :order

## comments テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| **comment_id**      | integer    | **PK**, Auto Increment         |
| content             | text       | null: false                    |
| item                | references | null: false, foreign_key: true |
| user                | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item

## addresses テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| **address_id**      | integer    | **PK**, Auto Increment         |
| postal_code         | string     | null: false                    |
| prefecture          | string     | null: false                    |
| city                | string     | null: false                    |
| address_line1       | string     | null: false                    |
| address_line2       | string     | null: false                    |
| phone_number        | string     | null: false                    |
| user                | references | null: false, foreign_key: true |

### Association
- belongs_to :user


## orders テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| **order_id**        | integer    | **PK**, Auto Increment         |
| item                | references | null: false, foreign_key: true |
| user                | references | null: false, foreign_key: true |
| address             | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- belongs_to :address
