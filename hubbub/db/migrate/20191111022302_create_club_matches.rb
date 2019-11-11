class CreateClubMatches < ActiveRecord::Migration[5.2]
  def change
    create_table :club_matches do |t|
      t.integer :user_id
      t.integer :club_id
      t.integer :matched

      t.timestamps
    end
  end
end
