## Users テーブル

| カラム名 | 型 | オプション |
| --- | --- | --- |
| id | integer | null: false, primary key |
| nickname | string | null: false |
| email | string | null: false, unique: true |
| encrypted_password | string | null: false |
| last_name | string | null: false |
| first_name | string | null: false |
| last_name_kana | string | null: false |
| first_name_kana | string | null: false |
| birthday | date | null: false |

### アソシエーション

- has_many :products
- has_many :orders

---

## Products テーブル

| カラム名 | 型 | オプション |
| --- | --- | --- |
| id | integer | null: false, primary key |
| name | string | null: false |
| description | text | null: false |
| price | integer | null: false |
| category | references | null: false, foreign_key: true |
| condition | references | null: false, foreign_key: true |
| shipping_charge | references | null: false, foreign_key: true |
| shipping_area | references | null: false, foreign_key: true |
| shipping_date | references | null: false, foreign_key: true |
| user | references | null: false, foreign_key: true |

### アソシエーション

- belongs_to :user
- has_many :orders

---

## My Addresses テーブル

| カラム名 | 型 | オプション |
| --- | --- | --- |
| id | integer | null: false, primary key |
| postal_code | string | null: false |
| prefecture | references | null: false, foreign_key: true |
| city | string | null: false |
| addresses | string | null: false |
| building | string |  |
| phone_number | string | null: false |
| order | references | null: false, foreign_key: true |

### アソシエーション

- belongs_to :order

---

## Orders テーブル

| カラム名 | 型 | オプション |
| --- | --- | --- |
| id | integer | null: false, primary key |
| user | references | null: false, foreign_key: true |
| product | references | null: false, foreign_key: true |

### アソシエーション

- belongs_to :user
- belongs_to :product
- has_one :my_address