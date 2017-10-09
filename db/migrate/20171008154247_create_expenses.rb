class CreateExpenses < ActiveRecord::Migration[5.1]
  def change
    create_table :expenses do |t|
      t.string :expenseid
      t.string :groupid
      t.decimal :expense
      t.references :group, foreign_key: true

      t.timestamps
    end
  end
end
