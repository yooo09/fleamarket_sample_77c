class AddPriceToItemes < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :price, :integer, null: false
  end
end
