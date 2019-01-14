class TableGamesController < ApplicationController
  before_action :set_table_game, only: [:show, :edit, :update, :destroy]

  # GET /table_games
  # GET /table_games.json
  def index
    @table_games = TableGame.all
  end

  # GET /table_games/1
  # GET /table_games/1.json
  def show
  end

  # GET /table_games/new
  def new
    @table_game = TableGame.new
  end

  # GET /table_games/1/edit
  def edit
  end

  # POST /table_games
  # POST /table_games.json
  def create
    @table_game = TableGame.new(table_game_params)

    respond_to do |format|
      if @table_game.save
        format.html { redirect_to @table_game, notice: 'Table game was successfully created.' }
        format.json { render :show, status: :created, location: @table_game }
      else
        format.html { render :new }
        format.json { render json: @table_game.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /table_games/1
  # PATCH/PUT /table_games/1.json
  def update
    respond_to do |format|
      if @table_game.update(table_game_params)
        format.html { redirect_to @table_game, notice: 'Table game was successfully updated.' }
        format.json { render :show, status: :ok, location: @table_game }
      else
        format.html { render :edit }
        format.json { render json: @table_game.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /table_games/1
  # DELETE /table_games/1.json
  def destroy
    @table_game.destroy
    respond_to do |format|
      format.html { redirect_to table_games_url, notice: 'Table game was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_table_game
      @table_game = TableGame.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def table_game_params
      params.require(:table_game).permit(:show_chars, :words)
    end
end
