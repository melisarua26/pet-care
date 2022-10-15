class CreateVetRecords < ActiveRecord::Migration[7.0]
  def change
    create_table :vet_records do |t|
      t.date :date
      t.references :appointment, null: false, foreign_key: true
      t.string :type
      t.date :followup_date
      t.string :description

      t.timestamps
    end
  end
end
