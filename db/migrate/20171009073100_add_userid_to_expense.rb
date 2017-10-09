class AddUseridToExpense < ActiveRecord::Migration[5.1]
  def change
    add_column :expenses, :userid, :string
  end
end
