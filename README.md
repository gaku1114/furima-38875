## usersテーブル

| Column             | Type    | Options                   |
|------------------- | ------- | ------------------------- |
| nickname           | string  | null: false               |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| first_name         | string  | null: false               |
| last_name          | string  | null: false               |
| first_name_kana    | string  | null: false               |
| last_name_kana     | string  | null: false               |
| birtday            | date    | null: false               |


- has_many :items
- has_many :orders


## itemsテーブル

| Column          | Type       | Options                        |
|---------------- | ---------- | ------------------------------ |
| name            | string     | null: false                    |
| description     | text       | null: false                    |
| category        | string     | null: false                    |
| condition       | string     | null: false                    |
| price           | integer    | null: false                    |
| delivery_charge | string     | null: false                    |
| deadline        | integer    | null: false                    |
| prefecture      | string     | null: false                    |
| user            | references | null: false, foreign_key: true |

- belogngs_to :user
- has_one :order


## ordersテーブル

| Column       | Type       | Options                        |
|------------- | ---------- | ------------------------------ |
| user         | references | null: false, foreign_key: true |
| item         | references | null: false, foreign_key: true |

- belogs_to :user
- belongs_to :item
- has_one :address


## destinationテーブル

| postal_code  | string     | null: false                    |
| prefecture   | string     | null: false                    |
| municipality | string     | null: false                    |
| address      | string     | null: false                    |
| building     | string     |                                |
| phone_number | integer    | null: false                    |
| orders       | references | null: false, foreign_key: true |

- belongs_to :order