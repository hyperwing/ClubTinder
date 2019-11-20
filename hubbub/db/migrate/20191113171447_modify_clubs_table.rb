class ModifyClubsTable < ActiveRecord::Migration[5.2]
  def change
    remove_column :clubs, :string
    rename_column :clubs, :other, :services
  end
end
