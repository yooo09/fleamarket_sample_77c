class ChangePhoneNumberOfAdresses < ActiveRecord::Migration[5.2]
  def up
    change_column :adresses, :phone_number,:string
  end
end
