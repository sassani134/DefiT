class AddTournamentToTeam < ActiveRecord::Migration[7.0]
  def change
    add_reference :teams, :tournament, foreign_key: true
  end
end
