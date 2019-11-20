class CreateClubMatches < ActiveRecord::Migration[5.2]
  def change
    create_table :club_matches do |t|
      t.belongs_to :club
      t.belongs_to :user
      t.boolean :matched

      t.timestamps
    end
  end
end
