# テーブル設計

## users テーブル

| Column                | Type    | Options     |
| --------------------- | --------| ----------- |
| nickname              | string  | null: false |
| email                 | string  | null: false |
| password              | string  | null: false |
| password_confirmation | string  | null: false |
| last_name             | text    | null: false |
| first_name            | text    | null: false |
| last_name_kana        | text    | null: false |
| first_name_kana       | text    | null: false |
| birthday              | integer | null: false |

### Association

- has_many :items
- has_many :purchases

## items テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| item_name     | text       | null: false                    |
| description   | text       | null: false                    |
| details       | string     | null: false                    |
| status        | string     | null: false                    |
| sipping       | string     | null: false                    |
| delivery      | string     | null: false                    |
| sipping_day   | string     | null: false                    |
| selling_price | integer    | null: false                    |
| user          | references | null: false, foreign_key: true |

### Association

- belongs_to :users
- has_one    :purchases

## purchases テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| card_information | integer    | null: false                    |
| expiration       | integer    | null: false                    |
| security_code    | integer    | null: false                    |
| user             | references | null: false, foreign_key: true |
| items            | references | null: false, foreign_key: true |

### Association

- belongs_to :users
- belongs_to :items
- has_one    :shippings

## shippings テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| postal_code  | integer    | null: false                    |
| prefectures  | string     | null: false                    |
| city         | text       | null: false                    |
| address      | text       | null: false                    |
| building     | text       |                                |
| phone_number | integer    | null: false                    |
| purchased    | references | null: false, foreign_key: true |

### Association

- belongs_to :purchases