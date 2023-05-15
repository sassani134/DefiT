class PlayersController < ApplicationController
  before_action :set_player, only: %i[ show edit update destroy ]
  before_action :select_options, only: %i[ new edit ]

  @Teams = Team.all
  def index
    @players = Player.all
  end

  def show
  end

  def edit
  end

  def new
    @player = Player.new
  end



  def create
    @player = Player.new(player_params)

    respond_to do |format|
      if @player.save
        format.html { redirect_to player_url(@player), notice: "Player prêt pour le mercato" }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @playeur.update(player_params)
        format.html { redirect_to player_url(@player), notice: "Player Modifie." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @player.destroy

    respond_to do |format|
      format.html { redirect_to players_url, notice: "retraite du playeur" }
    end
  end

  private
  def set_player
    @player = Player.find(params[:id])
  end

  def player_params
    params.require(:player).permit(:name, :job_id, :team_id)
  end

  def select_options
    @jobs = Job.all
    @Teams = Team.all
  end

end
