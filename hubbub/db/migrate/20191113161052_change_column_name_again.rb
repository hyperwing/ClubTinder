class ChangeColumnNameAgain < ActiveRecord::Migration[5.2]
  def change
    rename_column :club_matches, :club_name, :club_id
  end
end
