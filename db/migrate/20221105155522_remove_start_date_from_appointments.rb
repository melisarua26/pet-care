class RemoveStartDateFromAppointments < ActiveRecord::Migration[7.0]
  def change
    remove_column :appointments, :start_date, :datetime
  end
end
