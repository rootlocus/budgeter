class RemoveOwneridFromGroup < ActiveRecord::Migration[5.1]
  def change
    remove_column :groups, :ownerid, :string
  end
end
