class RemoveCvsToCreditCards < ActiveRecord::Migration[5.2]
  def change
    remove_column :credit_cards, :cvs, :integer
    remove_column :credit_cards, :expiation_date, :integer
    remove_column :credit_cards, :card_number, :string
    remove_column :credit_cards, :credit_card_type, :string
    remove_column :credit_cards, :expiation_year, :integer
  end
end