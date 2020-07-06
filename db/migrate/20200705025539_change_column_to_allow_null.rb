class ChangeColumnToAllowNull < ActiveRecord::Migration[5.2]
  def up
    change_column :adresses, :building,:string, null: true
  end

  def down
    change_column :adresses, :building,:string, null: false
  end
end
