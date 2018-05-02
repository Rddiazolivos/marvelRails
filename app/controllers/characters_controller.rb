require 'digest/md5'
class CharactersController < ApplicationController
  include HTTParty
  before_action :set_character, only: [:show, :edit, :update, :destroy]

  # GET /characters
  # GET /characters.json
  def index
    if !params[:page].nil?
      offsetCal = (params[:page].to_i * 18) - 18
      @numeroPag  = params[:page].to_i
    else
      offsetCal = 0
      @numeroPag  = 1
    end
    query = { 
      "limit"       => 18,
      "offset"      => offsetCal,
      "apikey"      => 'c290f2f4d5816c7da871c60303b10a9c',
      "ts"          => '1',
      "hash"        => Digest::MD5.hexdigest('14a3d0f1b2198c665b8143755d81a1c25f40899f9c290f2f4d5816c7da871c60303b10a9c'),
    }
    response = HTTParty.get("https://gateway.marvel.com:443/v1/public/characters", :query => query , format: :json)
    if response.code == 200
      cantPag = response.parsed_response['data']['total'] / 18
      if cantPag % 2 == 0
       @paginas = cantPag +1
      else
        @paginas =  cantPag
      end
      @characters = response.parsed_response['data']['results']      
    end
  end

  # GET /characters/1
  # GET /characters/1.json
  def show
  end

  # GET /characters/new
  def new
    @character = Character.new
  end

  # GET /characters/1/edit
  def edit
  end

  # POST /characters
  # POST /characters.json
  def create
    @character = Character.new(character_params)

    respond_to do |format|
      if @character.save
        format.html { redirect_to @character, notice: 'Character was successfully created.' }
        format.json { render :show, status: :created, location: @character }
      else
        format.html { render :new }
        format.json { render json: @character.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /characters/1
  # PATCH/PUT /characters/1.json
  def update
    respond_to do |format|
      if @character.update(character_params)
        format.html { redirect_to @character, notice: 'Character was successfully updated.' }
        format.json { render :show, status: :ok, location: @character }
      else
        format.html { render :edit }
        format.json { render json: @character.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /characters/1
  # DELETE /characters/1.json
  def destroy
    @character.destroy
    respond_to do |format|
      format.html { redirect_to characters_url, notice: 'Character was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_character
      @character = Character.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def character_params
      params.require(:character).permit(:name)
    end
end
