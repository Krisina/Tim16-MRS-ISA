class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
		t.string :email
    	t.string :encrypted_password 
    	t.string :salt
		t.string :ime
		t.string :prezime
		t.string :adresa
      	t.timestamps
      t.timestamps null: false
    end
  end
end
