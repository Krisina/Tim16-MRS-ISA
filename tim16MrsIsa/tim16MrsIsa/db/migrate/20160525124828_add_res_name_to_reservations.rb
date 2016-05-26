class AddResNameToReservations < ActiveRecord::Migration
  def change
    add_column :reservations, :ResName, :string
  end
end
