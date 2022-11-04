class ChangeDateName < ActiveRecord::Migration[7.0]
  def change
    remove_column :appointments, :date, :date
    add_column  :appointments, :start_date, :datetime
    add_column  :appointments, :end_date, :datetime
    add_column  :appointments, :title, :string
    add_column  :appointments, :description, :text
  end
end
