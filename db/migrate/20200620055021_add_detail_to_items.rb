class AddDetailToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :detail, :text
    add_column :items, :condition, :integer, null: false, default:0
    add_column :items, :delivery_fee, :integer, null:false
    add_column :items, :shipping_area, :string ,null:false
    add_column :items, :delivery_time, :integer ,null:false
    add_column :items, :user_id, :integer ,null:false  ,foreign_key: true
    add_column :items, :brand_id, :integer ,foreign_key: true
    add_column :items, :category_id, :integer ,foreign_key: true
    remove_column :items, :image, :text
  end
end