# テーブル設計

## users テーブル

| Column              | Type    | Options                     |
| ------------------- | ------- | --------------------------- |
| nickname            | string  | null: false                 |
| email               | string  | null: false, unique: true   |
| encrypted_password  | string  | null: false                 |
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
| name                | string     | null: false                    |
| detail              | text       | null: false                    |
| category            | integer    | null: false                    |
| condition           | integer    | null: false                    |
| shipping_fee_burden | integer    | null: false                    |
| shipping_area       | integer    | null: false                    |
| shipping_day        | integer    | null: false                    |
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
| content             | text       | null: false                    |
| item                | references | null: false, foreign_key: true |
| user                | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item

## addresses テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| postal_code         | string     | null: false                    |
| shipping_area       | integer    | null: false                    |
| city                | string     | null: false                    |
| address_line1       | string     | null: false                    |
| address_line2       | string     |                                |
| phone_number        | string     | null: false                    |
| order               | references | null: false, foreign_key: true |

### Association
- belongs_to :order


## orders テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| item                | references | null: false, foreign_key: true |
| user                | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :address
