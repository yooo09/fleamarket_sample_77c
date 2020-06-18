class AddDetailsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :nickname, :string, null: false
    add_column :users, :last_name, :string, null: false
    add_column :users, :first_name, :string, null: false
    add_column :users, :last_name_kana, :string, null: false
    add_column :users, :first_name_kana, :string, null: false
    add_column :users, :birthday, :integer, null: false
    add_column :users, :zip_code, :integer, null: false
    add_column :users, :prefecture, :string, null: false
    add_column :users, :city, :string, null: false
    add_column :users, :house_number, :integer, null: false
    add_column :users, :building, :string, null: false
    add_column :users, :phone_number, :integer, null: false
    add_column :users, :user_id, :references, null: false, foreign_key: true
  end
end
