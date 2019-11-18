# Edited 11/17/2019 by Leah Gillespie
class CreateClubInterests < ActiveRecord::Migration[5.2]
  def change
    create_table :club_interests do |t|
      t.belongs_to :user
      t.belongs_to :interest
      t.timestamps
    end
  end
end
