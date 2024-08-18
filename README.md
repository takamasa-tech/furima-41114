## usersテーブル

| カラム名 | 型 | オプション |
| --- | --- | --- |
| nickname | string | null: false |
| email | string | null: false, unique: true |
| encrypted_password | string | null: false |
| birthday | date | null: false |
| tel | string |  |
| self_introduction | text |  |
| point | integer |  |
| created_at | datetime | null: false |
| updated_at | datetime | null: false |

### アソシエーション

- has_many :products
- has_many :my_addresses
- has_many :cards
- has_one :sns_credential

## productsテーブル

| カラム名 | 型 | オプション |
| --- | --- | --- |
| name | string | null: false |
| description | text | null: false |
| price | integer | null: false |
| category_id | references | null: false, foreign_key: true |
| size_id | references | null: false, foreign_key: true |
| status_id | references | null: false, foreign_key: true |
| prefecture_id | references | null: false, foreign_key: true |
| user_id | references | null: false, foreign_key: true |
| created_at | datetime | null: false |
| updated_at | datetime | null: false |

### アソシエーション

- belongs_to :user
- belongs_to :category
- belongs_to :size
- belongs_to :status
- belongs_to :prefecture
- has_many :images

## categoriesテーブル

| カラム名 | 型 | オプション |
| --- | --- | --- |
| name | string | null: false |
| ancestry | string |  |
| size_tag | string |  |
| created_at | datetime | null: false |
| updated_at | datetime | null: false |

### アソシエーション

- has_many :products

## sizesテーブル

| カラム名 | 型 | オプション |
| --- | --- | --- |
| size_name | string | null: false |
| size_tag | string |  |
| created_at | datetime | null: false |
| updated_at | datetime | null: false |

### アソシエーション

- has_many :products

## statusesテーブル

| カラム名 | 型 | オプション |
| --- | --- | --- |
| status | string | null: false |
| created_at | datetime | null: false |
| updated_at | datetime | null: false |

### アソシエーション

- has_many :products

## my_addressesテーブル

| カラム名 | 型 | オプション |
| --- | --- | --- |
| first_name | string | null: false |
| last_name | string | null: false |
| first_name_kana | string | null: false |
| last_name_kana | string | null: false |
| zip | string | null: false |
| prefecture_id | references | null: false, foreign_key: true |
| city_name | string | null: false |
| block_name | string | null: false |
| bill_name | string |  |
| tel | string |  |
| user_id | references | null: false, foreign_key: true |
| created_at | datetime | null: false |
| updated_at | datetime | null: false |

### アソシエーション

- belongs_to :user
- belongs_to :prefecture

## cardsテーブル

| カラム名 | 型 | オプション |
| --- | --- | --- |
| user_id | references | null: false, foreign_key: true |
| customer_id | string | null: false |
| card_id | string | null: false |
| created_at | datetime | null: false |
| updated_at | datetime | null: false |

### アソシエーション

- belongs_to :user

## sns_credentialsテーブル

| カラム名 | 型 | オプション |
| --- | --- | --- |
| provider | string | null: false |
| uid | string | null: false |
| user_id | references | null: false, foreign_key: true |
| created_at | datetime | null: false |
| updated_at | datetime | null: false |

### アソシエーション

- belongs_to :user

## imagesテーブル

| カラム名 | 型 | オプション |
| --- | --- | --- |
| image | string | null: false |
| product_id | references | null: false, foreign_key: true |
| created_at | datetime | null: false |
| updated_at | datetime | null: false |

### アソシエーション

- belongs_to :product