class RenameCustomerIdColumnToItems < ActiveRecord::Migration[5.2]
  def change
    rename_column :items, :customer_id, :buyer_id
  end
end
