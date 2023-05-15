bin/dev
rails db:create


rails g model Job name
rails g model Team name town
rails g model Player name job:references team:references

-- rails c test
    - Player.first.team.name
    - !!!!! Team.first.player.first
    - /home/nigaz/.rbenv/versions/3.1.2/lib/ruby/gems/3.1.0/gems/activemodel-7.0.4.3/lib/active_model/attribute_methods.rb:458:in `method_missing': undefined method `player' for #<Team id: 1, name: "Probesys_Esport_tiger", town: "Grenoble", created_at: "2023-05-14 18:49:21.639252000 +0000", updated_at: "2023-05-14 18:49:21.639252000 +0000"> (NoMethodError)          


    rails g Tournament name:string
    rails g migration AddTournamentToTeam tournament:references
    rails g model Match name:string team1:string kr1:integer km1:integer team2:string kr2:integer km2:integer tournament:references victory:string

-- rails c test
    - Match.first.team1
    - Match.first.team2
    - Match.first.tournament.name
    - Match.first.tournament.team
    - Match.first.tournament.team.first
    - Match.first.tournament.team.first.player.first
    - Match.first.tournament.team.first.player.first.job.name
    - Match.first.tournament.team.first.player.first.job
    - Team.first.players
    - Team.first.players.first.job

    rails g migation create_join_table tournaments teams