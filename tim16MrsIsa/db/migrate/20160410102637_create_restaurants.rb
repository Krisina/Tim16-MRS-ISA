class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.text :name
      t.text :distance
      t.text :rating
      t.text :friends
      t.text :reservation

      t.timestamps null: false
    end
  end
end
