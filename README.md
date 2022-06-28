# README

## users テーブル
| Column               | Type   | Options                   |
| -------------------- | ------ | ------------------------- |
| nickname             | string | null: false               |
| email                | string | null: false, unique: true |
| password             | string | null: false               |
| encryoted_password   | string | null: false               |
| name01               | string | null: false               |
| name02               | string | null: false               |
| kana01               | string | null: false               |
| kana02               | string | null: false               |
| birthday             | string | null: false               |

## items テーブル
| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| name            | string     | null: false                    |
| description     | string     | null: false                    |
| category        | string     | null: false                    |
| item_status     | string     | null: false                    |
| price           | string     | null: false                    |
| delivery_fee    | string     | null: false                    |
| sale_fee        | string     | null: false                    |
| sale_profit     | string     | null: false                    |
| shirp_progion   | string     | null: false                    |
| shirp_time      | string     | null: false                    |
| user            | references | null: false, foreign_key: true |
 
## order テーブル
| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| user             | references | null: false, foreign_key: true |
| order            | references | null: false, foreign_key: true |
| delivery         | references | null: false, foreign_key: true |

## delivery テーブル
| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| address_region     | string     | null: false                    |
| address_city       | string     | null: false                    |
| address_street     | string     | null: false                    |
| address_building   | string     | null: false                    |
| postcode           | string     | null: false                    |
| phonenumber        | string     | null: false                    |