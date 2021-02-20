# テーブル設計

## users テーブル

| Column                | Type    | Options                   |
| --------------------- | --------| ------------------------- |
| nickname              | string  | null: false, unique: true |
| email                 | string  | null: false               |
| encrypted_password    | string  | null: false               |
| last_name             | string  | null: false               |
| first_name            | string  | null: false               |
| last_name_kana        | string  | null: false               |
| first_name_kana       | string  | null: false               |
| birthday              | date    | null: false               |

### Association

- has_many :items, through: :user_items
- has_many :user_items

## items テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| name           | string     | null: false                    |
| description    | string     | null: false                    |
| pre_id         | integer    | null: false                    |
| state_id       | integer    | null: false                    |
| sipping_id     | integer    | null: false                    |
| prefecture_id  | integer    | null: false                    |
| sipping_day_id | integer    | null: false                    |
| selling_price  | integer    | null: false                    |
| user           | references | null: false, foreign_key: true |

### Association

- has_many :users, through: :user_items
- has_one  :user_items

## user_items テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| user             | references | null: false, foreign_key: true |
| item             | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one    :shipping

## shippings テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| postal_code    | string     | null: false                    |
| prefecture_id  | text       | null: false                    |
| city           | string     | null: false                    |
| address        | string     | null: false                    |
| building       | string     |                                |
| phone_number   | string     | null: false                    |
| user_items     | references | null: false, foreign_key: true |

### Association

- belongs_to :purchase