class TournamentsController < ApplicationController
  require 'faker'
  require 'byebug'
  before_action :set_tournament, only: %i[ show edit update destroy]

  def index
    @tournaments = Tournament.all
  end

  def show
  end

  def new
    @tournament = Tournament.new
  end

  def edit
  end

  def create
    @tournament = Tournament.new(tournament_params)

    respond_to do |format|
      if @tournament.save
        format.html { redirect_to tournament_url(@tournament), notice: "Tournament was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @tournament.update(tournament_params)
        format.html { redirect_to tournament_url(@tournament), notice: "Tournament was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @tournament.destroy

    respond_to do |format|
      format.html { redirect_to tournaments_url, notice: "Tournament was successfully destroyed." }
    end
  end


  def  generateMatches
    #Match(id: integer, name: string, team1: string, kr1: integer, km1: integer, team2: string, kr2: integer, km2: integer, tournament_id: integer, victory: string, created_at: datetime, updated_at: datetime)

    @tournament = Tournament.find(params[:id])
    @tournament.teams.each do |team|
      @tournament.teams.each do |team2|
        if team != team2
          match = Match.new
          match = "Match #{team.name} vs #{team2.name}"
          match.team1 = team.name
          match.team2 = team2.name
          match.kr1 = rand(0..10)
          match.km1 = rand(0..10)
          match.kr2 = rand(0..10)
          match.km2 = rand(0..10)
          match.tournament_id = @tournament.id
          match.victory = ["#{match.team1}", "#{match.team2}", "Egalité"].sample
          match.save
        end
      end
    end
    redirect_to tournament_url(@tournament), notice: "Matchs générés"

  end

  #Un bouton permet de créer et peupler automatiquement 8 équipes de 11 joueurs
  def random_tournament
    #Team(id: integer, name: string, tournament_id: integer, created_at: datetime, updated_at: datetime)
    #Player(id: integer, name: string, team_id: integer, created_at: datetime, updated_at: datetime)
    @random_tournament = Tournament.new
    @random_tournament.name = Faker::Games::SuperSmashBros.stage
    @random_tournament.save

    #Création de 8 équipes
    8.times do
      team = Team.new
      team.name = Faker::Esport.team
      team.tournament_id = @random_tournament.id
      team.save
    end

    #Player(id: integer, name: string, job_id: integer, team_id: integer, created_at: datetime, updated_at: datetime)
    #Création de 11 joueurs par équipe
    Team.all.each do |team|
      11.times do
        player = Player.new
        player.name = Faker::Games::SuperSmashBros.fighter
        player.job_id = rand(1..3)
        player.team_id = team.id
        player.save
      end
    end

    @random_tournament.teams.each do |team|
      @random_tournament.teams.each do |team2|
        if team != team2
          match = Match.new
          match = "Match #{team.name} vs #{team2.name}"
          match.team1 = team.name
          match.team2 = team2.name
          match.kr1 = rand(0..10)
          match.km1 = rand(0..10)
          match.kr2 = rand(0..10)
          match.km2 = rand(0..10)
          match.tournament_id = @random_tournament.id
          match.save
        end
      end
    end

    redirect_to root_url, notice: "Tournoi généré"
  end


  #Le résultat des matchs est afficher correctement (Voir Tableau ci-dessus pour la méthode de calcul)
  def classement
    #byebug
    @tournament = Tournament.find(params[:tournament_id])

    @teams = @tournament.teams
    @matches = @tournament.matches

    @teams.each do |team|
      @matches.each do |match|
        if match.victory == team.name
          @team_point += 3
        elsif match.victory == "Egalité"
          @team_point += 1
        end
        if match.team1 == team.name
          @team_kr += match.kr1
          @team_km += match.km1
        elsif match.team2 == team.name
          @team_kr += match.kr2
          @team_kl += match.km2
        end
        @t_class +=  {team: team.name, point: @team_point, kr: @team_kr, km: @team_km}
      end
    end
  end


  #@tournament.matches.WHere(team1: team.name).each do |match|

  private
  def set_tournament
    @tournament = Tournament.find(params[:id])
  end

  def tournament_params
    params.require(:tournament).permit(:name)
  end
end
