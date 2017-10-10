class RemoveUseridFromExpense < ActiveRecord::Migration[5.1]
  def change
    remove_column :expenses, :userid, :string
  end
end
