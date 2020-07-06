class ChangePhoneNumberOfAdresses < ActiveRecord::Migration[5.2]
  def up
    change_column :adresses, :phone_number,:string
    rename_column :adresses, :user_id, :user_id_id
  end
end
