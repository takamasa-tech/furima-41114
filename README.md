## usersテーブル

| カラム名             | 型         | オプション                |
|----------------------|------------|---------------------------|
| nickname             | string     | null: false               |
| email                | string     | null: false, unique: true |
| encrypted_password   | string     | null: false               |
| last_name            | string     | null: false               |
| first_name           | string     | null: false               |
| last_name_kana       | string     | null: false               |
| first_name_kana      | string     | null: false               |
| birthday             | date       | null: false               |

### アソシエーション
- has_many :products
- has_many :orders

---

## productsテーブル

| カラム名              | 型         | オプション                      |
|----------------------|------------|---------------------------------|
| name                 | string     | null: false                     |
| description          | text       | null: false                     |
| price                | integer    | null: false                     |
| category_id          | integer    | null: false                     |
| condition_id         | integer    | null: false                     |
| shipping_charge_id   | integer    | null: false                     |
| shipping_area_id     | integer    | null: false                     |
| shipping_date_id     | integer    | null: false                     |
| user                 | references | null: false, foreign_key: true  |

### アソシエーション
- belongs_to :user
- has_one :order

---

## my_addressesテーブル

| カラム名             | 型         | オプション                     |
|----------------------|------------|--------------------------------|
| postal_code          | string     | null: false                    |
| shipping_area_id     | integer    | null: false                    |
| city                 | string     | null: false                    |
| addresses            | string     | null: false                    |
| building             | string     |                                |
| phone_number         | string     | null: false                    |
| order                | references | null: false, foreign_key: true |

### アソシエーション
- belongs_to :order

---

## ordersテーブル

| カラム名             | 型         | オプション                      |
|----------------------|------------|---------------------------------|
| user                 | references | null: false, foreign_key: true  |
| product              | references | null: false, foreign_key: true  |

### アソシエーション
- belongs_to :user
- belongs_to :product
- has_one :my_address
