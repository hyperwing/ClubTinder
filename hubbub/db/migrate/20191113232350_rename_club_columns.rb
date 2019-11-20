class RenameClubColumns < ActiveRecord::Migration[5.2]
  # Edited 11/13/2019 by Leah Gillespie
  def change
    remove_column :clubs, :services
    rename_column :clubs, :location, :service
    rename_column :clubs, :link, :location
    rename_column :clubs, :affiliations, :link
    rename_column :clubs, :img_url, :affiliations
  end
end
