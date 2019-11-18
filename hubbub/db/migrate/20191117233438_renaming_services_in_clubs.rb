class RenamingServicesInClubs < ActiveRecord::Migration[5.2]
  def change
    rename_column :clubs, :service, :img
  end
end
