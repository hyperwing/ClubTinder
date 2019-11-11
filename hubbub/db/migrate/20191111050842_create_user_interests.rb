class CreateUserInterests < ActiveRecord::Migration[5.2]
  def change
    create_table :user_interests do |t|
      t.integer :interest_id
      t.integer :user_id

      t.timestamps
    end
  end
end
