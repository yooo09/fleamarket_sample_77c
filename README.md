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
|nickname|string|null: false,unique: true,index: true|
|email|integer|null: false,unique: true|
|password|integer|null: false|
|last_name|string|null: false|
|first_name|string|null: false|
|last_name_kana|string|null: false|
|first_name_kana|string|null: false|
|birthday|integer|null: false|


### Association
- has_many :credit_cards
- has_many :items
- has_many :adresses


## adresses table
|Colm|Type|Option|
|----|----|------|
|zip_code|integernull: false|
|prefecture|string|null: false|
|city|string|null: false|
|house_number|integer|null: false|
|building|string|null: false|
|phone_number|integer|null: false|


### Association
- belongs_to :user



## credit_card table
|Colm|Type|Option|
|----|----|------|
|credit_card_type|string|null: false|
|card_number|integer|null:false|
|CVS|integer|null:false|
|Expiration_date|date|null: false|
|user_id||reference|foreginkey: true|

### Association
- belongs_to :user



## itemes table
|Colm|Type|Option|
|----|----|------|
|item_name|string|null: false|
|item_detail|text|
|category|string
|brand|string|
|delivery_fee|integer|null: false|
|shippig_area|string|null: false|
|delivery_time|integer|null: false|
|price|integer|null:false|
|user_id|reference|foreginkey: true|

### Association
- belongs_to :user
- belongs_to :category
- belongs_to :brand
- belongs_to :condition
- has_many :images


## images table
|image|text|null: false|
|item_id|reference|null: false,foreginkey: true|

### Association
- belongs_to :item



## categories table
|Colm|Type|Option|
|----|----|------|
|category_name|string|null: false|

### Association
- has_many :items




##  brands
|Colm|Type|Option|
|----|----|------|
|brand_name|string|null: false|

### Association
- has_many :items




## conditions
|Colm|Type|Option|
|----|----|------|
|condition|integer|null: false|

### Association
- has_many :items













