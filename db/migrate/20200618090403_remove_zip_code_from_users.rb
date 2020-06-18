class RemoveZipCodeFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :zip_code, :integer
    remove_column :users, :prefecture, :string
    remove_column :users, :city, :string
    remove_column :users, :house_number
    remove_column :users, :building, :string
    remove_column :users, :phone_number, :integer
    remove_column :users, :user_id, :references
  end
end
