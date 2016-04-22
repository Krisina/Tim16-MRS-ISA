class AddImePrezimeAdresaToUsers < ActiveRecord::Migration
  def change
    add_column :users, :ime, :string
    add_column :users, :prezime, :string
    add_column :users, :adresa, :string
  end
end
