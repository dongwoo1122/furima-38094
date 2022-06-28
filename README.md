# README

## users テーブル
| Column               | Type   | Options                   |
| -------------------- | ------ | ------------------------- |
| nickname             | string | null: false               |
| email                | string | null: false, unique: true |
| encryoted_password   | string | null: false               |
| name01               | string | null: false               |
| name02               | string | null: false               |
| kana01               | string | null: false               |
| kana02               | string | null: false               |
| birthday             | string | null: false               |

### Association
- has_many :items
- has_many :orders

## items テーブル
| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| name            | string     | null: false                    |
| description     | text       | null: false                    |
| category_id     | string     | null: false                    |
| item_status_id  | string     | null: false                    |
| price           | integer    | null: false                    |
| delivery_fee_id | string     | null: false                    |
| sale_fee_id     | string     | null: false                    |
| sale_profit_id  | string     | null: false                    |
| user            | references | null: false, foreign_key: true |

### Association
- has_one :orders
- belongs_to :users
 
## order テーブル
| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| user             | references | null: false, foreign_key: true |
| item             | references | null: false, foreign_key: true |

### Association
- belongs_to :users
- belongs_to :items
- has_one :deliveries

## delivery テーブル
| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| address_region     | string     | null: false, foreign_key: true |
| address_city       | string     | null: false, foreign_key: true |
| address_street     | string     | null: false, foreign_key: true |
| address_building   | string     | foreign_key: true              |
| postcode           | string     | null: false, foreign_key: true |
| phone_number       | string     | null: false, foreign_key: true |
| order              | references | null: false, foreign_key: true |
### Association
- belong_to :orders
