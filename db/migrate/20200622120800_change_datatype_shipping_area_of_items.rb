class ChangeDatatypeShippingAreaOfItems < ActiveRecord::Migration[5.2]
  def change
    change_column :item, :shipping_area, :integer
    change_column :item, :delivery_time, :string
    change_column :item, :delivery_fee, :string
  end
end
