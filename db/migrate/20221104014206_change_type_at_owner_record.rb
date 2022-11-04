class ChangeTypeAtOwnerRecord < ActiveRecord::Migration[7.0]
  def change
    rename_column :owner_records, :type, :title
  end
end
