class FixColumnDataMatches < ActiveRecord::Migration[5.2]
  def change
    change_column :club_matches, :club_name, :string
  end
end
