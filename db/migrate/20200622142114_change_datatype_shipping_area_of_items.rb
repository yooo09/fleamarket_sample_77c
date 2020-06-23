class ChangeDatatypeShippingAreaOfItems < ActiveRecord::Migration[5.2]
  def change
    change_column :items, :shipping_area, :integer
    change_column :items, :delivery_fee, :string
    change_column :items, :delivery_time, :string
  end
end
