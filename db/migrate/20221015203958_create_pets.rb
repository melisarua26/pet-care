class CreatePets < ActiveRecord::Migration[7.0]
  def change
    create_table :pets do |t|
      t.string :name
      t.references :user, null: false, foreign_key: true
      t.string :gender
      t.date :birthdate
      t.string :specie
      t.string :breed

      t.timestamps
    end
  end
end
