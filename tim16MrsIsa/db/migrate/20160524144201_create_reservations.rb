class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.integer :user_id
      t.integer :reservation_id
      t.string :date
      t.string :time
      t.string :duration
      t.integer :table

      t.timestamps null: false
    end
  end
end
