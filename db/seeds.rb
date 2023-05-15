# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed Starter.md (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Job.create!(name:"Healer")
Job.create!(name:"Tank")
Job.create!(name:"DPS")

Team.create!(name:"Probesys_Esport_tiger", town:"Grenoble")
Team.create!(name:"Probesys_Esport_lion", town:"Meylan")

Player.create!(name:"Toto", job_id: 1, team_id: 1)
Player.create!(name:"Tata", job_id: 2, team_id: 1)
Player.create!(name:"Titi", job_id: 3, team_id: 1)

Player.create!(name:"Tutu", job_id: 1, team_id: 2)
Player.create!(name:"Tete", job_id: 2, team_id: 2)
Player.create!(name:"Tiki", job_id: 3, team_id: 2)

Tournament.create!(name:"Tournament1")
Tournament.create!(name:"Tournament2")

#Team.first.update!(players_attributes: [{name: "Toto", job_id: 1}, {name: "Tata", job_id: 2}, {name: "Titi", job_id: 3}])
#Team.last.update!(players_attributes: [{name: "Tutu", job_id: 1}, {name: "Tete", job_id: 2}, {name: "Tiki", job_id: 3}])
Team.first.update!(tournament_id: 1)
Team.last.update!(tournament_id: 1)
Team.first.update!(tournament_id: 2)
Team.last.update!(tournament_id: 2)

Match.create!(name:"Match1", team1:"Probesys_Esport_tiger", kr1: 1, km1: 1, team2:"Probesys_Esport_lion", kr2: 1, km2: 1, tournament_id: 1, victory: "Probesys_Esport_tiger")
Match.create!(name:"Match2", team1:"Probesys_Esport_tiger", kr1: 1, km1: 1, team2:"Probesys_Esport_lion", kr2: 1, km2: 1, tournament_id: 1, victory: "Probesys_Esport_lion")