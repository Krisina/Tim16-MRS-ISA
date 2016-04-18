class CreateFriends < ActiveRecord::Migration
  def change
    create_table :friends do |t|
		t.string :email
		t.string :ime
		t.string :prezime
		t.string :adresa
      t.timestamps null: false
    end
  end
end
