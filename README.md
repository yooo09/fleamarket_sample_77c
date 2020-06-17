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
|last_name_kannji|string|null: false|
|first_name_kanji|string|null: false|
|last_name_kana|string|null: false|
|first_name_kana|string|null: false|
|birthday|integer|null: false|
|zip_code|integernull: false|
|prefecture|string|null: false|
|city|string|null: false|
|house_number|integer|null: false|
|building|string|null: false|
|phone_number|integer|null: false|

### Association
- has_many :credit_card
- has_many :items




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



## itemss table
|Colm|Type|Option|
|----|----|------|
|image|text|
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
- has_many :categoris through: :item_categoies
- has_many :brand through: :items_categories 
- has_many :condition





## categories table
|Colm|Type|Option|
|----|----|------|
|name|string|

### Association
- belongs_to :items


## items_categories table
|Colm|Type|Option|
|----|----|------|
|user|reference|null: false,foreginkey: true|
|category||reference|foreginkey: true|

### Association
- belongs_to :items
- belongs_to :categories 




##  brand
|Colm|Type|Option|
|----|----|------|
|brand_name|integr|

### Association
- belongs_to :items




##  itme-brand
|Colm|Type|Option|
|----|----|------|
|item-id|reference|foreginkey: true|
|brand-id|reference|foreginkey: true|

### Association
- belongs_to :items
- belongs_to :brand



## condition
|Colm|Type|Option|
|----|----|------|
|condition|integer|null: false|
|itme_id|reference|null: false||foreginkey: true|

### Association
- belongs_to :items




##  item-condition
|Colm|Type|Option|
|----|----|------|
|item_id|reference|null: false||foreginkey: true|
|condition_id|reference|null: false||foreginkey: true|

### Association
- belongs_to :items









