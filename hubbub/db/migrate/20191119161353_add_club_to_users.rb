class AddClubToUsers < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :club, foreign_key: true
  end
end
