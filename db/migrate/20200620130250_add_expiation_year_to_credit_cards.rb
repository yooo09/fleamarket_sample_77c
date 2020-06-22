class AddExpiationYearToCreditCards < ActiveRecord::Migration[5.2]
  def change
    add_column :credit_cards, :expiation_year, :integer, null: false
  end
end
