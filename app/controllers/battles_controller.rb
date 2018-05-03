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
  	@users = User.all  	
    usuario = User.find(params[:battle][:user_id])
    if usuario.status
      redirect_to user_path(usuario.id) and return
    end
    @battle = Battle.new(battle_params)
    @battle.result = Battle.resultado
    personaje = Battle.last
    if personaje.nil?
      code = Character.first
      code = code.id
    else
      code = personaje.character_id
      code = code +1
    end
    @battle.character_id = code
    if @battle.result 
    	User.setPuntaje(params[:battle][:user_id])
    else
      User.setEstado(params[:battle][:user_id])
    end

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

  def batalla
    user = User.find(params['user_id'])
    redirect_to :root if user.status
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_battle
      @battle = Battle.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def battle_params
      params.require(:battle).permit(:user_id)
    end

end
