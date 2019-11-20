class NewForeignKeyClubMatch < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :club_matches, :club_id
  end
end