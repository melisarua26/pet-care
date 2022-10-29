class AddColumnToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :name, :string
    add_column :users, :surname, :string
    add_column :users, :address, :string
    add_column :users, :telephone_number, :string
    add_column :users, :city, :string
    add_column :users, :country, :string
    add_column :users, :cc, :string
  end
end
