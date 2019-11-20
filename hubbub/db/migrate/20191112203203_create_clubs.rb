class CreateClubs < ActiveRecord::Migration[5.2]
  def change
    create_table :clubs do |t|
      t.string :name
      t.string :string
      t.string :mission
      t.string :string
      t.string :affiliations
      t.string :string
      t.string :link
      t.string :string
      t.string :img_url
      t.string :string
      t.string :location
      t.string :string
      t.string :other
      t.string :string

      t.timestamps
    end
  end
end
