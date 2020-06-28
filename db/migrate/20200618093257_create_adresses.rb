class CreateAdresses < ActiveRecord::Migration[5.2]
  def change
    create_table :adresses do |t|
      t.integer :zip_code, null: false
      t.string :prefecture, null: false
      t.string :city, null: false
      t.integer :house_number, null: false
      t.string :building, null: false
      t.integer :phone_number, null: false
      t.references :user_id, null: false, foreignkey: true

      t.timestamps
    end
  end
end
