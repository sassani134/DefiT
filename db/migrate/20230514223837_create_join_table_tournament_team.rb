class CreateJoinTableTournamentTeam < ActiveRecord::Migration[7.0]
  def change
    create_join_table :tournaments, :teams do |t|
      t.index [:tournament_id, :team_id]
      t.index [:team_id, :tournament_id]
    end
  end
end
