class FixColumnNameMatches < ActiveRecord::Migration[5.2]
  def change
    rename_column :club_matches, :club_id, :club_name
  end
end
