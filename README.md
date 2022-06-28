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
| birthday             | date | null: false               |

### Association
- has_many :items
- has_many :orders

## items テーブル
| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| name            | string     | null: false                    |
| description     | text       | null: false                    |
| category_id     | integer    | null: false                    |
| item_status_id  | integer    | null: false                    |
| price           | integer    | null: false                    |
| delivery_fee_id | integer    | null: false                    |
| sale_fee_id     | integer    | null: false                    |
| sale_profit_id  | integer    | null: false                    |
| user            | references | null: false, foreign_key: true |

### Association
- has_one :order
- belongs_to :user
 
## orders テーブル
| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| user             | references | null: false, foreign_key: true |
| item             | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :delivery

## deliveries テーブル
| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| address_region     | string     | null: false  |
| address_city       | string     | null: false  |
| address_street     | string     | null: false  |
| address_building   | string     |              |
| postcode           | string     | null: false  |
| phone_number       | string     | null: false  |
| order              | references | null: false, foreign_key: true |

### Association
- belong_to :order
