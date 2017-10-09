class CreateGroups < ActiveRecord::Migration[5.1]
  def change
    create_table :groups do |t|
      t.string :groupid
      t.string :ownerid
      t.string :groupname

      t.timestamps
    end
  end
end
