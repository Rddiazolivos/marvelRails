class BattlesController < ApplicationController
	def index
		@battles = Battle.all
	end

	# GET /battles/new
  def new
  	@users = User.all
    @battle = Battle.new
  end

  # POST /battles
  # POST /battles.json
  def create
    @battle = Battle.new(battle_params)

    respond_to do |format|
      if @battle.save
        format.html { redirect_to @battle, notice: 'battle was successfully created.' }
        format.json { render :show, status: :created, location: @battle }
      else
        format.html { render :new }
        format.json { render json: @battle.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_battle
      @battle = Battle.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def battle_params
      params.require(:battle).permit(:name)
    end

end