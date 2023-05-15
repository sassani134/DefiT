class CreateMatches < ActiveRecord::Migration[7.0]
  def change
    create_table :matches do |t|
      t.string :name
      t.string :team1
      t.integer :kr1
      t.integer :km1
      t.string :team2
      t.integer :kr2
      t.integer :km2
      t.references :tournament, null: false, foreign_key: true
      t.string :victory

      t.timestamps
    end
  end
end
