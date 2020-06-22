class EditCreditCards < ActiveRecord::Migration[5.2]
  def change
    remove_column :credit_cards, :expiation_year, :integer
    add_column :credit_cards, :customer_id, :string, null:false
    add_column :credit_cards, :card_id, :string, null:false
  end
end
