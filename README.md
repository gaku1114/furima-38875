## usersテーブル

| Column          | Type    | Options                   |
|---------------- | ------- | ------------------------- |
| nickname        | string  | null: false               |
| email           | string  | null: false, unique: true |
| password        | string  | null: false               |
| first_name      | string  | null: false               |
| last_name       | string  | null: false               |
| first_name_kana | string  | null: false               |
| last_name_kana  | string  | null: false               |
| birth_year      | integer | null: false               |
| birth_month     | integer | null: false               |
| birth_day       | integer | null: false               |

- has_many :items
- has_many :orders


## itemsテーブル

| Column          | Type       | Options                        |
|---------------- | ---------- | ------------------------------ |
| image           | string     | null: false                    |
| name            | string     | null: false                    |
| description     | text       | null: false                    |
| category        | string     | null: false                    |
| condition       | string     | null: false                    |
| price           | integer    | null: false                    |
| status          | string     | null: false                    |
| delivery_charge | string     | null: false                    |
| deadline        | integer    | null: false                    |
| from_location   | string     | null: false                    |
| user_id         | references | null: false, foreign_key: true |

- belogngs_to :user
- has_one :order


## ordersテーブル

| Column       | Type       | Options                        |
|------------- | ---------- | ------------------------------ |

| phone_number | integer    | null: false                    |
| user_id      | references | null: false, foreign_key: true |
| item_id      | references | null: false, foreign_key: true |

- belogs_to :user
- belongs_to :item
- has_one :address

## adddressテーブル

| postal_code  | integer    | null: false                    |
| prefecture   | string     | null: false                    |
| municipality | string     | null: false                    |
| address      | integer    | null: false                    |
| building     | string     |                                |
| orders_id    | references | null: false, foreign_key: true |

- belongs_to :order