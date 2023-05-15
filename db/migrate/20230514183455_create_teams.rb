class CreateTeams < ActiveRecord::Migration[7.0]
  def change
    create_table :teams do |t|
      t.string :name, null: false , unique: true, limit: 50
      t.string :town, null: false

      t.timestamps
    end
  end
end
