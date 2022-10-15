class CreateOwnerRecords < ActiveRecord::Migration[7.0]
  def change
    create_table :owner_records do |t|
      t.references :pet, null: false, foreign_key: true
      t.string :description
      t.string :type
      t.date :date

      t.timestamps
    end
  end
end
