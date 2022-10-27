class AddColumnToVets < ActiveRecord::Migration[7.0]
  def change
    add_column :vets, :name, :string
    add_column :vets, :surname, :string
    add_column :vets, :description, :string
    add_column :vets, :specialty, :string
    add_column :vets, :telephone_number, :string
    add_column :vets, :city, :string
    add_column :vets, :country, :string
    add_column :vets, :cc, :string
  end
end
