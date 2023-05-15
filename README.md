# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

Job Player Team Match Tournament

Player belongs_to Job
Job has_many players

Tournament belongs_to Match

rails g model Job name:string
rails g model Team name:string town:string
rails g model Player name:string job:references team:references
rails g Tournament name:string
rails g migration AddTournamentToTeam tournament:references
rails g model Match name:string team1:string team2:string tournament:references score1:integer score2:integer km1
