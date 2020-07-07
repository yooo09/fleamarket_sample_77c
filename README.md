# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


## users table
|Colm|Type|Option|
|----|----|------|
|nickname|string|null: false,unique: true|
|email|string|null: false,unique: true|
|password|string|null: false|
|last_name|string|null: false|
|first_name|string|null: false|
|last_name_kana|string|null: false|
|first_name_kana|string|null: false|
|birthday|integer|null: false|
|image|string|  |

### Association
- has_many :adresses dependent: :destroy
- has_many :credit_cards dependent: :destroy
- has_many :items dependent: :destroy
- has_many :comments dependent: :destroy
- has_many :sns_credentials
- has_many :likes dependent: :destroy

## adresses table
|Colm|Type|Option|
|----|----|------|
|zip_code|integer|null: false|
|prefecture|string|null: false|
|city|string|null: false|
|house_number|integer|null: false|
|building|string|null: false|
|phone_number|string|null: false|
|user_id|references|null: false,foreginkey: true|

### Association
- belongs_to :user



## credit_card table
|Colm|Type|Option|
|----|----|------|
|credit_card_type|string|null: false|
|card_number|string|null:false|
|CVS|integer|null:false|
|Expiration_date|date|null: false|
|Expiration_year|date|null: false|
|user_id||references|null: false|foreginkey: true|

### Association
- belongs_to :user,optional: true



## itemes table
|Colm|Type|Option|
|----|----|------|
|item_name|string|null: false|
|detail|text|
|condition|integer|null: false, default: 0|
|delivery_fee|string|null: false|
|shippig_area|integer|null: false|
|delivery_time|string|null: false|
|price|integer|null:false|
|user_id|references|null:false,foreginkey: true|
|brand_id|references|foreginkey: true|
|category_id|references|foreginkey: true|
|buyer_id| integer| 
### Association
- belongs_to :user
- belongs_to :category
- belongs_to :brand
- has_many :images dependent: :destroy
- has_many :likes dependent: :destroy
- has_many :comments dependent: :destroy


## images table
|src|string|null: false|
|item_id|references|null: false,foreginkey: true|

### Association
- belongs_to :item



## categories table
|Colm|Type|Option|
|----|----|------|
|name|string|null: false|
|ancestry|string|null: false|

### Association
- has_many :items 
- has_ancestry

