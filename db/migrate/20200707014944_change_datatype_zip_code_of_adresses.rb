class ChangeDatatypeZipCodeOfAdresses < ActiveRecord::Migration[5.2]
  def change
    change_column :adresses, :zip_code, :string
    change_column :adresses, :house_number, :string
  end
end
