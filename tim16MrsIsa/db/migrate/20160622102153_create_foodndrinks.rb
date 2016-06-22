class CreateFoodndrinks < ActiveRecord::Migration
  def change
    create_table :foodndrinks do |t|
      t.integer :user_id
      t.integer :foodndrink_id
      t.string :food
      t.string :drink

      t.timestamps null: false
    end
  end
end
