class ChangeColumn < ActiveRecord::Migration[5.1]
  def change
    change_column :expenses, :expense, :decimal, :precision => 10, :scale => 2
  end
end
