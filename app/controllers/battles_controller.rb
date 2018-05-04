class BattlesController < ApplicationController
  before_action :set_battle, only: [:show]
	def index
		@battles = Battle.order(id: :desc)
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
    #Valida que el suuario pueda luchar
    if !usuario.status
      redirect_to user_path(usuario.id), notice: "El usuario no posee vidas" and return
    end
    @battle = Battle.new(battle_params)
    @battle.result = Battle.resultado  
    @battle.character_id = Battle.getCharacterBattle
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
    faltantes = User.where(:status => true).count
    if faltantes > 0
      Battle.rondaBatallas
      redirect_to battles_path, notice: "Ronda de batallas finalizada"
    else
      redirect_to battles_path, notice: "No posee usuarios con vida"
    end
    
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
