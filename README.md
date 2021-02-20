# テーブル設計

## users テーブル

| Column                | Type    | Options     |
| --------------------- | --------| ----------- |
| nickname              | string  | null: false |
| email                 | string  | null: false |
| encrypted_password    | string  | null: false |
| last_name             | string  | null: false |
| first_name            | string  | null: false |
| last_name_kana        | string  | null: false |
| first_name_kana       | string  | null: false |
| birthday              | date    | null: false |

### Association

- has_many :items
- has_many :purchases

## items テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| name_id        | string     | null: false                    |
| description_id | integer    | null: false                    |
| details_id     | integer    | null: false                    |
| status_id      | integer    | null: false                    |
| sipping_id     | integer    | null: false                    |
| delivery_id    | integer    | null: false                    |
| sipping_day_id | integer    | null: false                    |
| selling_price  | integer    | null: false                    |
| user           | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one    :purchase

## purchases テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| card_information | integer    | null: false                    |
| expiration       | integer    | null: false                    |
| security_code    | integer    | null: false                    |
| user             | references | null: false, foreign_key: true |
| items            | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one    :shipping

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

- belongs_to :purchase