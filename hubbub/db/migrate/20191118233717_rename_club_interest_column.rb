class RenameClubInterestColumn < ActiveRecord::Migration[5.2]
  def change
    rename_column :club_interests, :user_id, :club_id
  end
end
