class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :userid
      t.string :name
      t.references :group, foreign_key: true
      t.references :expense, foreign_key: true

      t.timestamps
    end
  end
end
