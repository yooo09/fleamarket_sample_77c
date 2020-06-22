class CreateCreditCards < ActiveRecord::Migration[5.2]
  def change
    create_table :credit_cards do |t|
      t.integer :cvs, null: false
      t.integer :expiation_date, null: false
      t.string :card_number, null: false
      t.string :credit_card_type, null: false
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
